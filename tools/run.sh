#!/bin/bash
# SPDX-license-identifier: Apache-2.0
##############################################################################
# Copyright (c) 2017-2018
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
#############################################################################

function usage {
    cat <<EOF
Usage: run.sh Command [-y] [-?]
Optional arguments:
    -y
        Skips warning prompt.
    -g
        Skips creation or retrieve image process.
    -i
        Skips installation service process.
    -s <suite>
        Test suite to use in testing mode.
    -c <case>
        Test case to use in testing mode.
Commands:
    dns|mr|sdc|aai|mso|robot|vid|sdnc|portal|dcae|policy|appc|vfc|vnfsdk|multicloud|ccsdk|vvp|openstack|msb|oom|dmaap|integration  Deploy chosen service.
    testing  Deploy in testing mode.
EOF
}

run=false
test_suite="*"
test_case="*"

COMMAND=$1

while getopts "ygis:c:" OPTION "${@:2}"; do
    case "$OPTION" in
    y)
        run=true
        ;;
    g)
        export SKIP_GET_IMAGES="True"
        ;;
    i)
        export SKIP_INSTALL="True"
        ;;
    s)
        if [ "$COMMAND" != "testing" ] ; then
            echo "Test suite should only be specified in testing mode."
            echo "./tools/run.sh -? for usage."
            exit 1
        fi
        test_suite=$OPTARG
        ;;
    c)
        if [ "$COMMAND" != "testing" ] ; then
            echo "Test case should only be specified in testing mode."
            echo "./tools/run.sh -? for usage."
            exit 1
        fi
        test_case=$OPTARG
        ;;
    \?)
        usage
        exit 1
        ;;
    esac
done

case $COMMAND in
    "dns" | "mr" | "sdc" | "aai" | "mso" | "robot" | "vid" | "sdnc" | "portal" | "dcae" | "policy" | "appc" | "vfc" | "vnfsdk"| "multicloud" | "ccsdk" | "vvp" | "openstack" | "msb" | "oom" | "dmaap" | "integration" )
        export DEPLOY_MODE='individual'
        ;;
    "testing" )
        export DEPLOY_MODE='testing'
        if  [ "$run" == false ] ; then
            while true ; do
                echo "Warning: This test script will delete the contents of ../opt/ and ~/.m2."
                read -p "Would you like to continue? [y]es/[n]o: " yn
                case $yn in
                    [Yy]*)
                        break
                        ;;
                    [Nn]*)
                        echo "Exiting."
                        exit 0
                        ;;
                esac
            done
        fi

        export TEST_SUITE=$test_suite
        export TEST_CASE=$test_case
        rm -rf ./opt/
        rm -rf ~/.m2/
        ;;
    * )
        usage
        exit 1
esac

vagrant destroy -f $COMMAND
vagrant up $COMMAND
