from scrapy.http import HtmlResponse
from selenium import webdriver

from selenium.webdriver.chrome.options import Options


class JSMiddleware(object):
    def process_request(self, request, spider):
        """This middleware is applied on skywalker's start urls that are protected with JS"""

        # check response url
        if (spider.allowed_domains == ['skywalker.gr'] and 'aggelia/ergasias' not in request.url) or (spider.allowed_domains == ["gr.indeed.com"] and 'viewjob' not in request.url):

            options = Options()  # Set webdriver options
            options.add_argument('--headless')
            options.add_argument('--disable-gpu')

            # Initialize webdriver for Chrome
            driver = webdriver.Chrome('C:/webdrivers/chromedriver.exe', chrome_options=options)
            driver.get(request.url)

            body = driver.page_source  # get page source
            return HtmlResponse(driver.current_url, body=body, encoding='utf-8', request=request)
