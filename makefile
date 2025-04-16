.PHONY: start stop build restart logs ps

start:
	docker-compose up -d

stop:
	docker-compose down

build:
	docker-compose build

restart:
	docker-compose down && docker-compose up -d

logs:
	docker-compose logs -f

ps:
	docker-compose ps
