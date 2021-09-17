#/usr/bin/env bash

set -u

for d in "echo" "read" "printf" "grep" "curl" "fzf" "tr"; do
  which "$d" &> /dev/null || echo "$d is required to run this script. This
  script might crash without this installed!"
done

languages=`echo "nodejs js ts bash" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "What are you looking for? `echo $'\n> '`" query
if printf $languages | grep -qs $selected; then
  curl "cht.sh/$selected/`echo $query | tr ' ' '+'`"
else
  curl "cht.sh/$selected~$query/"
fi

