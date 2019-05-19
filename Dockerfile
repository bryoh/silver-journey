FROM python:3
LABEL maintainer="Brian Nyamu <brianbryo@gmail.com>"
ENV PYTHONUNBUFFERED 1
ENV project=silver_journey
RUN mkdir /${project}
WORKDIR /${project}

COPY ./silver_journey /${project}
RUN pip install -r /${project}/requirements.txt

#RUN python /${project}/manage.py makemigrations

## Migrate created migrations to database
#RUN python /${project}/manage.py migrate

## Copy all static files to specific directory for nginx
#RUN python /${project}/manage.py collectstatic --noinput
# Open port 8000 to outside world
EXPOSE 8000
#CMD exec gunicorn silver_journey.wsgi:application --bind 0.0.0.0:8000 --workers 3
CMD ["sh", "/silver_journey/on-container-start.sh"]


