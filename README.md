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

dbeaver
    trino
    datastack.internal:8082
    admin


docker exec -ti dbt /bin/bash
dbt init
    datalake
    1

    add the following to dbt_project.yml:
        vars:
            'dbt_date:time_zone': 'America/'America/New_York'

        flags:
            'require_certificate_validation': 'False'

        models:
            datalake:
                staging:
                    +materialized: table
                    +schema: staging
                marts:
                    +materialized: table
                    +schema: sales
    add generate_schema_name.sql macro

    edit ~/.dbt/profiles.yml as appropriate
    
setup ssl cert for codeserver
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./certs/nginx.key -out ./certs/nginx.crt 