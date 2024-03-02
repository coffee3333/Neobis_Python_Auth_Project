FROM python:3.8

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Скопируйте содержимое вашего проекта в контейнер
COPY . /app/

# Сделайте порт 8000 доступным снаружи контейнера
EXPOSE 8000

# Запустите приложение Django
CMD ["python", "/app/source/manage.py", "runserver", "0.0.0.0:8000"]
