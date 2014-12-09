#!/bin/bash

. $(dirname $0)/build-common.sh

packages='nginx'

upgrade_packages
install_packages $packages
