# How to Run MLFlow Tracking Server

## Required Env Variables

AWS configuration is needed for S3 permission.
MLflow Tracking Server can be enabled with proxied artifact storage access. For more informations, click [here](https://www.mlflow.org/docs/latest/tracking.html#scenario-5-mlflow-tracking-server-enabled-with-proxied-artifact-storage-access).

Please be noted that you need to have the access to AWS S3 bucket.

    - export AWS_ACCESS_KEY_ID=
    - export AWS_SECRET_ACCESS_KEY=
    - export MLFLOW_S3_URI=

These are used to set `MLFLOW_DB_URI: mysql://${MLFLOW_DBMS_USER}:${MLFLOW_DBMS_PASSWORD}@${MLFLOW_DBMS_ENDPOINT}:${MLFLOW_DBMS_PORT}/${MLFLOW_DBMS_DB}`

    - export MLFLOW_DBMS_USER=
    - export MLFLOW_DBMS_PASSWORD=
    - export MLFLOW_DBMS_ENDPOINT=
    - export MLFLOW_DBMS_PORT=
    - export MLFLOW_DBMS_DB=

Be sure to make `MLFLOW_DBMS_DB` schema in advance. It is not made automatically.

## Run Server

To run this server, `docker` and `docker-compose` are installed.

```
docker-compose build
docker-compose up
```

This command builds a docker image, and runs contrainer.
