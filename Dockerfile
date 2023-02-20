FROM public.ecr.aws/lambda/python:3.7
COPY . ${LAMBDA_TASK_ROOT}
COPY requirements.txt  .
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

CMD ["routes.user.info"]

FROM python:3.5-slim

MAINTAINER pdhere@umassd.edu

USER root

WORKDIR /app

ADD . /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

ENV NAME World

CMD ["python", "app.py"]
