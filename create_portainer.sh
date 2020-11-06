docker stack deploy --compose-file=portainer-agent-stack.yml portainer
#docker service create \
#    --name portainer \
#    --network portainer_agent_network \
#    --publish 9000:9000 \
#    --replicas=1 \
#    --constraint 'node.role == manager' \
#    --mount type=bind,source=/mnt/data/portainer_data,destination=/data \
#    --mount type=bind,src=//etc/localtime,dst=/etc/localtime \
#    portainer/portainer -H "tcp://tasks.portainer_agent:9001" --tlsskipverify
docker stack deploy --compose-file=portainer-agent-stack.yml portainer
