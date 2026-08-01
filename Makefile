vim-correction:
	./corty.vim/corty.vim ./src.txt
fmt-check:
	fmt -w80 ./src.txt | less
pptext:
	pptext -i ./src.txt -g ./goodwords.txt -a fr -v
sed-clean:
	sed '1,$${/\W\+vim\W\+set\W\+/d}' src.txt > OCR.txt
