default : docs/list.htm docs/converter/converter.js docs/converter/converter_pic.js docs/charMap.js docs/picMap.js docs/converter/converter.htm docs/converter/converter_zh.htm docs/converter/converter_pic.htm docs/converter/converter_pic_zh.htm docs/converter/converter.css docs/index.md

docs/list.htm : gen/list.pl
	perl gen/list.pl < data.txt > docs/list.htm

docs/converter/converter.js : gen/converter.js
	uglifyjs gen/converter.js -o docs/converter/converter.js

docs/converter/converter_pic.js : gen/converter_pic.js
	uglifyjs gen/converter_pic.js -o docs/converter/converter_pic.js

docs/charMap.js : gen/charMap.pl
	perl gen/charMap.pl < data.txt > docs/charMap.js

docs/picMap.js : gen/picMap.pl
	perl gen/picMap.pl < data.txt > docs/picMap.js

docs/converter/converter.htm : gen/converter.htm
	cp gen/converter.htm docs/converter/converter.htm

docs/converter/converter_zh.htm : gen/converter_zh.htm
	cp gen/converter_zh.htm docs/converter/converter_zh.htm

docs/converter/converter_pic.htm : gen/converter_pic.htm
	cp gen/converter_pic.htm docs/converter/converter_pic.htm

docs/converter/converter_pic_zh.htm : gen/converter_pic_zh.htm
	cp gen/converter_pic_zh.htm docs/converter/converter_pic_zh.htm

docs/converter/converter.css : gen/converter.css
	cp gen/converter.css docs/converter/converter.css

docs/index.md : README.md
	cp README.md docs/index.md

clean :
	rm -f docs/list.htm docs/picMap.js docs/charMap.js docs/converter.htm docs/index.md docs/converter.js
