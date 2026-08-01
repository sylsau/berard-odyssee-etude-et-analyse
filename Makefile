vim-correction:
	./corty.vim/corty.vim ./ocr.txt
fmt-check:
	fmt -w80 ./ocr.txt | less
pptext:
	pptext -i ./ocr.txt -g ./goodwords.txt -a fr -v
