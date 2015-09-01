import re


class helper(object):
    @staticmethod
    def kw_get_raw_css_from_string(cssString):
        return re.sub("jquery=", "", cssString, count=1)

