#!/bin/bash

. $(dirname $0)/build-common.sh

packages='jre8-openjdk ruby'

install_packages $packages

install_aur_packages riemann
enable_service riemann

gem install riemann-client riemann-tools riemann-dash --no-user-install --no-document
install -m 644 /build/riemann-dash.service /etc/systemd/system/riemann-dash.service
enable_service riemann-dash
