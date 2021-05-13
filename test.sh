#!/bin/bash
#
# Test the JMeter Docker image using jmx scripts.

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line
rootPath=$1
testFile=$2

echo "Root path: $rootPath"
echo "Test file: $testFile"

T_DIR=.

# Reporting dir: start fresh
R_DIR=$T_DIR/report
rm -rf $R_DIR &gt; /dev/null 2&gt;&amp;1
mkdir -p $R_DIR

rm -f $T_DIR/test-plan.jtl $T_DIR/jmeter.log  &gt; /dev/null 2&gt;&amp;1

./run.sh ${rootPath} -Dlog_level.jmeter=DEBUG \
	-n -t ${T_DIR}/$testFile -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
	-e -o $R_DIR

echo "==== jmeter.log ===="
cat ${T_DIR}/jmeter.log

echo "==== Raw Test Report ===="
cat ${T_DIR}/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"