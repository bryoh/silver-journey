# pull official base image
FROM python:3.7-slim

LABEL maintainer="Brian Nyamu <brianbryo@gmail.com>"
ENV PYTHONUNBUFFERED 1
ENV project=silver_journey
RUN mkdir /${project}
WORKDIR /${project}

 #install psycopg2
RUN apt-get -y update 
RUN apt-get -qqy install \ 
    gcc \
    python3-dev \
    musl-dev \
    libffi-dev \
    && pip install psycopg2-binary

#RUN pip install pyscopg2-binary
COPY ./silver_journey/requirements.txt  /${project}/
RUN pip install -r /${project}/requirements.txt


COPY ./silver_journey/silver_journey /${project}/silver_journey/
#RUN  rm /${project}/silver_journey/local_settings.py
COPY ./silver_journey/deploy /${project}/deploy/
COPY ./silver_journey/nginx/nginx.conf /etc/nginx/nginx.conf
#COPY ./silver_journey/static /${project}/static/
COPY ./silver_journey/*.py /${project}/
COPY ./silver_journey/on-container-start.sh  /${project}/


EXPOSE 8000
#CMD exec gunicorn silver_journey.wsgi:application --bind 0.0.0.0:8000 --workers 3
CMD ["sh", "/silver_journey/silver_journey/on-container-start.sh"]


