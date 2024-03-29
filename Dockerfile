FROM apache/airflow:2.8.4-python3.11
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         vim libffi-dev \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /
USER airflow

RUN pip install --no-cache-dir "apache-airflow==${AIRFLOW_VERSION}" -r /requirements.txt
