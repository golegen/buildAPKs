#!/bin/env sh 
# Copyright 2019 (c) all rights reserved 
# by BuildAPKs https://buildapks.github.io/buildAPKs/
# Contributeur : https://github.com/SDRausty
# Invocation : $HOME/buildAPKs/scripts/sh/init/setup.sh sources/
#####################################################################
set -e

STRINGA="Command \`au\` enables rollback; Available at https://github.com/sdrausty/au : Continuing..."
STRINGC="Cannot update ~/buildAPKs prerequisites : Continuing..."
printf "%s\\n" "Beginning buildAPKs setup:"
for CMD in au pkg
do
       	[ ! -z "$(command -v "$CMD")" ] && ("$CMD" aapt apksigner curl dx ecj findutils git) || (printf "\\e[1;38;5;117m%s\\n" "$STRINGA") 
done
cd "$HOME"
(git clone https://github.com/BuildAPKs/buildAPKs) || (printf "%s\\n\\n" "$STRINGC") 
(git clone https://github.com/BuildAPKs/buildAPKs.entertainment) || (printf "%s\\n\\n" "$STRINGC") 
"$HOME/buildAPKs/scripts/sh/build/build.dir.sh" "$HOME/buildAPKs/sources/entertainment"

#EOF
