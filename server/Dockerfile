# Multi-Stage Build

# Builder
FROM python:3.9
RUN apt-get update
RUN apt-get install -y build-essential python3.9-dev libpq-dev
RUN pip install mlflow mysqlclient boto3

# Label
LABEL author="Kiung Jung"
LABEL email="answeqr@gmail.com"
LABEL version="1.0"
LABEL description="MLFlow Tracking Server"

COPY ./build.sh ./build.sh
RUN chmod +x ./build.sh

# Port
EXPOSE 5000/tcp

ENTRYPOINT [ "./build.sh" ]