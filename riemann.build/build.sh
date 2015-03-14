#!/bin/bash

. $(dirname $0)/build-common.sh

packages='jre8-openjdk'

install_aur_packages "$packages" riemann
