setopt sharehistory
setopt auto_cd
setopt correct

# alias
# tmux
alias t='tmux'
alias tt='tmux a -t'
alias tl='tmux ls'
# vim
alias v='vim'
# git
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias go='git checkout'
alias gb='git branch'

# prompt setting

obj_color="\e[36;1m"
bar_color="\e[35;1m"
end_color="\e[m"

dir_icon=$'\uf07b'
git_icon=$'\ue0a0'
python_icon=$'\ue235'
double_right=$'\uf63d'
double_left=$'\uf63c'

function bar {
	echo "%F{13} ]─[ %f"
}

function git-branch {
	local branch_name st branch_status

	branch_name=`git symbolic-ref --short HEAD 2> /dev/null`
	
	if [ -z $branch_name ]; then
		return
	fi

	st=`git status 2> /dev/null`

	if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
		branch_status=""
	elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
		branch_status=""
	elif [[ -n `echo "$st" | grep "^Change not staged for commit"` ]]; then
		branch_status="±"
	elif [[ -n `echo "$st" | grep "^Change to be committed"` ]]; then
		branch_status=$'\uf63e'
	elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
		branch_status=$'\ue009'
	else
		branch_status=""
	fi

	echo "`bar`%F{14}$git_icon $branch_name$branch_status%f"
}

function python-env {
	if [ -n "$VIRTUAL_ENV" ]; then
		echo "`bar`%F{14}$python_icon $VIRTUAL_ENV%f"
		return
	elif [ -n "$CONDA_DEFAULT_ENV" ]; then
		echo "`bar`%F{14}$python_icon $CONDA_DEFAULT_ENV%f"
		return
	else
		return
	fi
}


setopt prompt_subst
PROMPT='%F{13}┌─[%f %F{14}$dir_icon %d%f`python-env``git-branch` %F{13}]%f
%F{13}└─$double_right%f'