FROM ruby:2.4.1

WORKDIR /depot

RUN apt-get update && \
    apt-get install -y npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y --force-yes nodejs
RUN npm i -g yarn 

COPY Gemfile /depot
COPY Gemfile.lock /depot

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
