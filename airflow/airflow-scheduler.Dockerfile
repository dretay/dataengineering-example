FROM apache/airflow:2.10.4-python3.10

USER root
RUN apt-get update
RUN apt-get install -y git build-essential libleveldb-dev

USER ${AIRFLOW_UID}
RUN pip install dbt-postgres==1.8.2 \
	&& pip install markupsafe==2.0.1 \
	&& pip install apache-airflow-providers-postgres \
	&& pip install apache-airflow-providers-odbc \
	&& pip install psycopg2-binary \
	&& pip install gitpython \
	&& pip install dbt-airflow \
	&& pip install plyvel \
	&& pip install --upgrade cmake \
	&& pip install --upgrade pyarrow==14.0.0 \
	&& pip install apache-airflow-providers-trino \
	&& pip install dbt-trino \
	&& pip uninstall dbt \
	&& pip install dbt-core==1.8.2

# Set the working directory (optional, just for organizational purposes)
WORKDIR /data_project/airflow-schedular

# Run the scheduler
CMD [ "airflow", "scheduler" ]