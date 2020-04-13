# powerline10k

MY_PROMPT_CHAR='●•'

MY_PROMPT_CHAR_COLOR_INSERT_OK=4
MY_PROMPT_CHAR_COLOR_INSERT_ERROR=1

MY_PROMPT_CHAR_COLOR_COMMAND=12
MY_PROMPT_CHAR_COLOR_VISUAL=2
MY_PROMPT_CHAR_COLOR_REPLACE=9

MY_PROMPT_DIR_COLOR=6

MY_PROMPT_GIT_COLOR_BRANCH='%4F'
MY_PROMPT_GIT_COLOR_TAG='%13F'
MY_PROMPT_GIT_COLOR_COMMIT='%3F'

MY_PROMPT_GIT_COLOR_BEHIND='%3F'
MY_PROMPT_GIT_COLOR_AHEAD='%2F'

MY_PROMPT_GIT_COLOR_STASHES='%5F'

MY_PROMPT_GIT_COLOR_CONFLICTED='%9F'

MY_PROMPT_GIT_COLOR_STAGED='%2F'
MY_PROMPT_GIT_COLOR_UNSTAGED='%3F'
MY_PROMPT_GIT_COLOR_UNTRACKED='%9F'

MY_PROMPT_TIME_COLOR=13

MY_PROMPT_AWS_COLOR_PROD=1
MY_PROMPT_AWS_COLOR_TEST=3
MY_PROMPT_AWS_COLOR_DEV=2

MY_PROMPT_VERSION_COLOR=7

# fzf

FZF_DEFAULT_OPTS="
  --color dark,bg+:-1,fg:14,fg+:10,hl:13,hl+:13
  --color spinner:15,info:15,prompt:14,pointer:10,marker:14
  --layout reverse-list
  --margin 10%,0,0,0
  --marker '◆'
  --no-bold
  --no-info
  --pointer '►'
  --prompt '${MY_PROMPT_CHAR} '
  --tabstop 2
"
