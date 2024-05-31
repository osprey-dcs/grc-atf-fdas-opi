#!/bin/sh

export JAVA_HOME="/Applications/CSS_Phoebus.app/jdk"
PATH="$JAVA_HOME/Contents/Home/bin:$PATH"

usage() {
    echo "Usage: %0 [xxx.bob]" >&2
    exit 1
}

case "$#" in
    0) BOB="atf-main.bob" ;;
    1) BOB="$1" ;;
    *) usage ;;
esac
case "$BOB" in
    *.bob)  ;;
    *) usage ;;
esac

export P="FDAS:"

export arch="$EPICS_HOST_ARCH"
/Applications/CSS_Phoebus.app/phoebus-4.7.3-SNAPSHOT/phoebus.sh -resource "file://$PWD/$BOB?app=display_runtime"
