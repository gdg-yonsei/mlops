# Multi-Stage Build

# Builder
FROM python:3.7 AS build
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install mlflow psycopg2 mysqlclient

# Main
FROM python:3.7-slim
COPY --from=build /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Label
LABEL author="Kiung Jung"
LABEL email="answeqr@gmail.com"
LABEL version="1.0"
LABEL description="MLFlow Tracking Server"

# Port
EXPOSE 5000/tcp

ENTRYPOINT [ "mlflow", "server", \
               "--host", "0.0.0.0", \
               "--port", "5000", \
               "--serve-artifacts" ]
CMD [ "--backend-store-uri", "sqlite:///mlruns.db", \
      "--default-artifact-root", "mlartifacts" ]
