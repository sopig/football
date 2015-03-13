import urllib2
response = urllib2.urlopen('http://www.sopig.cn')
html = response.read()
print html
