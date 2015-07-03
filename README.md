# mini-redis

[Redis](http://redis.io/) service container.

## Usage

To run this container and bind port `6379`:

```
docker run -d -p 6379:6379 mini/redis
```

You can now check the logs:

```
docker logs <CONTAINER_ID>
```

### Adjusting maximum memory

This container by default will set `64MB` of maximum memory. Please note that
Redis will fail to write data when the limit has been reached. You can still
read existing data.

If you want to adjust this (bigger or smaller), use `REDIS_MAXMEMORY`
environment variable:

```
docker run -d -p 6379:6379 -e REDIS_MAXMEMORY=512MB mini/redis
```

Above example will limit Redis to use a maximum of `512MB` of RAM.

You can express sizes in bytes, kilobytes, gigabytes or terabytes, if you
like :grin:

### Persistance

Default configuration will persist the DB, using the following intervals
(from default configuration file):

- After 900 sec (15 min) if at least 1 key changed (`save 900 1`)
- After 300 sec (5 min) if at least 10 keys changed (`save 300 10`)
- After 60 sec if at least 10000 keys changed (`save 60 10000`)

This will also cause to persist the data at shutdown of the container.

If you want to disable persistance entirely, use `REDIS_PERSIST` environment
variable:

```
docker run -d -p 6379:6379 -e REDIS_PERSIST=no mini/redis
```

### Data and volumes

This container defines `/data` as bind mount volume. You can mount it when
starting the container:

```
docker run -v /mydata/redis:/data -d -p 6379:6379 mini/redis
```
