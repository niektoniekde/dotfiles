# .bashrc

# (re)define aliases - always
alias ll='ls -alhF'
alias ip='ip -c'
alias watch='watch -c'
alias tcpdump='tcpdump -nnn'
alias proxyenv-unset="unset {http,https,no}_proxy; unset {HTTP,HTTPS,NO}_PROXY;"

# don't do this as root
if [[ 0 -ne $(id -u) ]]; then

  # set sudo alias to source our bashrc and preserve user's VARS that matter
  if [[ -f ~/.bashrc ]]; then
    export SUDO_BASHRC="${HOME}/.bashrc"
    alias sudoi='sudo -i --preserve-env="SSH_TTY,EDITOR,TMUXCONF,SUDO_BASHRC" /bin/bash --rcfile ~/.bashrc'
  else
    alias sudoi='sudo -i --preserve-env="SSH_TTY,EDITOR"'
  fi

  # is wpa_cli out of user path? 
  if [[ -x /usr/sbin/wpa_cli ]]; then
    alias wpa_cli='/usr/sbin/wpa_cli'
  fi

  # set TMUXCONF var if .tmux.conf is present in $HOME
  if [[ -f "${HOME}/.tmux.conf" ]]; then
    export TMUXCONF="${HOME}/.tmux.conf"
  fi
fi

# set create tmux alias for root with $TMUXCONF as config file
if [[ $(id -u) -eq 0 ]] && [[ -n ${SUDO_USER} ]]; then
  if [[ -n ${TMUXCONF} ]] && [[ -f ${TMUXCONF} ]]; then
    alias tmux="tmux -f ${TMUXCONF}"
  fi
fi

# interactive only
if [[ $- != *i* ]]; then return; fi

# bash behaviour
shopt -s checkwinsize
shopt -s globstar
shopt -s histappend

export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=100000
export PROMPT_DIRTRIM=3

# export USER's PATH
# - ensure external scripts are idempotent!
if [[ -f ${HOME}/.bash_paths ]]; then
  . "${HOME}/.bash_paths"
fi

# set KUBECONFIG variable
# - ensure external scripts are idempotent!
if [[ -f ${HOME}/.bash_kubeconfig ]]; then
  . "${HOME}/.bash_kubeconfig"
fi

# export HOST variable if empty
if [[ -z ${HOST} && -f /etc/hostname ]]; then
  export HOST=$(</etc/hostname)
fi

# window name if SSH_TTY is present (tmux)
if [[ ! -z ${SSH_TTY} && -z ${TMUX} ]]; then
  printf '\033k%s\033\\' "ssh://${HOST%%.*}"
fi

# fix missing locales if apply
if [[ -z $LC_CTYPE ]]; then          export LC_CTYPE=en_US.UTF-8; fi
if [[ -z $LC_ALL ]]; then            export LC_ALL=en_US.UTF-8; fi
if [[ -z $LC_LANG ]]; then           export LC_LANG=en_US.UTF-8; fi
if [[ -z $LC_NUMERIC ]]; then        export LC_NUMERIC=sk_SK.UTF-8; fi
if [[ -z $LC_MEASUREMENT ]]; then    export LC_MEASUREMENT=sk_SK.UTF-8; fi
if [[ -z $LC_TIME ]]; then           export LC_TIME=sk_SK.UTF-8; fi

# export EDITOR variable
if [[ -x /usr/bin/nvim ]]; then
  export EDITOR=nvim
elif [[ -x /usr/bin/vim ]]; then
  export EDITOR=vim
fi

##
## PS1 customization
##
# return if BASH_VERSINFO is lower than 4
if [[ -z ${BASH_VERSINFO} ]] || [[ ${BASH_VERSINFO} -lt 4 ]]; then return; fi
# powerline or multiline
PS1_STYLE="multiline"
declare -A e_style
# bg colors - base
e_style['bg_black']='\[\033[40m\]'
e_style['bg_red']='\[\033[41m\]'
e_style['bg_green']='\[\033[42m\]'
e_style['bg_yellow']='\[\033[43m\]'
e_style['bg_blue']='\[\033[44m\]'
e_style['bg_magenta']='\[\033[45m\]'
e_style['bg_cyan']='\[\033[46m\]'
e_style['bg_white']='\[\033[47m\]'
# bg colors - bright
e_style['bg_bblack']='\[\033[100m\]'
e_style['bg_bred']='\[\033[101m\]'
e_style['bg_bgreen']='\[\033[102m\]'
e_style['bg_byellow']='\[\033[103m\]'
e_style['bg_bblue']='\[\033[104m\]'
e_style['bg_bmagenta']='\[\033[105m\]'
e_style['bg_bcyan']='\[\033[106m\]'
e_style['bg_bwhite']='\[\033[107m\]'

# fg colors - base
e_style['fg_black']='\[\033[30m\]'
e_style['fg_red']='\[\033[31m\]'
e_style['fg_green']='\[\033[32m\]'
e_style['fg_yellow']='\[\033[33m\]'
e_style['fg_blue']='\[\033[34m\]'
e_style['fg_magenta']='\[\033[35m\]'
e_style['fg_cyan']='\[\033[36m\]'
e_style['fg_white']='\[\033[37m\]'
# fg colors - bright
e_style['fg_bblack']='\[\033[90m\]'
e_style['fg_bred']='\[\033[91m\]'
e_style['fg_bgreen']='\[\033[92m\]'
e_style['fg_byellow']='\[\033[93m\]'
e_style['fg_bblue']='\[\033[94m\]'
e_style['fg_bmagenta']='\[\033[95m\]'
e_style['fg_bcyan']='\[\033[96m\]'
e_style['fg_bwhite']='\[\033[97m\]'
# reset colorization
e_style['reset_all']='\[\033[0m\]'
e_style['bold']='\[\033[1m\]'
e_style['reverse']='\[\033[7m\]'

UID_PS1_FG="${e_style['fg_green']}"
UID_PS1_BG="${e_style['bg_green']}"
if [[ ${UID} -eq 0 ]]; then  
  UID_PS1_FG="${e_style['fg_red']}"  
  UID_PS1_BG="${e_style['bg_red']}"  
fi

HOST_PS1_FG="${e_style['reset_all']}"
if [[ ! -z ${SSH_TTY} ]]; then
  HOST_PS1_FG="${e_style['fg_yellow']}"
fi

# powerline
if [[ ${PS1_STYLE} == "powerline" ]]; then
  PS1=""
  PS1="${PS1}${e_style['bg_white']}${e_style['fg_black']} \H "
  PS1="${PS1}${UID_PS1_BG}${e_style['fg_white']}"
  PS1="${PS1}${e_style['fg_black']} \u "
  PS1="${PS1}${e_style['fg_bblack']}${e_style['reverse']}"
  PS1="${PS1}${e_style['reset_all']}"      
  PS1="${PS1}${e_style['bg_bblack']}${e_style['fg_white']} \w "
  PS1="${PS1}${e_style['reset_all']}"
  PS1="${PS1}${e_style['fg_bblack']}"
  PS1="${PS1}${e_style['reset_all']} \\$"
  PS1="${PS1}${e_style['reset_all']} "
  export PS1
fi

if [[ ${PS1_STYLE} == "multiline" ]]; then
  PS1=" "
  PS1="${PS1}${e_style['fg_magenta']}┌─"
  PS1="${PS1}${e_style['reset_all']} \t "
  PS1="${PS1}${e_style['fg_magenta']}─"
  PS1="${PS1}${e_style['fg_magenta']}${HOST_PS1_FG} \H "
  PS1="${PS1}${e_style['fg_magenta']}["
  PS1="${PS1}${e_style['fg_blue']} \[\w\] "
  PS1="${PS1}${e_style['fg_magenta']}]"
  PS1="${PS1}${e_style['reset_al']}\n "
  PS1="${PS1}${e_style['fg_magenta']}└─"
  PS1="${PS1}${UID_PS1_FG} \u"
  PS1="${PS1}${UID_PS1_FG} \\$"
  PS1="${PS1}${e_style['reset_all']} "
  export PS1
fi
