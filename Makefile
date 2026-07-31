vim-correction:
	./corty.vim/corty.vim ./ocr.txt
fmt-check:
	fmt -w80 ./ocr.txt | less
