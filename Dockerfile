FROM rails

RUN apt-get install -y mysql-client

ADD ./start /start

CMD ["/start"]

