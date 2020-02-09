from jobcrawler.settings import EXTENDED_REQUIREMENTS_STR

s = """//div[@id='job-description']//child::*[{}]//following::li/text()""".format(EXTENDED_REQUIREMENTS_STR)
print(s)