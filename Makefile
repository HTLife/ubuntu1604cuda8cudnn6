default: tensor

.PHONY: tensor

tensor:
		sudo docker build -t tensorimg .
		
container:
		sudo nvidia-docker run --restart=always -d --name tensor -e PASSWORD='rvl122' --net=host -v /home/${USER}/dockerData:/notebooks/data:z tensorimg /bin/sh -c "while true; do sleep 10; done"

login:
		sudo docker exec -it tensor bash
		
rm:
		sudo docker container stop tensor
		sudo docker container rm tensor
		
rmi:
		sudo docker image rm tensorimg
