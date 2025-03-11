.PHONY: config
config:
	rm -rf ch/clickhouse01 ch/clickhouse02 ch/clickhouse03 ch/clickhouse04
	mkdir -p ch/clickhouse01 ch/clickhouse02 ch/clickhouse03 ch/clickhouse04
	REPLICA=01 SHARD=01 envsubst < ch/config.xml > ch/clickhouse01/config.xml
	REPLICA=02 SHARD=01 envsubst < ch/config.xml > ch/clickhouse02/config.xml
	REPLICA=03 SHARD=02 envsubst < ch/config.xml > ch/clickhouse03/config.xml
	REPLICA=04 SHARD=02 envsubst < ch/config.xml > ch/clickhouse04/config.xml
	cp ch/users.xml ch/clickhouse01/users.xml
	cp ch/users.xml ch/clickhouse02/users.xml
	cp ch/users.xml ch/clickhouse03/users.xml
	cp ch/users.xml ch/clickhouse04/users.xml

.PHONY: cluster
cluster:
	docker-compose -f ./cluster/docker-compose-cluster.yml up -d


.PHONY: ch
ch:
	docker-compose -f ./docker-compose.yml up -d