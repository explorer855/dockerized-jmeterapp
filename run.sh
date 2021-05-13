#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmeter"
JMETER_VERSION=${JMETER_VERSION:-"5.4"}
IMAGE="messagebusapi/jmeter:${JMETER_VERSION}"
ROOTPATH=$1

echo "$ROOTPATH"
# Finally run
docker stop $NAME &gt; /dev/null 2&gt;&amp;1
docker rm $NAME &gt; /dev/null 2&gt;&amp;1
docker run --name $NAME -i -v $ROOTPATH:/test -w /test $IMAGE ${@:2}
