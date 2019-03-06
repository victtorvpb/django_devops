SHELL=/bin/bash
DOCKER_COMPOSE=docker-compose.yml
SUDO=sudo
CONTAINER_NAME=api_devops


clean-cache: 
	${SUDO} rm -rf htmlcov;
	${SUDO} rm -rf .cache;
	${SUDO} rm -rf .coverage;
	${SUDO} rm -rf .pytest_cache ;
	${SUDO} rm -fr junit.xml coverage.xml;
	${SUDO} find . -iname '*.pyc' -delete;
	${SUDO} find . -iname '*.pyo' -delete;
	${SUDO} find . -name '*,cover' -delete; 
	# find -type d -name '*__pycache__' -exec rm  -rf {} | true;
	${SUDO} find . -iname '*__pycache__' -delete;

clean-cache-docker:
	make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND="make clean-cache" SUDO=
build: clean-cache
	docker-compose -f $(DOCKER_COMPOSE) build --force-rm --no-cache ${CONTAINER_NAME}

start: 
	docker-compose -f $(DOCKER_COMPOSE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE) down; true

exec:
	docker-compose -f $(DOCKER_COMPOSE) exec -T ${CONTAINER_NAME} $(COMMAND)

coverage-xml: 
	make clean-cache SUDO=''
	pytest --cov=. --cov-report xml:coverage.xml --junit-xml=junit.xml

ci-stop:
	make stop DOCKER_COMPOSE=docker-compose-ci.yml

ci-build:
	make build DOCKER_COMPOSE=docker-compose-ci.yml

ci-start:
	make start DOCKER_COMPOSE=docker-compose-ci.yml

ci-coverage-xml:
	make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND="make coverage-xml"
ci-remove-pyc:
	make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND="find . -name '*.pyc' -delete"
