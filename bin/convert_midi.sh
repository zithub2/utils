if [[ ! ( $# = 1 && "$1" =~ .*[.]midi?$ ) ]]; then
  echo "arg: infile.midi"
  exit 1
fi

f="${1%mid*}"
wav="${f}wav"
ogg="${f}ogg"
mp3="${f}mp3"

rm -f "$wav" "$ogg" "$mp3"

timidity "$1" -Ow -o "$wav"
timidity "$1" -OF -o "$ogg"
ffmpeg -i "$wav" -acodec libmp3lame -ab 256k "$mp3"

