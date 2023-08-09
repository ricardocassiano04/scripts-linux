#!/bin/bash
#
# Author: Ricardo Cassiano
#
# Install hblock script
#
# from https://github.com/hectorm/hblock


curl -o /tmp/hblock 'https://raw.githubusercontent.com/hectorm/hblock/v3.4.2/hblock' \
  && echo 'a7d748b69db9f94932333a5b5f0c986dd60a39fdf4fe675ad58364fea59c74b4  /tmp/hblock' | shasum -c \
  && sudo mv /tmp/hblock /usr/local/bin/hblock \
  && sudo chown 0:0 /usr/local/bin/hblock \
  && sudo chmod 755 /usr/local/bin/hblock


curl -o '/tmp/hblock.#1' 'https://raw.githubusercontent.com/hectorm/hblock/v3.4.2/resources/systemd/hblock.{service,timer}' \
  && echo '45980a80506df48cbfa6dd18d20f0ad4300744344408a0f87560b2be73b7c607  /tmp/hblock.service' | shasum -c \
  && echo '87a7ba5067d4c565aca96659b0dce230471a6ba35fbce1d3e9d02b264da4dc38  /tmp/hblock.timer' | shasum -c \
  && sudo mv /tmp/hblock.{service,timer} /etc/systemd/system/ \
  && sudo chown 0:0 /etc/systemd/system/hblock.{service,timer} \
  && sudo chmod 644 /etc/systemd/system/hblock.{service,timer} \
  && sudo systemctl daemon-reload \
  && sudo systemctl enable hblock.timer \
  && sudo systemctl start hblock.timer


touch /etc/hblock/allow.list

touch /etc/hblock/deny.list


# Execute hblock script after download
  hblock


