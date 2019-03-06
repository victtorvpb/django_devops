SHELL=/bin/bash
DOCKER_COMPOSE=docker-compose.yml
SUDO=sudo
CONTAINER_NAME=api_devops

clean_cache="\
	rm -rf htmlcov; \
	rm -rf .cache; \
	rm -rf .coverage; \
	rm -rf .pytest_cache ;\
	rm -fr junit.xml coverage.xml; \
	find . -iname '*.pyc' -delete; \
	find . -iname '*.pyo' -delete; \
	find . -name '*,cover' -delete; \
	find . -type d -name 'dirName' -print0 | xargs -0 rm -rf; \
	"

clean-cache:
	make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND=${clean_cache}

build: clean-cache
	docker-compose -f $(DOCKER_COMPOSE) build --force-rm --no-cache ${CONTAINER_NAME}

start: 
	docker-compose -f $(DOCKER_COMPOSE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE) down; true

exec:
	docker-compose -f $(DOCKER_COMPOSE) exec -T ${CONTAINER_NAME} $(COMMAND)

coverage-xml: clean-cache
	pytest --cov=. --cov-report xml:coverage.xml --junit-xml=junit.xml

ci-stop:
	make stop DOCKER_COMPOSE=docker-compose-ci.yml

ci-build:
	make build DOCKER_COMPOSE=docker-compose-ci.yml

ci-start:
	make start DOCKER_COMPOSE=docker-compose-ci.yml

ci-coverage-xml:
	# make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND="pytest --cov=. --cov-report xml:coverage.xml --junit-xml=junit.xml"
	make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND="make coverage-xml"
ci-remove-pyc:
	make exec DOCKER_COMPOSE=docker-compose-ci.yml  COMMAND="find . -name '*.pyc' -delete"
