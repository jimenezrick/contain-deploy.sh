#!/bin/bash

. $(dirname $0)/build-common.sh

packages='nginx'

upgrade_packages
install_packages $packages

install $(http_temp https://raw.githubusercontent.com/jimenezrick/rlog/master/nginx/nginx.conf) /etc/nginx/nginx.conf
install -o http -g http -d /srv/http/www /srv/http/cache /srv/http/tmp
enable_service nginx
