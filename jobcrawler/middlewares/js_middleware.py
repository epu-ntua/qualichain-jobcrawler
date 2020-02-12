from scrapy.http import HtmlResponse
from selenium import webdriver

from selenium.webdriver.chrome.options import Options


class JSMiddleware(object):

    def __init__(self):
        options = Options()  # Set webdriver options
        # options.add_argument('--headless')
        options.add_argument('--disable-gpu')

        self.driver = webdriver.Chrome('C:/webdrivers/chromedriver.exe', chrome_options=options)

    def process_request(self, request, spider):
        """This middleware is applied on skywalker's start urls that are protected with JS"""

        # check response url
        if (spider.allowed_domains == ['skywalker.gr'] and 'aggelia/ergasias' not in request.url) or (
                spider.allowed_domains == ["gr.indeed.com"] and 'viewjob' not in request.url):
            # Initialize webdriver for Chrome

            self.driver.get(request.url)

            body = self.driver.page_source  # get page source
            return HtmlResponse(self.driver.current_url, body=body, encoding='utf-8', request=request)

    def spider_closed(self, spider):
        self.driver.close()
