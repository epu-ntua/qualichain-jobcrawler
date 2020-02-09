import urllib.parse

from scrapy.spiders import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor
from datetime import datetime

from jobcrawler.items import JobcrawlerItem
from jobcrawler.settings import EXTENDED_REQUIREMENTS_STR


class KarieraSpider(CrawlSpider):
    """This is a Recursive Scrapy Spider builted for Kariera.gr"""

    name = "kariera"

    def __init__(self, *a, **kwargs):
        super().__init__(*a, **kwargs)

        self.job_positions = kwargs["job_positions"].split(",")
        self.allowed_domains = ["kariera.gr"]
        self.start_urls = [
            "https://www.kariera.gr/%CE%B8%CE%AD%CF%83%CE%B5%CE%B9%CF%82-%CE%B5%CF%81%CE%B3%CE%B1%CF%83%CE%AF%CE%B1%CF%82?q={}".format(
                urllib.parse.quote(position)
            ) for position in self.job_positions
        ]

        self.requirements_xpath = """//div[@id='job-description']//child::*[{}]//following::li/text()""".format(
            EXTENDED_REQUIREMENTS_STR
        )

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
        current_date = datetime.now()
        current_date_str = current_date.strftime("%b %d %Y %H:%M:%S")

        extracted_title = response.xpath('//h1[@class="pb col big no-mb"]/text()').extract()

        first_level_requirements = response.xpath(self.requirements_xpath).extract()
        first_level_requirements_list = list(filter(lambda item: item.strip() != '', first_level_requirements))

        if not first_level_requirements_list:

            second_level_requirements = response.xpath("//div[@id='job-requirements']//child::text()").extract()
            second_level_requirements_list = list(filter(lambda item: item != '\n', second_level_requirements))

            if not second_level_requirements:
                third_level_requirements = response.xpath("//div[@id='job-description']//child::text()").extract()
                job_requirements = list(filter(lambda item: item != '\n', third_level_requirements))
            else:
                job_requirements = second_level_requirements_list

        else:
            job_requirements = first_level_requirements_list

        if extracted_title:
            items["job_title"] = extracted_title[0].strip('\n')
        else:
            items["job_title"] = None

        items["job_requirements"] = " ".join(job_requirements).replace('\n', '')

        items["job_post_url"] = response.request.url
        items["timestamp"] = current_date_str
        items["full_html"] = response.text
        items["site"] = self.allowed_domains[0]
        items["full_text"] = " ".join(response.xpath('//body//text()').re('(\w+)'))
        return items
