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

- This is a prior estimation of initial resources:
```
CONTAINER ID   NAME                             CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O        PIDS
16727e397be6   mlplatform-web-1                 0.02%     429.5MiB / 11.05GiB   3.80%     35.7kB / 29.3kB   77.1MB / 0B      61
f3ac883a75f6   mlplatform-flower-1              0.02%     203.1MiB / 11.05GiB   1.80%     315kB / 154kB     29.2MB / 4.1kB   16
39267f74f28f   mlplatform-airflow-webserver-1   0.22%     760.5MiB / 11.05GiB   6.72%     996kB / 649kB     106MB / 4.1kB    8
dcaacde8cc5b   mlplatform-minio-1               1.91%     161.7MiB / 11.05GiB   1.43%     36.4kB / 7.36kB   82.5MB / 446kB   11
65a7b1f0768f   mlplatform-airflow-scheduler-1   2.31%     326.3MiB / 11.05GiB   2.88%     16.8MB / 15MB     131MB / 9.32MB   3
471892b26e14   mlplatform-airflow-worker-1      0.09%     1.566GiB / 11.05GiB   14.18%    480kB / 426kB     17.9MB / 4.1kB   21
ab967c53adc0   mlplatform-redis-1               2.36%     7.145MiB / 11.05GiB   0.06%     578kB / 731kB     9.72MB / 0B      5
5a3f2f24d2ef   mlplatform-postgres-1            1.01%     71MiB / 11.05GiB      0.63%     16.8MB / 18.7MB   30.6MB / 32MB    19
```
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

