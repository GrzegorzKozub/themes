# git
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="%F{4}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{1}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{2}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%F{3}"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX=" %F{1}"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=" %F{2}"

# zsh-vim-mode
MODE_INDICATOR_VIINS="%K{4} I %F{4}"
MODE_INDICATOR_VICMD="%K{12} N %F{12}"
MODE_INDICATOR_REPLACE="%K{9} R %F{9}"
MODE_INDICATOR_SEARCH="%K{13} S %F{13}"
MODE_INDICATOR_VISUAL="%K{2} V %F{2}"
MODE_INDICATOR_VLINE="%K{2} L %F{2}"

# fzf
FZF_DEFAULT_OPTS='
  --color dark,bg+:-1,fg:14,fg+:10,hl:13,hl+:13
  --color spinner:15,info:15,prompt:14,pointer:10,marker:10
  --layout reverse-list
  --margin 10%,0,0,0
  --no-info
  --prompt " "
  --tabstop 2
'

local function current_dir() { 
  echo %F{6}%3~
}

local function git_prompt() {
  if [[ "$(< /proc/version)" == *@(Microsoft|WSL)* ]]; then return; fi
  if git rev-parse --git-dir > /dev/null 2>&1; then
    echo "$(git_branch)$(git_commits)$(git_changes)"
  fi
}

local function git_branch() {
  echo "%F{3}$(git_remote_status)$(git_current_branch)"
}

local function git_commits() {
  if [[ -n ${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/} ]]; then
    echo "$(git_commits_behind)$(git_commits_ahead)"
  fi
}

local function git_changes() {
  IFS=''

  local stagedAdded=0 stagedModified=0 stagedDeleted=0
  local unstagedAdded=0 unstagedModified=0 unstagedDeleted=0

  git -c color.status=false status --short | while read line
  do
    if [[ $line =~ '^(\w|\?|\s)(\w|\?|\s).+$' ]]; then

      [[ $match[1] == 'A' ]] && stagedAdded=$((stagedAdded + 1))
      [[ $match[1] == 'M' || $match[1] == 'R' || $match[1] == 'C' ]] && stagedModified=$((stagedModified + 1))
      [[ $match[1] == 'D' ]] && stagedDeleted=$((stagedDeleted + 1))

      [[ $match[2] == 'A' || $match[2] == '?' ]] && unstagedAdded=$((unstagedAdded + 1))
      [[ $match[2] == 'M' ]] && unstagedModified=$((unstagedModified + 1))
      [[ $match[2] == 'D' ]] && unstagedDeleted=$((unstagedDeleted + 1))

    fi
  done

  local changes=''

  if [[ $stagedAdded != 0 || $stagedModified != 0 || $stagedDeleted != 0 ]]; then
    changes=" %{$fg[green]%}+$stagedAdded ~$stagedModified -$stagedDeleted"
  fi

  if [[ $unstagedAdded != 0 || $unstagedModified != 0 || $unstagedDeleted != 0 ]]; then
    changes="$changes %{$fg[red]%}+$unstagedAdded ~$unstagedModified -$unstagedDeleted"
  fi

  echo $changes
}

local function vim_mode_and_flags() {
  echo %F{15}${MODE_INDICATOR_PROMPT}"%(1j.%K{3}.%(?.%K{15}.%K{1}))"%{$reset_color%}"%(?..%(1j.%K{1}.))""%(1j.%F{3}.%(?..%F{1}))"%{$reset_color%}"%(?..%(1j.%F{1}.))"%{$reset_color%}
}

PROMPT='$(current_dir) $(git_prompt)
$(vim_mode_and_flags) '

RPS1=''
