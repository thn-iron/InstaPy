#!/bin/bash

CWD=$(cd "$(dirname "$0")" && pwd)

NAME="instapy"
VERSION="0.6.1"

MODULE=${NAME}-${VERSION}

case "$1" in
  'clean')
    rm -rf $CWD/{build,dist,${NAME}.egg-info}
    ;;

  'install')
    python setup.py install
    ;;

  'build.src')
    python setup.py sdist
    ;;

  'build.wheel')
    python setup.py bdist_wheel
    ;;

  'deploy.local')
    $0 build.wheel
    pip install $CWD/dist/${MODULE}-py2-py3-none-any.whl
    ;;

  *)
    echo "Usage: $0 options"
    echo "where options are"
    echo "- clean # remove build related directories"
    echo "- install # install working version of its to virtual environment"
    echo
    echo "# for local deployment"
    echo "- build.src # build project in wheel file for deployment"
    echo "- build.wheel # build project in wheel file for deployment"
    echo "- deploy.local # <file prefix>-<version> (i.e instapy)"
    echo

esac
exit 0