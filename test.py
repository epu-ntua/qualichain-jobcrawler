words = ["role", "can"]
contains = ["contains(text(), '{}')".format(word) for word in words]
s = """//div[@id='job-description']//child::*[{}]//following::li/text()"""
print(" or ".join(contains))