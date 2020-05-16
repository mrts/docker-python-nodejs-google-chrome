# docker-python-nodejs-google-chrome

Dockerfile for building MRTS/DOCKER-PYTHON-NODEJS-GOOGLE-CHROME image with
latest Python 3, Node.js 10 and stable Google Chrome.

## Usage

Open Bash in the container:

    docker run -it mrts/docker-python-nodejs-google-chrome bash
    cd

Create virtualenv and run Python shell:

    virtualenv venv
    . venv/bin/activate
    pip install selene --pre
    python

Test that headless Chrome works as expected:

    from selenium import webdriver
    from selene.api import *

    options = webdriver.ChromeOptions()
    options.add_argument('--log-level=3')
    options.add_argument('--headless')
    options.add_argument('--window-size=1280,1024')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--no-sandbox')

    driver = webdriver.Chrome(options=options)
    browser.set_driver(driver)

    browser.open_url('https://google.com')
    s('[name="q"]').set('selene').press_enter()
    ss('.srg .g')[0].should(have.text('goddess of the moon'))

## Building the Docker image

    docker build --tag=mrts/docker-python-nodejs-google-chrome .
    docker tag mrts/docker-python-nodejs-google-chrome:latest mrts/docker-python-nodejs-google-chrome:v1.1
    docker login
    docker push mrts/docker-python-nodejs-google-chrome
