SHELL=/bin/bash
DOCKER_COMPOSE=docker-compose.yml
SUDO=sudo

clean-cache:
	$(SUDO) rm -fr htmlcov;
	$(SUDO) rm -fr .cache;
	$(SUDO) rm -fr .coverage;
	$(SUDO) rm -fr .pytest_cache;
	$(SUDO) rm -fr junit.xml cobertura.xml;
	$(SUDO) find . -iname '*.pyc' -delete;
	$(SUDO) find . -iname '*.pyo' -delete;
	$(SUDO) find . -name '*,cover' -delete;
	$(SUDO) find . -iname __pycache__ -delete;

build:  clean-cache
	docker-compose -f $(DOCKER_COMPOSE) build --force-rm --no-cache api

start: 
	docker-compose -f $(DOCKER_COMPOSE) up -d

stop:
	docker-compose -f $(DOCKER_COMPOSE) down; true

coverage-xml: clean-cache
	pytest --cov=. --cov-report xml:cobertura.xml --junit-xml=junit.xml --cov-report term

ci-stop:
	make stop DOCKER_COMPOSE=docker-compose-ci.yml

ci-build:
	make build DOCKER_COMPOSE=docker-compose-ci.yml

ci-start:
	make start DOCKER_COMPOSE=docker-compose-ci.yml

ci-coverage-xml:
	make exec-api COMMAND="make coverage-xml DOCKER_COMPOSE=docker-compose-ci.yml SUDO="

ci-export-xml: clean-cache
	docker cp api:/code/junit.xml .
	docker cp api:/code/cobertura.xml .