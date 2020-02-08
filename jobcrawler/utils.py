from urllib.parse import urlparse, parse_qsl, urlencode, urlunparse


def change_url_params(url, page_num):
    """
    This function is used to update URL's page query parameter

    Args:
        url: provided URL
        page_num: page num

    Returns: updated_url
    Examples:
        >>> updated_url = change_url_params("https://www.skywalker.gr/aggelies-ergasias?keywords=developer&page=1", "2")
    """
    url_parts = list(urlparse(url))
    params = {'page': page_num}

    query = dict(parse_qsl(url_parts[4]))
    query.update(params)

    url_parts[4] = urlencode(query)
    updated_url = urlunparse(url_parts)
    return updated_url
