default : docs/list.md docs/converter.js docs/converter_pic.js docs/charMap.js docs/picMap.js docs/converter.htm docs/converter_zh.htm docs/converter_pic.htm docs/converter_pic_zh.htm docs/converter.css docs/index.md docs/index_en.md

docs/list.md : src/list.pl
	perl src/list.pl < data.txt > docs/list.md

docs/converter.js : src/converter.js
	uglifyjs src/converter.js -o docs/converter.js

docs/converter_pic.js : src/converter_pic.js
	uglifyjs src/converter_pic.js -o docs/converter_pic.js

docs/charMap.js : src/charMap.pl
	perl src/charMap.pl < data.txt > docs/charMap.js

docs/picMap.js : src/picMap.pl
	perl src/picMap.pl < data.txt > docs/picMap.js

docs/converter.htm : src/converter.htm
	cp src/converter.htm docs/converter.htm

docs/converter_zh.htm : src/converter_zh.htm
	cp src/converter_zh.htm docs/converter_zh.htm

docs/converter_pic.htm : src/converter_pic.htm
	cp src/converter_pic.htm docs/converter_pic.htm

docs/converter_pic_zh.htm : src/converter_pic_zh.htm
	cp src/converter_pic_zh.htm docs/converter_pic_zh.htm

docs/converter.css : src/converter.css
	cp src/converter.css docs/converter.css

docs/index.md : README.md
	cp README.md docs/index.md

docs/index_en.md : index_en.md
	cp index_en.md docs/index_en.md

clean :
	rm -f docs/list.htm docs/picMap.js docs/charMap.js docs/converter.htm docs/index.md docs/converter.js
