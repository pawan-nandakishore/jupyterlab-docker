# Jupyter-lab in Docker 
The repo contains a framework for running Jupyter lab in a docker container. To install docker please visit (https://docs.docker.com/get-docker/) and  (https://docs.docker.com/compose/install/)




## Project Organization
------------
```
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
```
------------


I have been experimenting with this framework for a while and found it to be extremely convinient for running Jupyter lab.

Building the dockerfile will install Jupyter lab along with nodejs in a docker container. Nodejs is need for running Jupyter extensions hence straight out of the box you should be able to use the Jupyter lab extensions. 

The build also includes many DS/ML packages notably - sklearn, scipy, pandas. It also contains psycopg2 to connect to postgres database

Bulding the docker-compose file will generate a docker image named called jupyterlab-docker-compose with a docker container called jupyter-docker

You can extend the docker-compose file by adding new containers to address new use cases. The docker mounts the current directory to 'user_files' in the docker container

```yaml
  volumes: 
      - ./:/user_files
```
It also runs the jupyter lab on running the docker compose file 
```yaml
command:  jupyter lab --allow-root --notebook-dir= user_files/ --ip=0.0.0.0 --port=8889 --no-browser
```

The framework contains a Makefile with a set of commands to make it easier to work with docker-compose and docker. You can still use the standard docker and docker-compose commands. I found these commands just quicker hence I have added them here. 

## Makefile commands 

### Docker compose commands
 You can use 
 ```
  make build
 ```
to get build the docker-compose file, this is the same as docker-compose build. 
Similarly you can get the docker-compose service up using

```
  make run
 ```
 stop the service using 
 ```
  make stop
 ```
 and bring the docker-compose service down with 
 ```
  make down 
 ```

### Docker commands
While building docker images, you may run into errors which leave many dangaling images with a ``` <none> ``` tag. To remove all dangling tags, simply run 

```
  make rm-dangling
```
to remove all exited containers you can run 
```
  make rm-containers 
 ``` 
to remove a single container (running or exited) you can use

```
make rmc C=<container name>
```
for example 
```
make rmc C=fuzzy_ducky 
```
will remove the container named fuzzy_ducky.


Docker containers created by docker-compose can be by running *make down* which removes docker containers generated by docker-compose run

You can remove the default docker images using the command 
```
make clean
```


More commands will be added overtime. 



## References
I have drawn a lot of insipration from 
[cookiecutter-data-science](https://github.com/drivendata/cookiecutter-data-science)
For those who are interested in structing their DS/ML projects better check them out. 
