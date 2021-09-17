#/usr/bin/env bash

set -e
set -u

languages=`echo "nodejs js ts bash" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "What are you looking for? `echo $'\n> '`" query
if printf $languages | grep -qs $selected; then
  curl "cht.sh/$selected/`echo $query | tr ' ' '+'`"
else
  curl "cht.sh/$selected~$query/"
fi

