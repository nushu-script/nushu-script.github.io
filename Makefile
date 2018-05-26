default : gen/list.pl data.txt
	perl gen/list.pl < data.txt > docs/list.htm
	perl gen/converter0.pl < data.txt > docs/converter0.js
	cp gen/converter.htm docs/converter.htm
	cp README.md docs/index.md
	uglifyjs gen/converter.js -o docs/converter.js

clean :
	rm -f docs/list.htm docs/converter0.js docs/converter1.js docs/converter.htm docs/index.md docs/converter.js
