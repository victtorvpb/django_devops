FROM python:3.7.2-slim-stretch

### define env and args
ENV PYTHONUNBUFFERED 1

### add code
COPY . /code
WORKDIR /code

### clean pyc and file caches
RUN find /code -name '*.pyc' -delete
RUN find /code -name '__pycache__' -delete



RUN apt update
RUN apt-get -y install build-essential
RUN make clean-cache

### upgrade pip
RUN pip install -U pip

### install pipenv
RUN pip install pipenv

### install requirements
RUN pipenv lock -r  > requirements.txt
RUN pipenv --rm
RUN pip install -r requirements.txt