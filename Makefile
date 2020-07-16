rmc: 
ifneq (($$(docker ps -q -f name=${c})),)
	@eval docker stop ${c} 	
	@eval docker rm ${c}
endif	
ifeq ($$(docker ps -aq -f status=exited -f name=${c}),)
 	# cleanup
	@eval docker rm ${c}
endif

build: 
	@eval docker-compose build 

up: 
	@eval docker-compose up 
start: 
	@eval docker-compose start

stop:
	@eval docker-compose stop

down: 
	@eval docker-compose down
run:	
	@eval docker-compose up 

rm-dangling: 
	@eval docker rmi  -f $$(docker images -f "dangling=true" -q)
 
rm-containers: 
	@eval docker container rm $$(docker container ls –aq) 

bash: 
	@eval docker exec -it  ${c} bash 

make clean: 
	@eval docker rmi jupyter-docker