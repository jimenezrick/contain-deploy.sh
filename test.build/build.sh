#!/bin/bash

. $(dirname $0)/build-common.sh

install -m 644 $(render_template /build/foo) /etc/foo
