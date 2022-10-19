FROM python:3.9

# Meta
LABEL author="Kiung Jung"
LABEL email="answeqr@gmail.com"
LABEL version="2.0"
LABEL description="MLFlow Tracking Server"

# Installation
RUN apt-get update
RUN apt-get install -y build-essential python3.9-dev libpq-dev
RUN pip install mlflow==1.27.0 mysqlclient boto3

# Port
EXPOSE 5000/tcp

# Run Server
WORKDIR /
COPY ./run.sh ./run.sh
RUN chmod +x ./run.sh

ENTRYPOINT [ "./run.sh" ]