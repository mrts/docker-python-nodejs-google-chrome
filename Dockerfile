FROM python:3

RUN \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update && \
  apt-get install -y nodejs google-chrome-stable ack && \
  CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
  curl -sL https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip | zcat > /usr/local/bin/chromedriver && \
  chmod 755 /usr/local/bin/chromedriver && \
  npm install -g npm && \
  pip install -U pip && pip install pipenv && \
  rm -rf /var/lib/apt/lists/*

