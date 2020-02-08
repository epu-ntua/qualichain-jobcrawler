from scrapy.http import HtmlResponse
from selenium import webdriver

from selenium.webdriver.chrome.options import Options


class JSMiddleware(object):
    def process_request(self, request, spider):
        if spider.allowed_domains == ['skywalker.gr'] and 'aggelia/ergasias' not in request.url:
            options = Options()
            options.add_argument('--headless')
            options.add_argument('--disable-gpu')  # Last I checked this was necessary.

            driver = webdriver.Chrome('C:/webdrivers/chromedriver.exe', chrome_options=options)
            driver.get(request.url)

            body = driver.page_source
            return HtmlResponse(driver.current_url, body=body, encoding='utf-8', request=request)
