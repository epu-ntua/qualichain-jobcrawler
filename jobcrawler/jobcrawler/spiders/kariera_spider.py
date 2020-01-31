import scrapy
import urllib.parse

from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor

from jobcrawler.jobcrawler.items import JobcrawlerItem


class KarieraSpider(CrawlSpider):
    """This is a Recursive Scrapy Spider builted for Kariera.gr"""

    name = "kariera"

    def __init__(self, *a, **kwargs):
        super().__init__(*a, **kwargs)

        self.query = kwargs["query"]
        self.allowed_domains = ["kariera.gr"]
        self.start_urls = [
            "https://www.kariera.gr/%CE%B8%CE%AD%CF%83%CE%B5%CE%B9%CF%82-%CE%B5%CF%81%CE%B3%CE%B1%CF%83%CE%AF%CE%B1%CF%82?q={}".format(
                urllib.parse.quote(self.query)
            )
        ]

    rules = (
        Rule(LinkExtractor(allow=('pg=[0-9]*')), follow=True),
        Rule(LinkExtractor(allow=(), restrict_xpaths=('//a[@class="job-title"]')), follow=True,
             callback="parse_items"),
    )

    def parse_items(self, response):
        """This function receives Websites response and extracts the required fields from that website
            using XPath Selectors
        """
        items = JobcrawlerItem()

        extracted_title = response.xpath('//h1[@class="pb col big no-mb"]/text()').extract()[0]

        items["job_title"] = extracted_title.strip('\n')
        items["job_post_url"] = response.request.url
        items["page_context"] = response.text
        return items
