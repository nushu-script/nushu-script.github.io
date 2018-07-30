default : docs/converter.js docs/converter_pic.js docs/charMap.js docs/picMap.js docs/converter.htm docs/converter_zh.htm docs/converter_pic.htm docs/converter_pic_zh.htm docs/converter.css docs/ime.md docs/index.md docs/list.md docs/index_en.md docs/UnicodeNushu.zip

data.txt :
	wget -q https://raw.githubusercontent.com/chromezh/unicode_nushu/master/data.txt

docs/converter.js : cnv/converter.js
	uglifyjs cnv/converter.js -o docs/converter.js

docs/converter_pic.js : cnv/converter_pic.js
	uglifyjs cnv/converter_pic.js -o docs/converter_pic.js

docs/charMap.js : cnv/charMap.pl
	perl cnv/charMap.pl < data.txt > docs/charMap.js

docs/picMap.js : cnv/picMap.pl data.txt
	perl cnv/picMap.pl < data.txt > docs/picMap.js

docs/converter.htm : cnv/converter.htm
	cp cnv/converter.htm docs/converter.htm

docs/converter_zh.htm : cnv/converter_zh.htm
	cp cnv/converter_zh.htm docs/converter_zh.htm

docs/converter_pic.htm : cnv/converter_pic.htm
	cp cnv/converter_pic.htm docs/converter_pic.htm

docs/converter_pic_zh.htm : cnv/converter_pic_zh.htm
	cp cnv/converter_pic_zh.htm docs/converter_pic_zh.htm

docs/converter.css : cnv/converter.css
	cp cnv/converter.css docs/converter.css

ime/s2nushu.txt : ime/s2nushu.pl
	perl ime/s2nushu.pl < data.txt > ime/s2nushu.txt

docs/ime.md : ime/ime.md
	cp ime/ime.md docs/ime.md

docs/UnicodeNushu.zip : ime/unicode_nushu_romanization.dict.yaml ime/unicode_nushu_romanization.schema.yaml ime/luna_pinyin_nushu.schema.yaml ime/s2nushu.json ime/s2nushu.txt
	7z a docs/UnicodeNushu.zip ime/unicode_nushu_romanization.dict.yaml ime/unicode_nushu_romanization.schema.yaml ime/luna_pinyin_nushu.schema.yaml ime/s2nushu.json ime/s2nushu.txt

docs/list.md : lst/list.pl data.txt
	perl lst/list.pl < data.txt > docs/list.md

docs/index.md : README.md
	cp README.md docs/index.md

docs/index_en.md : index_en.md
	cp index_en.md docs/index_en.md

clean :
	rm -rf docs/*.*
