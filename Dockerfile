FROM ruby:1.9.3

RUN apt-get update
RUN apt-get install -y ttf-freefont chromium unzip libgconf-2-4

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

RUN wget https://chromedriver.storage.googleapis.com/2.28/chromedriver_linux64.zip && unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/ && chmod 755 /usr/local/bin/chromedriver

RUN mkdir /noto
ADD https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip /noto
WORKDIR /noto
RUN unzip NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/noto && \
    cp *.otf /usr/share/fonts/noto && \
    chmod 644 -R /usr/share/fonts/noto/ && \
    fc-cache -fv
RUN rm -rf /noto
