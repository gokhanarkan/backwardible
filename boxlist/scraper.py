from bs4 import BeautifulSoup
from urllib.request import Request, urlopen
from urllib.error import HTTPError
import re

user_agent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7'
headers = {'User-Agent': user_agent}

def clean_tags(self, raw_html):
    '''
    Cleans out the html code and returns the data inside the tags
    '''
    cleanr = re.compile('<.*?>')
    return re.sub(cleanr, '', str(raw_html))


def check_games():
	GAMES_URL = 'https://www.xbox.com/en-US/xbox-one/backward-compatibility/available-games'
	url = Request(GAMES_URL, None, headers)
	html = urlopen(url)
	soup = BeautifulSoup(html.read(), 'html.parser')
	# Find all letters
	for letter in soup.findAll('div', attrs={ 'class': 'letter' }):
		print(letter.find('li'))

check_games()