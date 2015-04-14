#!/usr/bin/python
#-*- coding: utf-8 -*-
#encoding=utf-8

import urllib2
import urllib
import os
from BeautifulSoup import BeautifulSoup
def getAllImageLink():
    html = urllib2.urlopen('http://www.jianshu.com').read()
    soup = BeautifulSoup(html)

    ulResult = soup.findAll('ul',attrs={"class":"thumbnails"})

    for ul in ulResult:
        articleArray = ul.findAll('div',attrs={"class":"article"})
        for article in articleArray:
	    a = article.findAll('a',attrs={"class":"content"})
	    content = a.get('`')
            link = image.get('data-src')
            imageName = image.get('data-id')
            filesavepath = '/Users/weihua0618/Desktop/meizipicture/%s.jpg' % imageName 
            urllib.urlretrieve(link,filesavepath)
            print filesavepath 

if __name__ == '__main__':
    getAllImageLink()
