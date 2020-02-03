# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
from jobcrawler.postgres_client.PostgresClient import PostgresClient


class JobcrawlerPipeline(object):
    pg_client = PostgresClient()

    def process_item(self, item, spider):
        self.pg_client.add_job_post(
            title=item["job_title"],
            requirements=item["job_requirements"],
            job_url=item["job_post_url"]
        )
        return item
