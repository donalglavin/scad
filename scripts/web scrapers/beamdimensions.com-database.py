# Webscraper to build the material Geometry for OpenSCAD.
import requests
import json
# from bs4 import BeautifulSoup as bs

# Current Known Schems for index object.
schema = {
    0: 'Country',
    1: 'Material',
    2: 'Classification',
    3: 'Geometry',
    4: 'Unknown'
}

def get_index(session):
    url = f'https://beamdimensions.com/core/tree.json'
    response = session.get(url)
    return response.json()

def json2list(js, arr): # TODO: Need to finish this.
    for key in js.keys():
        arr.push(key)
        if isinstance(js[key], dict):
            json2list(js[key], arr)
    return arr

if __name__ == '__main__':
    # Base URL that needs to be generated: 'https://beamdimensions.com/database/'
    s = requests.Session()
    js = get_index(s)

    arr = []
    arr = json2list(js, arr)

    print(json.dumps(js, indent=4))
