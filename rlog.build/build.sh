#!/bin/bash

. $(dirname $0)/build-common.sh

packages='git nginx'
rlog_repo='https://github.com/jimenezrick/rlog.git'
rlog_bin='https://github.com/jimenezrick/rlog/releases/download/v0.1/rlog'

install_packages $packages

git clone $rlog_repo /srv/rlog

install -m 755 $(temp_http $rlog_bin) /srv/rlog/rlog
install -m 644 /srv/rlog/extra/systemd/rlog.service /etc/systemd/system/rlog.service
enable_service rlog

install -m 755 -o http -g http -d /srv/http/www /srv/http/cache /srv/http/tmp
install -m 644 /srv/rlog/extra/nginx/nginx.conf /etc/nginx/nginx.conf
enable_service nginx
