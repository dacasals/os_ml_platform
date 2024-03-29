# os_ml_platform

### What includes this project

It includes a stack of open source tools to build a Machine Learning platform. Dockerized, and ready to serve.
it aims to integrate powerfull OS projects useful to build End-to-End ML projects at high scale.

### Tools

This project includes the following services:

- Airflow server: required to orchestrate all full pipelines.
- Kedro: usefull to organize structured ML pipeline code, that can be exported to ariflow them to be executed and scheduled.
- MLFlow server: It has so many uses, to monitor model training jobs, artifact, trainig
- Great Expectations: integregated on data pipelines to verify data quality.

### Requirements

- The whole project is dockerized so you need to be able to run Docker and docker compose (V2)

### How to run

This will pull images and initiate some db containers, as well as prepare airflow to run

```bash
docker compose up airflow-init
```

Result
```
[+]  3/0
✔ Container mlplatform-postgres-1   Created
✔ Container mlplatform-redis-1     Created
✔ Container mlplatform-airflow-init-1  Created
```

This will run the rest of containers and the whole project
```bash
docker compose airflow init
```

Result
```
 ✔ Container mlplatform-redis-1
 ✔ Container mlplatform-minio-1 
 ✔ Container mlplatform-postgres-1
 ✔ Container mlplatform-airflow-webserver-1
 ✔ Container mlplatform-airflow-scheduler-1
 ✔ Container mlplatform-flower-1    
 ✔ Container mlplatform-airflow-worker-1
 ✔ Container mlplatform-airflow-init-1
 ✔ Container mlplatform-minio-create-bucket-1
 ✔ Container mlplatform-web-1
```