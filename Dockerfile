FROM node:10

# Install python3

RUN set -x \
    && apt-get update \
    && apt-get install python3 -y \
    && apt-get install python3-pip -y

# Install Chrome

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN set -x \
    && apt-get update \
    && apt-get install google-chrome-stable -y

ENV CHROME_BIN /usr/bin/google-chrome

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && python3 --version \
    && pip3 --version \
    && google-chrome --version
