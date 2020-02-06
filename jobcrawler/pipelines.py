# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
from jobcrawler.postgres_client.PostgresClient import PostgresClient


class JobcrawlerPipeline(object):
    pg_client = PostgresClient()

    def process_item(self, item, spider):
        """
        This function is part of JobCrawlerPipeline and does the following:

            1. Check if extracted job is stored in database
            2. If is already stored continue Else store the extracted items to Postgres

        Args:
            item: Scrapy item object
            spider: Spider instance
        """
        if_record_exists = self.pg_client.check_if_record_exists(
            title=item["job_title"],
            job_url=item["job_url"]
        )  # Check if record exists in Postgres

        if not if_record_exists:
            self.pg_client.add_job_post(
                title=item["job_title"],
                requirements=item["job_requirements"],
                job_url=item["job_post_url"]
            )  # Store extracted items to Postgress
        return item
