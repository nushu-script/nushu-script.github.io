default : gen/list.pl data.txt
	perl gen/list.pl < data.txt > docs/list.htm
	cp gen/converter.htm docs/converter.htm
	cp gen/index.md docs/index.md

clean :
	rm -f docs/list.htm docs/converter0.js docs/converter1.js docs/converter.htm docs/index.md
