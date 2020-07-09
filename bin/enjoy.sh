if [[ ! ( $# = 1 && -f "$1.ly" ) ]]; then
  echo "arg: infile"
  echo "s.t. infile.ly exists"
  exit 1
fi

ly="$1.ly"
midi="$1.midi"
pdf="$1.pdf"

while : ; do
  echo
  echo "e: edit"
  echo "c: compile"
  echo "p: play midi"
  echo "s: show pdf"
  echo "q: quit"
  read -p "?? " cmd
  case "$cmd" in
    e) vim "$ly";;
    c) lilypond "$ly";;
    p) timidity "$midi";;
    s) evince "$pdf" &;;
    q) exit 0;;
  esac
done


