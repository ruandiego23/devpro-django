ARG PYTHON_VERSION=3.12-slim

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# RUN mkdir -p /code it doesn't need this command because the WORKDIR guarante that the directory /cod already exists
# WORKDIR is like mkdir && cd
WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN set -ex && \
    pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8000

CMD ["gunicorn", "pypro.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "4"]

