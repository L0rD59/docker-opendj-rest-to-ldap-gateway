# set binary
docker-compose 	= docker-compose -p dockeropendjexample

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install project for the first time
	@make -s up
	sleep 3
	docker exec -it dockeropendjexample_ldap_1 ldapadd -v -x -D "cn=admin,dc=example,dc=com" -w toor -f /tmp/Example.ldif

reinstall: ## Re-install project
	@make -s stop
	@make -s rm
	@make -s install

up: ## (Re-)Create containers
	@$(docker-compose) up -d

start: ## Start containers
	@$(docker-compose) start $(container)

stop: ## Stop containers
	@$(docker-compose) stop $(container)

rm: ## Stop containers
	@$(docker-compose) rm -f -v -a $(container)

ps: ## List containers status
	@$(docker-compose) ps $(container)

logs: ## Show containers logs
	@$(docker-compose) logs $(container)

ips: ## Show containers IP
	@for CONTAINER in $$(make -s ps |awk {'print $$1'} | awk 'NR > 2'); do echo "$$CONTAINER\t" $$(docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $$CONTAINER); done | column -t