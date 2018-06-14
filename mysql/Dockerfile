FROM mysql:5.6

RUN groupadd --gid 1000 application \
  && useradd --uid 1000 --gid application --shell /bin/bash --create-home application \
  && mkdir -p /var/www/app \
  && chown -R application:application /var/www \
  && chown -R application:application /home/application

RUN apt-get update \
    && apt-get install -y zip \
    && rm -rf /var/lib/apt/lists/*

# USER application

WORKDIR "/var/www/app"

CMD ["mysqld"]
