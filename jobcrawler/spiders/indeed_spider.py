import scrapy

from urllib.parse import urljoin, quote
from scrapy import Selector
from scrapy.spiders import Spider
from datetime import datetime

from jobcrawler.items import JobcrawlerItem
from jobcrawler.settings import EXTENDED_REQUIREMENTS_STR


class IndeedSpider(Spider):
    """This is a Recursive Scrapy Spider builted for https://gr.indeed.com/"""
    name = 'indeed'

    def __init__(self, *a, **kwargs):
        super().__init__(*a, **kwargs)

        self.allowed_domains = ["gr.indeed.com"]
        self.job_positions = kwargs["job_positions"].split(',')

        self.start_urls = [
            "https://gr.indeed.com/jobs?q={}".format(
                quote(position)
            )for position in self.job_positions
        ]

    def parse(self, response):
        s = Selector(response)

        job_postings = s.xpath(
            "//div[@class='jobsearch-SerpJobCard unifiedRow row result clickcard']//div[@class='title']//a/@href").extract()
        next_pagination_result = s.xpath("//div[@class='pagination']//b//following-sibling::a/@href").extract_first()

        for job_url in job_postings:
            full_job_url = urljoin("https://gr.indeed.com/", job_url)
            yield scrapy.Request(full_job_url, callback=self.parse_items)

        if next_pagination_result:
            next_page_full_url = urljoin("https://gr.indeed.com/", next_pagination_result)
            yield scrapy.Request(next_page_full_url, callback=self.parse)

    def parse_items(self, response):
        items = JobcrawlerItem()

        current_date = datetime.now()
        current_date_str = current_date.strftime("%b %d %Y %H:%M:%S")

        items["timestamp"] = current_date_str
        items["site"] = self.allowed_domains[0]
        items["full_html"] = response.text
        items["job_post_url"] = response.request.url
        items["full_text"] = " ".join(response.xpath('//div[@id="jobDescriptionText"]//text()').re('(\w+)'))

        extracted_title = response.xpath('//h3[@class="icl-u-xs-mb--xs icl-u-xs-mt--none jobsearch-JobInfoHeader-title"]/text()').extract()
        if extracted_title:
            items["job_title"] = extracted_title[0]
        else:
            items["job_title"] = None

        job_requirements_li = response.xpath("""//div[@id='jobDescriptionText']//child::*[{}]//following-sibling::li/text()""".
                                          format(EXTENDED_REQUIREMENTS_STR)).extract()

        if job_requirements_li:
            job_requirements = job_requirements_li
        else:
            job_requirements = response.xpath("""//div[@id='jobDescriptionText']//child::*[{}]//following::p/text()""".
                                          format(EXTENDED_REQUIREMENTS_STR)).extract()

        requirements_list = list(filter(lambda item: item.strip() != '', job_requirements))
        items["job_requirements"] = " ".join(requirements_list).replace('\n', '')

        return items


