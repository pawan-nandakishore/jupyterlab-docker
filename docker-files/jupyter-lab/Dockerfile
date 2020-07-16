FROM ubuntu:latest


RUN apt-get update && apt-get install wget -y
RUN apt-get install python3-pip -y

RUN apt install libpq-dev -y 
RUN apt install curl -y 

RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash - 
RUN apt install nodejs  -y

COPY ./requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install Psycopg2 
