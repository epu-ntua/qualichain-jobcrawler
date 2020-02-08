import scrapy

from urllib.parse import urljoin
from scrapy import Selector
from scrapy.spiders import Spider
from datetime import datetime

from jobcrawler.utils import change_url_params


class SkyWalkerSpider(Spider):
    """This is a Recursive Scrapy Spider builted for skywalker.gr"""
    name = "skywalker"
    allowed_domains = ["skywalker.gr"]

    start_urls = [
        # "https://www.skywalker.gr/elGR/anazitisi/aggelies-ergasias?keywords=software%20engineer&page=1",
        "https://www.skywalker.gr/elGR/anazitisi/aggelies-ergasias?keywords=developer&page=1",
    ]

    def parse(self, response):
        """
        This function is used to parse using Selenium Webdriver skywalker's start urls
        """
        s = Selector(response)

        page_nums = s.xpath('//ul[@class="paging-container"]//a[not(@class="current")]/@data-page').extract()
        last_page = int(page_nums[-1])

        for page in range(1, last_page):
            next_url = change_url_params(page_num=str(page), url=response.url)
            yield scrapy.Request(next_url, callback=self.parse_inner_urls)

    def parse_inner_urls(self, response):
        """This function is used to parse job posting websites that are hidden with JS"""
        s = Selector(response)

        jobs_per_site = s.xpath('//div[@class="col-lg-12 col-md-12 col-sm-12 aggelia-view-title"]//a/@href').extract()

        for inner_site in jobs_per_site:
            url = urljoin("https://www.skywalker.gr/", inner_site)
            yield scrapy.Request(url, callback=self.parse_items)

    def parse_items(self, response):
        """This function is used to parse required items from skywalkers inner job posting URLs"""
        print(response.url)
        extracted_title = response.xpath('//h3[@id="aggelia-title"]/text()').extract()
        print(extracted_title)
        # items = JobcrawlerItem()

        # current_date = datetime.now()
        # current_date_str = current_date.strftime("%b %d %Y %H:%M:%S")
        #
        # items["timestamp"] = current_date_str
        # items["site"] = self.allowed_domains[0]
        # items["full_html"] = response.text
        # items["job_post_url"] = response.request.url
        # items["full_text"] = " ".join(response.xpath('//body//text()').re('(\w+)'))
        #
        # extracted_title = response.xpath('//h3[@id="aggelia-title"]/text()').extract()
        # if extracted_title:
        #     items["job_title"] = extracted_title[0]
        # else:
        #     items["job_title"] = ""
        #
        # job_requirements = response.xpath(
        #     """//div[@id='aggelia-text']//child::*[
        #     contains(text(), 'have') or contains(text(), 'Have') or contains(text(), 'need')
        #     or contains(text(), 'Need') or contains(text(), 'skills') or contains(text(), 'Skills')
        #     or contains(text(), 'Requirements') or contains(text(), 'requirements') or contains(text(), 'be able')
        #     or contains(text(), 'Qualifications') or contains(text(), 'qualifications')
        #     or contains(text(), 'criteria') or contains(text(), 'Criteria') or contains(text(), 'Role')
        #     or contains(text(), 'role') or contains(text(), 'Responsibilities') or contains(text(), 'responsibilities')
        #     or contains(text(), 'Description') or contains(text(), 'description') or contains(text(), 'Job')
        #     or contains(text(), 'job') or contains(text(), 'γνώσεις') or contains(text(), 'Γνώσεις')
        #     or contains(text(), 'Αρμοδιότητες') or contains(text, 'αρμοδιότητες') or contains(text(), 'Χαρακτηριστικά')
        #     or contains(text(), 'χαρακτηριστικά') or contains(text(), 'προσόντα') or contains(text(), 'Προσόντα')
        #     or contains(text(), 'education') or contains(text(), 'Education')
        #     or contains(text(), 'profile') or contains(text(), 'Profile')
        #     ]//following::li//text()"""
        # ).extract()
        #
        # requirements_list = list(filter(lambda item: item.strip() != '', job_requirements))
        # items["job_requirements"] = " ".join(requirements_list).replace('\n', '')
        # return items
