# pull official base image
FROM  python:3.9-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN python3 -m venv .env
RUN ls -la
RUN source .env/bin/activate
RUN pip install --upgrade pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN pip freeze

# copy project
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# User
RUN adduser -D user
USER user
