# Redis Memory optimization Demo

This repository confirms the behavior of memory efficiency using Hash, which is published in the [Redis document](https://redis.io/topics/memory-optimization).

## Requirement

- Ruby (Tested version 2.7.2p137)
- Ruby Bundler (Tested version 2.1.4)
- Docker (Tested version 20.10.2, build 2291f61)
- Docker Compose (Tested version 1.16.1, build 6d1ac21)

## Install

- Step 1

```
git clone https://github.com/dozonot/redis-memory-optimization-demo.git
cd redis-memory-optimization-demo
```

- Step 2 : Up docker-compose

```
docker-compose up -d
```

- Step 3 : Install the ruby dependencies.

```
bundle install
```

## Usage

### Non-optimized cases

When you want to reset the Redis volume, run this additional command

```
docker-compose down -v
```

```
docker-compose up -d
ruby unoptimize.rb
docker-compose exec redis redis-cli info memory | grep used_memory_human
```

Check memory usage.

### Optimized case

When you want to reset the Redis volume, run this additional command

```
docker-compose down -v
```

```
docker-compose up -d
ruby optimize.rb
docker-compose exec redis redis-cli info memory | grep used_memory_human
```

Check memory usage.
