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
