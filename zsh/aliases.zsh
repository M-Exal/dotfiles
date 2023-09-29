alias c='cd'
alias cl='clear'
alias vim='nvim'
alias l='ls'
alias r='ranger'
alias n='nvim'
alias vi='nvim'
alias c.="cd .."
alias authors_stats="git log --shortstat --pretty=\"%cE\" | sed 's/\\(.*\\)@.*/\\1/' | grep -v \"^$\" | awk 'BEGIN { line=\"\"; } !/^ / { if (line==\"\" || !match(line, \$0)) {line = \$0 \",\" line }} /^ / { print line \" # \" \$0; line=\"\"}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\\1 0 insertions\\(+\\), \\2/;s/\\(\\+\\)$/\\(\\+\\), 0 deletions\\(-\\)/;s/insertions?\\(\\+\\), //;s/ deletions?\\(-\\)//' | awk 'BEGIN {name=\"\"; files=0; insertions=0; deletions=0;} {if (\$1 != name && name != \"\") { print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\"; files=0; insertions=0; deletions=0; name=\$1; } name=\$1; files+=\$2; insertions+=\$3; deletions+=\$4} END {print name \": \" files \" files changed, \" insertions \" insertions(+), \" deletions \" deletions(-), \" insertions-deletions \" net\";}'"
alias tc="cd ~/teamcheck/ && ./setup_teamcheck.sh"
alias setupdb="cd ~/playr_code/docker/development/ && docker-compose up"
alias execdb="docker exec -it mojjo-web /bin/bash"
