import scrapy

from urllib.parse import urljoin, quote
from scrapy import Selector
from scrapy.spiders import Spider, CrawlSpider, Rule
from datetime import datetime

from jobcrawler.items import JobcrawlerItem
from jobcrawler.settings import EXTENDED_REQUIREMENTS_STR
from jobcrawler.utils import change_url_params
from scrapy.linkextractors import LinkExtractor


class IndeedSpider(Spider):
    """This is a Recursive Scrapy Spider builted for https://gr.indeed.com/"""
    name = 'indeed'

    def __init__(self, *a, **kwargs):
        super().__init__(*a, **kwargs)

        self.allowed_domains = ["gr.indeed.com"]
        self.start_urls = [
            "https://gr.indeed.com/jobs?q=software+engineer"
        ]

    # rules = (
    #     Rule(LinkExtractor(restrict_xpaths=("//*[@class='title']//a")), follow=True),
    #     Rule(LinkExtractor(restrict_xpaths=('//div[@class="title"]//a')), follow=True,
    #          callback="parse_items"),
    # )

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
        print(response.url)
