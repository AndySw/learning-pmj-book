.PHONY: start stop build restart logs ps start-docker #stop-docker

DOCKER_DESKTOP_PATH = /opt/docker-desktop/bin/docker-desktop

start-docker:
	@echo "Checking if Docker is running..."
	@if docker info > /dev/null 2>&1; then \
		echo "✅ Docker is already running."; \
	else \
		echo "🚀 Docker is not running. Launching Docker Desktop..."; \
		nohup bash -c "setsid $(DOCKER_DESKTOP_PATH) > /dev/null 2>&1 &" ; \
		echo "⏳ Waiting for Docker Desktop to initialise..."; \
		for i in 1 2 3 4 5 6 7 8 9 10; do \
			if docker info > /dev/null 2>&1; then \
				echo '✅ Docker is now running.'; \
				break; \
			else \
				echo "⏳ Attempt $$i: Docker not ready yet..."; \
				sleep 2; \
			fi; \
		done; \
	fi

# stop-docker isn't working quite right at the moment, as it kills the make process itself. 
# Please hold, your call is important to us.

# stop-docker:
# 	@echo "Attempting to gracefully shut down Docker Desktop..."
# 	@DOCKER_PROCS=$$(pgrep -f "com.docker.backend|com.docker.supervisor|vpnkit-bridge|docker-desktop" || true); \
# 	if [ -n "$$DOCKER_PROCS" ]; then \
# 		echo "🛑 Killing Docker Desktop-related processes: $$DOCKER_PROCS"; \
# 		kill $$DOCKER_PROCS; \
# 		echo "⏳ Waiting for Docker to shut down..."; \
# 		for i in 1 2 3 4 5; do \
# 			if ! docker info > /dev/null 2>&1; then \
# 				echo "✅ Docker is fully shut down."; \
# 				break; \
# 			else \
# 				echo "⏳ Attempt $$i: Docker still shutting down..."; \
# 				sleep 2; \
# 			fi; \
# 		done; \
# 	else \
# 		echo "ℹ️  Docker Desktop appears to be already stopped."; \
# 	fi

start: start-docker
	docker-compose up -d

stop:
	docker-compose down

build: start-docker
	docker-compose build

restart: start-docker
	docker-compose down && docker-compose up -d

logs: start-docker
	docker-compose logs -f

ps: start-docker
	docker-compose ps