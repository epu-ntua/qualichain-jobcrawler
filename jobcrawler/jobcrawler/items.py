# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class JobcrawlerItem(scrapy.Item):
    job_title = scrapy.Field()
    job_requirements = scrapy.Field()
    job_post_url = scrapy.Field()
    # page_context = scrapy.Field()
    pass
