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

        first_level_requirements = response.xpath("//div[@id='job-requirements']//child::text()").extract()
        if not first_level_requirements:

            second_level_requirements = response.xpath(
                """//div[@id='job-description']//child::*[
                contains(text(), 'have') or contains(text(), 'Have') or contains(text(), 'need') 
                or contains(text(), 'Need') or contains(text(), 'skills') or contains(text(), 'Skills')
                or contains(text(), 'Requirements') or contains(text(), 'requirements') or contains(text(), 'be able') 
                or contains(text(), 'Qualifications') or contains(text(), 'qualifications')
                or contains(text(), 'criteria') or contains(text(), 'Criteria') or contains(text(), 'Role') 
                or contains(text(), 'role') or contains(text(), 'Responsibilities') or contains(text(), 'responsibilities') 
                or contains(text(), 'Description') or contains(text(), 'description') or contains(text(), 'Job') 
                or contains(text(), 'job') or contains(text(), 'γνώσεις') or contains(text(), 'Γνώσεις') 
                or contains(text(), 'Αρμοδιότητες') or contains(text, 'αρμοδιότητες') or contains(text(), 'Χαρακτηριστικά') 
                or contains(text(), 'χαρακτηριστικά') or contains(text(), 'προσόντα') or contains(text(), 'Προσόντα')
                ]//following::li/text()"""
            ).extract()
            job_requirements = second_level_requirements

            if not second_level_requirements:
                job_requirements = response.xpath("//div[@id='job-description']//child::text()").extract()
        else:
            job_requirements = first_level_requirements

        items["job_title"] = extracted_title.strip('\n')
        items["job_requirements"] = " ".join(job_requirements)

        items["job_post_url"] = response.request.url
        items["page_context"] = response.text
        return items
