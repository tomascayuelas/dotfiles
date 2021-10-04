#!/bin/bash

laptop="c0d3r"
desktop="g0rr10n"

case $HOSTNAME in
  "$laptop")
    whereiam="laptop"
    ;;
  "$desktop")
    whereiam="desktop"
    ;;
  *)
    whereiam="I don't know... :("
    ;;
esac

echo -n $whereiam
exit 0
