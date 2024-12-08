ARG PYTHON_VERSION=3.12-slim

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt ./requirements.txt
RUN set -ex && \
    pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt
COPY . /code/

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate --noinput && python manage.py collectstatic --noinput && gunicorn pypro.wsgi --bind 0.0.0.0:8000", "--workers", "4"]
