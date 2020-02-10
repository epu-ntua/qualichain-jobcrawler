import scrapy

from urllib.parse import urljoin, quote
from scrapy import Selector
from scrapy.spiders import Spider
from datetime import datetime

from jobcrawler.items import JobcrawlerItem
from jobcrawler.settings import EXTENDED_REQUIREMENTS_STR
from jobcrawler.utils import change_url_params


class SkyWalkerSpider(Spider):
    """This is a Recursive Scrapy Spider builted for skywalker.gr"""
    name = "skywalker"

    custom_settings = {
        'DOWNLOAD_DELAY': 5,
    }

    def __init__(self, *a, **kwargs):
        super().__init__(*a, **kwargs)

        self.allowed_domains = ["skywalker.gr"]
        self.job_positions = kwargs["job_positions"].split(",")

        self.start_urls = [
            "https://www.skywalker.gr/elGR/anazitisi/aggelies-ergasias?perPage=20&page=1&sortBy=relative&keywords={}".format(
                quote(position)
            ) for position in self.job_positions
        ]

        self.requirements_xpath = """//div[@id='aggelia-text']//child::*[{}]//following::li//text()""".format(
            EXTENDED_REQUIREMENTS_STR
        )

    def parse(self, response):
        """
        This function is used to parse using Selenium Webdriver skywalker's start urls
        """
        s = Selector(response)

        page_nums = s.xpath('//ul[@class="paging-container"]//a[not(@class="current")]/@data-page').extract()
        print(page_nums)

        if page_nums:
            last_page = int(page_nums[-1])
        else:
            last_page = 2

        for page in range(1, last_page):
            next_url = change_url_params(page_num=str(page), url=response.url)
            yield scrapy.Request(next_url, callback=self.parse_inner_urls)

    def parse_inner_urls(self, response):
        """This function is used to parse job posting websites that are hidden with JS"""
        s = Selector(response)

        jobs_per_site = s.xpath('//div[@class="col-lg-12 col-md-12 col-sm-12 aggelia-view-title"]//a/@href').extract()
        print(jobs_per_site)

        for inner_site in jobs_per_site:
            url = urljoin("https://www.skywalker.gr/", inner_site)
            yield scrapy.Request(url, callback=self.parse_items)

    def parse_items(self, response):
        """This function is used to parse required items from skywalkers inner job posting URLs"""
        items = JobcrawlerItem()

        current_date = datetime.now()
        current_date_str = current_date.strftime("%b %d %Y %H:%M:%S")

        items["timestamp"] = current_date_str
        items["site"] = self.allowed_domains[0]
        items["full_html"] = response.text
        items["job_post_url"] = response.request.url
        items["full_text"] = " ".join(response.xpath('//div[@id="aggelia-text"]//text()').re('(\w+)'))

        extracted_title = response.xpath('//h3[@id="aggelia-title"]/text()').extract()
        if extracted_title:
            items["job_title"] = extracted_title[0]
        else:
            items["job_title"] = ""

        job_requirements = response.xpath(self.requirements_xpath).extract()
        requirements_list = list(filter(lambda item: item.strip() != '', job_requirements))
        items["job_requirements"] = " ".join(requirements_list).replace('\n', '')

        return items
