# 
FROM python:3.9 AS base
WORKDIR /code/app

# 
COPY ./requirements.txt /code/requirements.txt

FROM base AS build
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . /code/app/

RUN prisma generate

ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000", "--reload"]
