DOCKER_COMPOSE_PATH=./srcs/docker-compose.yml

run: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ up -d

build: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ build

start: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ start

re-build: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ up -d --build

logs: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ logs --follow

stop: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ stop

clean: $(DOCKER_COMPOSE_PATH)
	docker compose -f $^ down

fclean: clean
	rm -rf /home/$(USER)/data

re: fclean build run
