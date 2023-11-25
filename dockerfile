FROM debian

COPY ./scriptast.sh /

COPY ./Test.odt /

RUN chmod +x ./scriptast.sh
