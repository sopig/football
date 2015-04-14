import urllib
baidu = urllib.urlopen('http://www.baidu.com')
print 'http header:\n',baidu.info()
print 'http status:\n',baidu.getcode()
print 'url:\n',baidu.geturl()
#for line in  baidu:
#	print line
baidu.close()
