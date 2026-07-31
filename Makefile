vim-correction:
	vim -S corrections.vim ./ocr.txt
fmt-check:
	fmt -w80 ./ocr.txt | less
