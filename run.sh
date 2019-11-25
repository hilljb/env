#!/bin/bash

USAGE="""
    usage: run.sh\n
        [-w|--workdir workdir (default=\$HOME)] The (external) dir to mount at /opt/workdir\n
        [-m|--memory n (default=4)] The memory (GBs) to allocate to this Docker container\n
"""

# Set defaults
DATADIR="$HOME"
WORKDIR="$HOME"
DOCKMEM="4"

# Parse input options
while [[ $# -gt 0 ]]; do
    KEY="$1"
    case $KEY in
       -w|--workdir)
        WORKDIR="$2"
        echo "-- workdir set to $WORKDIR"
        shift
        ;;
        -m|--memory)
        DOCKMEM="$2"
        echo "-- docker memory set to $DOCKMEM"
        shift
        ;;
       -h|help|-help|--help)
        echo -e $USAGE
        exit 0
        ;;
        *)
        ;;
    esac
    shift
done

# Form docker run string
RUNSTRING="docker run -p 8888:8888 -m ${DOCKMEM}G -v $WORKDIR:/home/jovyan/work -it quay.io/hilljb/pythonenv jupyter lab"

# Run it
echo "${RUNSTRING}"
eval ${RUNSTRING}
