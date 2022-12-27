list:
	@grep "^[^#[:space:]].*:" Makefile

start:
	python3 find.py

install:
	sudo apt-get update && sudo apt-get install ffmpeg && pip install requirements.txt

convert-mkv:
	ffmpeg -i input.mkv -vn output.ogg

convert-mp4:
	ffmpeg -i input.mp4 -vn output.ogg

clear:
	rm input.mkv input.mp4 output.ogg

