FROM python:3.11.0a7-buster

WORKDIR /code
ADD ./requirements.txt /code/requirements.txt

RUN pip install -r requirements.txt 
