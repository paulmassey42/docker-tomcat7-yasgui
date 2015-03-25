DOCKER=docker
IMAGE=docker-tomcat7-yasgui

image:
	sudo ${DOCKER} build -t ${IMAGE} .
	sudo service ${DOCKER} restart

run:
	sudo ${DOCKER} run -p 8080:8080 -p 1111:1111 ${IMAGE}

clean:
	sudo ${DOCKER} rm ${IMAGE}
	sudo ${DOCKER} rmi ${IMAGE}
	sudo service ${DOCKER} restart

cleanall:
	sudo ${DOCKER} rm -f `sudo ${DOCKER} ps -a -q`
	sudo ${DOCKER} rmi `sudo ${DOCKER} images -q`
	sudo service ${DOCKER} restart
