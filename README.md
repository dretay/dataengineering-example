127.0.0.1 datastack.internal

minio:
    create buckets:
        datalake
        warehouse

jupyter
    load data into datalake
    http://datastack.internal:8888/lab/tree/download.ipynb

airflow
    define trino_conn connector 
        - host: trino
        - login: admin
        - post: 8080