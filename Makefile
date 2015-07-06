build: Dockerfile
	docker build -t mini-redis .

tag:
	docker tag -f mini-redis mutterio/mini-redis

publish: tag
	docker push mutterio/mini-redis
