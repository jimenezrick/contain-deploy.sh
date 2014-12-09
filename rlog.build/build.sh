#!/bin/bash

. $(dirname $0)/build-common.sh

packages='nginx git'

install_packages $packages

install $(temp_http https://raw.githubusercontent.com/jimenezrick/rlog/master/nginx/nginx.conf) /etc/nginx/nginx.conf
install -o http -g http -d /srv/http/www /srv/http/cache /srv/http/tmp
enable_service nginx

git clone https://github.com/jimenezrick/rlog.git /srv/rlog
install -m 755 $(temp_http https://github.com/jimenezrick/rlog/releases/download/v0.1/rlog) /srv/rlog/rlog
install -m 644 /srv/rlog/systemd/rlog.service /etc/systemd/system/rlog.service
enable_service rlog
