
convert(){
	local path=$1
	local suffix=$2
	
	timidity -Ow -o - $path$suffix.midi | lame - -b 8 $path$suffix.mp3
}


path=stralande_jul
cd $path
lilypond $path.ly
convert $path
convert $path -Bass
convert $path -Tenor
convert $path -Alt
convert $path -Sopran
