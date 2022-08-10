#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

mlflow server \
    --backend-store-uri $MLFLOW_DB_URI \
    --artifacts-destination $MLFLOW_S3_URI \
    --serve-artifacts \
    --host 0.0.0.0 \
    --port 5000 