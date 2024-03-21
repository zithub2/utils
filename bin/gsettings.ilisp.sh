#!/usr/bin/bash

# filename
fn="gsettings.ilisp"
# indent
i='  '

if [ ! -e "$fn" ]; then
  for s in `gsettings list-schemas`; do
    echo "$(printf '%q' "$s")"
    for k in `gsettings list-keys $s` ; do
      echo "$i$(printf '%q' "$k")"
      for q in range describe get writable; do
        echo "$i$i$q $(printf '%q' "$(gsettings $q $s $k)")";
      done
      #exit;
    done
  done >> $fn
fi

#usage of $fn
#  search for keys containing `font`
#    grep -i '^\S\|^$i\S*font' $fn | grep -i -B 1 font
grep -i "^\S\|^$i\S*$1" $fn | grep --color=auto -i -B 1 "$1"
