#!/bin/bash
# This program provides dummy data to XCBuild

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
pushd "$SCRIPTPATH/.." > /dev/null
set -e
while [[ $# -gt 0 ]]
do
    case $1 in
        -MF)
           shift
           echo "mkdir -p "$(dirname $1)""
           mkdir -p "$(dirname $1)"
           touch "$1"
            ;;
        -o)
           shift
           echo "mkdir -p "$(dirname $1)""
           mkdir -p "$(dirname $1)"
           # TODO: Determine object file architecture based on target arch
           echo "ditto $SCRIPTPATH/x86_64_ObjectStub.o "$1""
           ditto $SCRIPTPATH/x86_64_ObjectStub.o "$1"
            ;;
        *)
            shift # past argument
            ;;
    esac
done

