import requests
from bs4 import BeautifulSoup

website = "https://choosealicense.com/appendix/"
domain = "https://choosealicense.com"

def get_soup(link: str) -> BeautifulSoup:
    return BeautifulSoup(requests.get(link).text, "html.parser")

def main():
    links = []

    # get website, parse into bs4 and get the table
    soup = get_soup(website).find("table")

    # get all licenses and links
    for i in soup.find_all("tr")[1:]:
        links.append(domain + i.find("th").find("a")["href"])

    
    # get license in each links
    for i in links:
        html = get_soup(i)

        # utils
        license_name = i.replace("https://choosealicense.com/licenses/", "")
        lname = html.find("body").find("h1").get_text()

        print(f"Downloading {lname} >> {license_name}.txt")

        # create license file
        with open(f"{license_name}.txt", "w") as f:
            f.write(html.find("pre", id="license-text").get_text())


if __name__ == "__main__":
    main()