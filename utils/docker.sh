#docker
removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}
armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

flushiptables() {
  sudo iptables -P INPUT ACCEPT
  sudo iptables -P FORWARD ACCEPT
  sudo iptables -P OUTPUT ACCEPT
  sudo iptables -t nat -F
  sudo iptables -t mangle -F
  sudo iptables -F
  sudo iptables -X
}

