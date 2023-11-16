alias c='cd'
alias cl='clear'
alias lc='clear'
alias ck='clear'
alias l='ls'
alias r='ranger'
alias c.="cd .."
alias t="tig"
alias authors_stats="git log --shortstat --pretty=\"%cE\" | sed 's/\\(.*\\)@.*/\\1/' | grep -v \"^$\" | awk 'BEGIN { line=\"\"; } !/^ / { if (line==\"\" || !match(line, \$0)) {line = \$0 \",\" line }} /^ / { print line \" # \" \$0; line=\"\"}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\\1 0 insertions\\(+\\), \\2/;s/\\(\\+\\)$/\\(\\+\\), 0 deletions\\(-\\)/;s/insertions?\\(\\+\\), //;s/ deletions?\\(-\\)//' | awk 'BEGIN {name=\"\"; files=0; insertions=0; deletions=0;} {if (\$1 != name && name != \"\") { print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\"; files=0; insertions=0; deletions=0; name=\$1; } name=\$1; files+=\$2; insertions+=\$3; deletions+=\$4} END {print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\";}'"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gch="git checkout"
alias gb="git branch -a"
alias c..="cd .. &&cd .."
alias v="vim"
alias ivm="vim"
alias vi="vim"
