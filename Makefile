DOCKER_COMPOSE_FILE_PATH=./srcs/docker-compose.yml

all: $(DOCKER_COMPOSE_FILE_PATH)
	docker compose -f $^ up -d

start: $(DOCKER_COMPOSE_FILE_PATH)
	docker compose -f $^ start

stop: $(DOCKER_COMPOSE_FILE_PATH)
	docker compose -f $^ stop

clean: $(DOCKER_COMPOSE_FILE_PATH)
	docker compose -f $^ down -v

# fclean: clean
#	sudo rm -rf $(VOLUMES_PATH)
