PROMPT="%{$fg_bold[grey]%}[%*] %{$fg_bold[green]%}%n@%m%{$fg_bold[grey]%}:%{$fg_bold[blue]%}%~"
PROMPT+='%{$reset_color%}$(git_prompt_info) %{$reset_color%}%# '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[grey]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[grey]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
