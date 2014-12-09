#!/bin/bash

. $(dirname $0)/common.sh

packagess='nginx'

pacman --needed --noconfirm -S $packagess
