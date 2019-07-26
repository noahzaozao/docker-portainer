# docker-portainer

## create_network.sh

```bash
docker network create -d overlay portainer_agent_network
```

## create_portainer_agent.sh

```bash
docker service create \
    --name portainer_agent \
    --network portainer_agent_network \
    -e AGENT_CLUSTER_ADDR=tasks.portainer_agent \
    --mode global \
    --constraint 'node.platform.os == linux' \
    --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
    --mount type=bind,src=//var/lib/docker/volumes,dst=/var/lib/docker/volumes \
    --mount type=bind,src=//etc/localtime,dst=/etc/localtime \
    portainer/agent
```

## create_portainer.sh

```bash
docker service create \
    --name portainer \
    --network portainer_agent_network \
    --publish 9000:9000 \
    --replicas=1 \
    --constraint 'node.role == manager' \
    --mount type=bind,source=/mnt/data/portainer_data,destination=/data \
    --mount type=bind,src=//etc/localtime,dst=/etc/localtime \
    portainer/portainer -H "tcp://tasks.portainer_agent:9001" --tlsskipverify
```

