# Rest API

Useful Rest API References for Jenkins to mark which models are published.

---

## Set tag

Set a *key-value* tag to a run.
It is used to specify a corresponding docker image in ECR.

```
${MLFLOW_TRACKING_URI}/api/2.0/mlflow/runs/set-tag
```

|Type|run_id|key|value|
|---|---|---|---|
|POST|string|string|string|

## Create Model Version

Create a new model version.
It is used to record models of `PROD`/`STG`/`DEV`.

```
${MLFLOW_TRACKING_URI}/api/2.0/mlflow/model-versions/create
```

|Type|name|source|run_id|tags|description|
|---|---|---|---|---|---|
|POST|string|string<br>(model artifact addr)|string|Optional<br>[{key, value}]|Optional|
