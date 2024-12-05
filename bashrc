# .bashrc

# for non-interactive sessions stop execution here -- https://serverfault.com/a/805532/67528
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ~/.alias

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
