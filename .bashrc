# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# interactive only
if [[ $- != *i* ]]; then
  return
else

  # bash behaviour
  shopt -s checkwinsize
  shopt -s globstar
  shopt -s histappend

  HISTCONTROL=ignoreboth
  HISTSIZE=10000
  HISTFILESIZE=100000

  # export EDITOR variable
  if [[ -x /usr/bin/nvim ]]; then
    EDITOR=nvim
  elif [[ -x /usr/bin/vim ]]; then
    EDOTIR=vim
  fi

  export EDITOR

  # fix missing locales if apply
  if [[ -z $LC_CTYPE ]]; then          export LC_CTYPE=en_US.UTF-8; fi
  if [[ -z $LC_ALL ]]; then            export LC_ALL=en_US.UTF-8; fi
  if [[ -z $LC_LANG ]]; then           export LC_LANG=en_US.UTF-8; fi
  if [[ -z $LC_NUMERIC ]]; then        export LC_NUMERIC=sk_SK.UTF-8; fi
  if [[ -z $LC_MEASUREMENT ]]; then    export LC_MEASUREMENT=sk_SK.UTF-8; fi
  if [[ -z $LC_TIME ]]; then           export LC_TIME=sk_SK.UTF-8; fi
  
  # export USER's PATH
  if [[ -f ${HOME}/.bash_paths ]]; then
    . "${HOME}/.bash_paths"
  fi

  export PATH

  # very handy aliases / compatible with unix-like systems
  alias ll='ls -alhF'

  # source additional aliases
  if [[ -f "$HOME/.bash_aliases" ]]; then
    . "$HOME/.bash_aliases"
  fi

  if [[ ! -v e_style['reset_all'] ]]; then
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
  fi
 
  UID_PS1_COLOR="${e_style['bg_green']}"
  if [[ ${UID} -eq 0 ]]; then  
    UID_PS1_COLOR="${e_style['bg_red']}"  
  fi
  
  if [[ -v e_style['reset_all'] ]]; then
    PS1="${e_style['bg_white']}${e_style['fg_black']} \H "
    PS1="${PS1}${UID_PS1_COLOR}${e_style['fg_white']}${e_style['fg_black']} \u ${e_style['fg_bblack']}${e_style['reverse']}${e_style['reset_all']}"             
    PS1="${PS1}${e_style['bg_bblack']}${e_style['fg_white']} \w ${e_style['reset_all']}${e_style['fg_bblack']}${e_style['reset_all']} \\$ ${e_style['reset_all']}"
    export PS1
  fi

  if [[ ! -z ${SSH_TTY} ]]; then
    printf '\033k%s\033\\' "ssh://${HOST%%.*}"
  fi
  
  export USER_BASHRC="SOURCED"
fi
