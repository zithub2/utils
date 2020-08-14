#from html.parser import HTMLParser
from bs4 import BeautifulSoup
import requests as req
#from pathlib import Path # Path('localfile').read_text() ==> string wrt localfile

def get_soup(url):
    return BeautifulSoup(req.get(url).text, 'html.parser')
def get_imgurl(soup):
    return soup.select('#p > p > center > img')[0]['lazysrc']
def save_bin_url(url,fn):
    with open(fn, 'wb') as f:
        f.write(req.get(url).content)

url='https://www.192td.com/gq/youmi/ym420.html'
soup=get_soup(url)

allnum=int(soup.find('span', id='allnum').text)
imgurl=get_imgurl(soup)
imgft=imgurl[imgurl.rfind('.'):]
save_bin_url(imgurl, "1"+imgft)

for i in range(2,allnum+1):
    soup=get_soup(url.replace('.html','_'+str(i)+'.html#p'))
    imgurl=get_imgurl(soup)
    save_bin_url(imgurl, str(i)+imgft)

