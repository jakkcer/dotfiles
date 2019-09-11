#!/bin/bash

# set profile
echo -ne "\033]1337;SetProfile=$@\a"

# ssh login
ssh "$@"

echo -ne "\033]1337;SetProfile=jakkcer\a"
