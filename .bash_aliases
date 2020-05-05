#!/bin/bash
# docker container utils

# function stop_and_rm {
# 	docker stop $1;
# 	docker rm $1;
# }

# function connect_to_container {
# 	docker exec -it truskinfra_$1_1 bash
# }

# function run_service_test {
# 	docker exec -it truskinfra_$1_1 sh -c "export ENV=testing ; npm run test"
# }

# function start_containers {
#   service_list=""
#   display_list=""
#   for service in "$@"
#   do
#       service_list="$service_list $service"
#       display_list="$display_list- $service\n"
#   done
#   docker-compose up --build -d $service_list
#   notify-send Docker "$(echo -e "$display_list are now up and running in the background.")"
# }

# alias trusk_connect_to_db='docker exec -it truskinfra_postgres-db_1 sh -c "psql -U postgres"'
# alias trusk_connect_to_redis='docker exec -it truskinfra_redis-server_1 sh -c "redis-cli"'
# alias trusk_docker_connect='connect_to_container'
# alias docker_startup='start_containers'

alias rmcontainers='docker rm $(docker ps -a -q)'
alias stopcontainers='docker stop $(docker ps -aq)'
alias killcontainers='docker kill $(docker ps -aq)'
alias wipedocker='killcontainers ; rmcontainers'
alias stopandrm='stop_and_rm'
# alias trusk_run_tests='run_service_test'
#docker image utils

alias rmdanglingimages='docker rmi $(docker images -f "dangling=true" -q)'

# docker volume utils

alias rmdanglingvolumes='docker volume rm $(docker volume ls -qf dangling=true)'

#docker-compose

alias docker-log='docker-compose logs -f --tail=100'

# git aliases

function checkout_file {
	git show $2:$1 > $1
}

alias gitlog='git log --decorate --graph --all'
alias gitdiff='git diff HEAD@{1}'
alias gitupdate='git fetch && git rebase'
alias git-submodule-list='git config --file .gitmodules --name-only --get-regexp path'
alias git-submodule-erase='sh ~/scripts/submodule_erase.sh'
alias git-checkout-file='checkout_file'
alias git-branch-list='git for-each-ref --sort=-committerdate refs/heads/ --format="%(color: red)%(committerdate:short) %(color: cyan)%(refname:short)"'

# everything else

function get_weather {
	curl wttr.in/$1;
}

alias meteo='get_weather'
alias battery='upower -i $(upower -e | grep '/battery') | grep --color=auto -E "state|to\ full|to\ empty|percentage"'
alias termacs='emacs -nw'
alias exa='exa -lh --git'
