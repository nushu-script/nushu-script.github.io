default : docs/cnv/converter.js           \
docs/cnv/converter_pic.js                 \
docs/cnv/charMap.js                       \
docs/cnv/picMap.js                        \
docs/cnv/index.htm                        \
docs/cnv/index_zh.htm                     \
docs/cnv/index_pic.htm                    \
docs/cnv/index_pic_zh.htm                 \
docs/cnv/converter.css                    \
                                          \
docs/ime/index.md                         \
docs/ime/UnicodeNushu.zip                 \
                                          \
docs/lst/index.md                         \
                                          \
docs/index.md                             \
docs/index_en.md

# intermediate products

data.txt :
	wget -q https://raw.githubusercontent.com/chromezh/unicode_nushu/master/data.txt

s2nushu.txt : ime/s2nushu.pl data.txt
	perl ime/s2nushu.pl < data.txt > s2nushu.txt

# results

## cnv

docs/cnv/converter.js : cnv/converter.js
	uglifyjs cnv/converter.js -o docs/cnv/converter.js

docs/cnv/converter_pic.js : cnv/converter_pic.js
	uglifyjs cnv/converter_pic.js -o docs/cnv/converter_pic.js

docs/cnv/charMap.js : cnv/charMap.pl data.txt
	perl cnv/charMap.pl < data.txt > docs/cnv/charMap.js

docs/cnv/picMap.js : cnv/picMap.pl data.txt
	perl cnv/picMap.pl < data.txt > docs/cnv/picMap.js

docs/cnv/index.htm : cnv/index.htm
	cp cnv/index.htm docs/cnv/index.htm

docs/cnv/index_zh.htm : cnv/index_zh.htm
	cp cnv/index_zh.htm docs/cnv/index_zh.htm

docs/cnv/index_pic.htm : cnv/index_pic.htm
	cp cnv/index_pic.htm docs/cnv/index_pic.htm

docs/cnv/index_pic_zh.htm : cnv/index_pic_zh.htm
	cp cnv/index_pic_zh.htm docs/cnv/index_pic_zh.htm

docs/cnv/converter.css : cnv/converter.css
	cp cnv/converter.css docs/cnv/converter.css

## ime

docs/ime/index.md : ime/index.md
	cp ime/index.md docs/ime/index.md

docs/ime/UnicodeNushu.zip : ime/unicode_nushu_romanization.dict.yaml ime/unicode_nushu_romanization.schema.yaml ime/luna_pinyin_nushu.schema.yaml ime/s2nushu.json s2nushu.txt
	7z a docs/ime/UnicodeNushu.zip ime/unicode_nushu_romanization.dict.yaml ime/unicode_nushu_romanization.schema.yaml ime/luna_pinyin_nushu.schema.yaml ime/s2nushu.json s2nushu.txt

## lst

docs/lst/index.md : lst/index.pl data.txt
	perl lst/index.pl < data.txt > docs/lst/index.md

## index

docs/index.md : README.md
	cp README.md docs/index.md

docs/index_en.md : index_en.md
	cp index_en.md docs/index_en.md

clean :
	rm -f data.txt                        \
s2nushu.txt                               \
docs/cnv/converter.js                     \
docs/cnv/converter_pic.js                 \
docs/cnv/charMap.js                       \
docs/cnv/picMap.js                        \
docs/cnv/index.htm                        \
docs/cnv/index_zh.htm                     \
docs/cnv/index_pic.htm                    \
docs/cnv/index_pic_zh.htm                 \
docs/cnv/converter.css                    \
                                          \
docs/ime/index.md                         \
docs/ime/UnicodeNushu.zip                 \
                                          \
docs/lst/index.md                         \
                                          \
docs/index.md                             \
docs/index_en.md
