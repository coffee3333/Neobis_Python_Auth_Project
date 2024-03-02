FROM python:3.8

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /app/

EXPOSE 8000


CMD ["python", "/app/source/manage.py", "makemigrations"]
CMD ["python", "/app/source/manage.py", "migrate"]
CMD ["python", "/app/source/manage.py", "runserver", "0.0.0.0:3000"]
