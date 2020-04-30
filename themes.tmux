#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux source-file "$DIR/tmux/$MY_THEME.tmuxtheme"
tmux source-file "$DIR/tmux/shared.tmuxtheme"
