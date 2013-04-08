# ~/.bash_profile: executed by bash(1) for login shells.

# include .bashrc
keychain ~/.ssh/id_rsa --nogui

[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && \
  source $HOME/.keychain/$HOSTNAME-sh
[[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ]] && \
  source  $HOME/.keychain/$HOSTNAME-sh-gpg


source ~/.bashrc
