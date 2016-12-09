#
# Created by Raphael Wouters on jeu,09 jan 2003
# bashrc@raph.udev.org
#

#export LC_MESSAGES="fr_BE.UTF-8"
#export LC_CTYPE="fr_BE.UTF-8"
#export LC_TIME="fr_BE.UTF-8"
#export LC_MONETARY="fr_BE.UTF-8"
#export LC_MESSAGES="fr_BE.UTF-8"
#export LC_PAPER="fr_BE.UTF-8"
#export LC_NAME="fr_BE.UTF-8"
#export LC_ADDRESS="fr_BE.UTF-8"
#export LC_TELEPHONE="fr_BE.UTF-8"
#export LC_MEASUREMENT="fr_BE.UTF-8"
#export LC_IDENTIFICATION="fr_BE.UTF-8"
#export LC_COLLATE="C"

export VISUAL=vim
export EDITOR=vim

export PATH=/Users/rawouter/bin:/opt/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="~/bin:$PATH"


alias p='ptpython --vi'
alias ls='ls -G'
alias ll='ls -lrt'
alias la='ls -lart'
alias l='ls -la'
alias gc="go test -coverprofile c.out; go tool cover -html=c.out; rm c.out"
alias cdw="cd /Users/rawouter/code/go/src/gitlab.cisco.com/bdb/worker"

alias k="kubectl"
alias ks="kubectl --namespace=bdb-services"
alias kw="kubectl --namespace=bdb-workers"
alias ki="kubectl --namespace=bdb-interactive"
alias kc="kubectl --namespace=calico-system"
alias kk="kubectl --namespace=kube-system"
alias kg="kubectl --namespace=gocd"
alias kt="kubectl --namespace=gocd-test"

kcontext() {
  context=$(kubectl config view | grep current-context: | awk 'NF>1{print $NF}')
  echo "[${context}]"
}


kcon() {
 k exec -it $1 /bin/$2
}

kswitch() {
 k config use-context $1
}

kns() {
 # 1: namespace
 # 2: context (bdb / pink) defaults to bdb

 context=$2
 if [[ -z $context ]] ; then
  context="bdb"
 fi

 k config set-context $context --namespace=$1
}

alias kprod="kns bdb-interactive bdb"
alias kstage="kns default pink"

kdelete() {
 k delete service,pod,rc,deployments $1
}

kstats() {
 nodes=( $(k get nodes | awk 'FNR > 1 {print $1}') )
 for (( i=0; i<${#nodes[@]}; i++ )); do
  k describe node ${nodes[i]};
  #| sed -n -e '/Namespace/,$p'
 done
}


alias grep="grep --color"
if [ -n "$SSH_CLIENT"  ] || [ -n "$SSH_TTY"  ]; then
    export PROMPT_DIR_COLOR="\[\e[0;31m\]"
else
    export PROMPT_DIR_COLOR="\[\e[0;33m\]"
fi
export PROMPT_DEVICE_COLOR=""
export PROMPT_USER_COLOR="\[\e[0;32m\]"
export PROMPT_PREPOSITION_COLOR=""
export PROMPT_VENV_COLOR="\[\e[0;36m\]"
export PROMPT_GIT_STATUS_COLOR=""
export PROMPT_GIT_PROGRESS_COLOR=""
export PROMPT_SYMBOL_COLOR="\[\e[0;31m\]"
. ~/.bash_prompt

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# virtualenv
export PATH="/usr/local/lib/python2.7/site-packages:$PATH"
source /usr/local/bin/virtualenvwrapper.sh

# GOlang
export GOPATH="/Users/rawouter/code/go"
export PATH="$GOPATH/bin:$PATH"

set -o vi
