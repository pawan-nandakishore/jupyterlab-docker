FROM ubuntu:latest


RUN apt-get update && apt-get install wget -y
RUN apt-get install python3-pip -y

RUN apt install libpq-dev -y 
RUN apt install curl -y 

RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash - 
RUN apt install nodejs  -y

COPY ./requirements.txt ./user_files/requirements.txt
RUN pip3 install -r ./user_files/requirements.txt


RUN jupyter labextension install jupyterlab-plotly@4.9.0
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget@4.9.0
