#!/usr/bin/python
#-*- coding: utf-8 -*-
#encoding=utf-8
#CopyRight @tolly

import urllib2
import urllib
import os
from BeautifulSoup import BeautifulSoup
def getAllImageLink():
    html = urllib2.urlopen('http://www.dbmeizi.com').read()
    soup = BeautifulSoup(html)

    liResult = soup.findAll('li',attrs={"class":"span3"})

    for li in liResult:
        imageEntityArray = li.findAll('img')
        for image in imageEntityArray:
            link = image.get('data-src')
            imageName = image.get('data-title')
            filesavepath = '/Users/tolly/Desktop/meizipicture/%s.jpg' % imageName 
            urllib.urlretrieve(link,filesavepath)
            print filesavepath 

if __name__ == '__main__':
    getAllImageLink()
