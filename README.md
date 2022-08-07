# MLOps

MLOps / Dockerizing `mlflow`.

-----

## Build Dockerfile
Run this command to build.
```
docker build -t mlflow-tracking-server .
```
This dockerfile uses the multi stage build. If there is error, try below.
```
DOCKER_BUILDKIT=0 docker build -t mlflow-tracking-server .
```
If you have a reason to modify the Dockerfile, **DON'T** use absolute path in `mlflow` command. It would cause some errors.

## Run MLFlow Tracking Server

```
docker run -d -p 5000:5000 mlflow-tracking-server
```

This is default command. Docker container made from default command saves running history in `sqlite:///mlruns.db`, and artifacts, especially models, in `/mlartifacts`.

```
docker run -d -p 5000:5000 mlflow-tracking-server
    --backend-store-uri mysql://my_mysql/mlflow 
    --default-artifact-root s3://my_mlflow_artifact/
```

You can change the saving location using these options.

## How to track your runs

```
export MLFLOW_TRACKING_URI=http://localhost:5000
```
Set env variable to indicate where mlflow tracking server is.

```
mlflow run MNIST --env-manager=local --experiment-name="test"
```

Run your model in a local virtual environment that can be created by `virtualenv`, and track your run with an experiment named "test". From the google, you can see `--no-conda` command which is deprecated, so use `--env-manager=local` instead.

If you don't specify `--experiment-name`, the run is tracked with an `Default` experiment of which `--experiment-id` is zero.
