#!/bin/sh
echo ' > Development :: Bun'

sudo apt install unzip
curl -fsSL https://bun.com/install | bash

exec $SHELL
bun --version

echo '   [bun-dev]     ...done!'
