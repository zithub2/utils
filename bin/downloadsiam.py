#!/usr/bin/env python3

#note that this file just enables you to do it, while it is up to you to decide whether to do it or not.
#please inform me if you insiste this is illegal.

#run this file to download papers from siam provided that you have permitions.
#  it works well now(20171101)
#usage: downloadsiam.py filename
#  where filename is supposed to be a file of type html
import sys
from html.parser import HTMLParser
import argparse
import re
args = argparse.ArgumentParser()
args.add_argument('filename',type=str,help='name of the file for htmlparser')
args.add_argument('--encoding',type=str,nargs=1,default='utf-8',help='encoding of the html')
args = args.parse_args()


class MyHTMLParser(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self.istitle=False
        self.waitingPDF=False
        self.ispdf=False
        self.baseurl="http://epubs.siam.org"

    def handle_starttag(self, tag, attrs):
        #pass
        if tag=="span" and attrs[0]==("class","hlFld-Title"):
            self.istitle=True
            self.waitingPDF=True
        if tag=="a" and self.waitingPDF:
            self.ispdf=True
            self.a_attrs=attrs

    def handle_endtag(self, tag):
        #pass
        if tag=="span":
            self.istitle=False

    def handle_data(self, data):
        #pass
        if self.istitle:
            #print(data)
            self.title=data
        if self.ispdf and data.startswith("PDF"):
            self.url=[v for (p,v) in self.a_attrs if p=="href"][0]
            print("wget '%s'" % (self.baseurl+self.url,))
            print("mv '%s' '%s'" % (self.url.split('/')[-1],re.sub("""['"]""","_",self.title+'.pdf')))
            self.ispdf=False
            self.waitingPDF=False

    def handle_startendtag(self, tag, attrs):
        pass

    def handle_comment(self,data):
        pass

html=MyHTMLParser()
html.feed(open(args.filename,encoding=args.encoding).read())
