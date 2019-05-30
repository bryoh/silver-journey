# Use an official Python runtime as a parent image
FROM python:3.7-alpine
LABEL maintainer="Brian Nyamu <brianbryo@gmail.com>"

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code/

# install psycopg2
RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add build-base jpeg-dev zlib-dev \
    && apk add postgresql-dev tree \
    && pip install psycopg2 \
    && apk del build-deps


COPY ./requirements.txt /code/requirements.txt
RUN pip install --upgrade pip
# Install any needed packages specified in requirements.txt
RUN pip install -r /code/requirements.txt
RUN pip install gunicorn

# Copy the current directory contents into the container at /code/
ADD . /code/

EXPOSE 8000
RUN echo '========================================='
RUN tree /code/
RUN echo '========================================='

# run entrypoint.prod.sh
CMD ["sh" ,"/code/entrypoint.prod.sh"]
