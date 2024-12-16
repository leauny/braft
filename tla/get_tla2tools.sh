#!/usr/bin/env bash

LATEST_VERSION=$(curl -s https://api.github.com/repos/tlaplus/tlaplus/releases/latest | grep "tag_name" | cut -d '"' -f 4)
wget https://github.com/tlaplus/tlaplus/releases/download/${LATEST_VERSION}/tla2tools.jar
