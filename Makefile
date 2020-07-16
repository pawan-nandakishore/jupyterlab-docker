rmc: 
ifneq (($$(docker ps -q -f name=${C})),)
	@eval docker stop ${C} 	
	@eval docker rm ${C}
endif	
ifeq ($$(docker ps -aq -f status=exited -f name=${C}),)
 	# cleanup
	@eval docker rm ${C}
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