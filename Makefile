INPUT := $(shell basename input.*)
MP3 := input.mp3
MP4 := input.mp4
MKV := input.mkv

help:
	@echo "Usage:"
	@echo "make install        install ffmpge"
	@echo "make convert        convert from .mp3, .mp4 or .mkv to .ogg"
	@echo "make start          search track"
	@echo "make clean          remove all input - output files"

install:
	sudo apt-get update && sudo apt-get install ffmpeg && pip3 install -r requirements.txt

start:
	python3 find.py

convert:
ifeq ($(INPUT), $(MP3))
	ffmpeg -i $(MP3) -vn output.ogg
else ifeq ($(INPUT), $(MP4))
	ffmpeg -i $(MP4) -vn output.ogg
else
	ffmpeg -i $(MKV) -vn output.ogg
endif

clean:
	rm input.mkv input.mp3 input.mp4 output.ogg 2>/dev/null || true

