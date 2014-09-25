FROM rails:onbuild

RUN apt-get update && apt-get install -y mysql-client
RUN chmod +x start

CMD ["./start"]