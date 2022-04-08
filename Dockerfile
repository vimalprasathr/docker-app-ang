FROM httpd:2.4.46

RUN rm /usr/local/apache2/cgi-bin/printenv && rm /usr/local/apache2/cgi-bin/test-cgi && rm -rf /usr/local/apache2/htdocs/*

COPY ./content/dist.tar.gz /tmp/dist.tar.gz
RUN tar zxvf /tmp/dist.tar.gz -C /usr/local/apache2/htdocs

RUN chown -R www-data:www-data /usr/local/apache2 && chmod -R 750 /usr/local/apache2

COPY config/*.conf /usr/local/apache2/conf/

USER 33
EXPOSE 8080
CMD ["httpd-foreground"]