#!/bin/sh
echo ' > Development :: Node'

curl -fsSL https://fnm.vercel.app/install | bash

exec $SHELL
fnm install v22

echo '   [node-dev]     ...done!'
