#!/usr/bin/env bash

print_task() {
    printf "%-80s" "${1}"
    return 0
}

print_info() {
    STATUS="[ INFO ]";
    COLOR="\x1b[36;01m";
    COLOR_RESET="\x1b[39;49;00m"

    print_task "${1}"
    echo -e "${COLOR}${STATUS}${COLOR_RESET}"
    return 0
}

print_ok() {
    STATUS="[  OK  ]";
    COLOR="\x1b[33;32m";
    COLOR_RESET="\x1b[39;49;00m"

    echo -e "${COLOR}${STATUS}${COLOR_RESET}"
    return 0
}

print_fail() {
    STATUS="[ FAIL ]";
    COLOR="\x1b[31;31m";
    COLOR_RESET="\x1b[39;49;00m"

    echo -e "${COLOR}${STATUS}${COLOR_RESET}"
    printf "%-80s" "${1}"
    echo -e "${COLOR}${STATUS}${COLOR_RESET}"
    return 0
}

execute() {
    OUTPUT=`${1} &>/dev/null`
    if [ ! "$?" == 0 ]; then
      print_fail "Failed command: $1"
      exit 1
    fi
    print_ok
}

docker-compose build &>/dev/null
docker-compose up -d &>/dev/null

VERSIONS=( "php-5.5" "php-5.6" "php-7.0" "php-7.1" "php-nightly" "hhvm" )
for VERSION in "${VERSIONS[@]}"
do
    printf "\033c"
    print_info "Run checks with PHP $(docker-compose run $VERSION php -r 'echo phpversion();')"

    # print_task "Run tests"
    # execute "docker-compose run $VERSION php bin/phpunit.phar"
done

docker-compose stop &>/dev/null
docker-compose rm -f &>/dev/null
