# Jupyter-lab in Docker 
The repo contains a framework for running Jupyter lab in a docker container. To install docker please visit [https://docs.docker.com/get-docker/]. 
I have been experimenting with this framework for a month and found it to be exteremely convinient for running Jupyter lab.

Building the dockerfile will  installs Jupyter lab along with nodejs in a docker container. Nodejs is need for running Jupyter extensions hence straight out of the box you should be able to use the Jupyter lab extensions. 

The build also includes many DS/ML packages notably - sklearn, scipy, pandas. It also contains psycopg2 to connect to postgres database

Bulding the docker-compose file will generate a docker image named called jupyterlab-docker-compose with a docker container called jupyter-docker

You can extend the docker-compose file by adding new containers to address new use cases. The docker mounts the current directory to 'local_drive' in the docker container

```yaml
  volumes: 
      - ./:/local_drive
```
It also runs the jupyter lab on running the docker compose file 
```yaml
command:  jupyter lab --allow-root --notebook-dir= local_drive/ --ip=0.0.0.0 --port=8889 --no-browser
```


## Project Organization
------------
There is a also a Makefile to simply the execution of docker commands.  

├── LICENSE
├── Makefile                <- Makefile with commands like `make data` or `make train`
├── README.md               <- The top-level README for developers using this project.
├── data
│   ├── external            <- Data from third party sources.
│   ├── interim             <- Intermediate data that has been transformed.
│   ├── processed           <- The final, canonical data sets for modeling.
│   └── raw                 <- The original, immutable data dump.
│
├── notebooks               <- Jupyter notebooks.
└── docker-files            <- Folder containing docker files 
    └── jupyter-lab         <- The jupyter lab Dockerfile 
    └── requirements.txt    <- Python packages to be installed       

------------
