'use strict';

let dictmap;

fetch('/unicode/correspond.json')
.then((response) => response.json())
.then((res) => void(dictmap = res));

function queryDict(c) {
	const res = dictmap[c];
	return res == null ? null : [...res];
}

function makeEntry_nsgfzsfzt(ress) {
	return ress.map((res) => {
		const img = document.createElement('img');
		img.src = 'https://cdn.jsdelivr.net/gh/nushu-script/nushu-nsgfzsfzt@20200722/' + encodeURIComponent(res) + '.jpg';
		return img;
	});
}

function makeEntry_ntn(ress) {
	const span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.classList.add('noto-traditional-nushu');
	span.innerText = ress.join('');
	return span;
}

function makeEntry_un(ress) {
	const span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.classList.add('unicode-nushu');
	span.innerText = ress.join('');
	return span;
}

function makeEntry_nsn(ress) {
	const span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.classList.add('noto-sans-nushu');
	span.innerText = ress.join('');
	return span;
}

function handleConvert() {
	document.getElementById('outputArea').innerHTML = '';

	const styleSelectValue = styleSelect.options[styleSelect.selectedIndex].value;

	[...document.getElementById('inputArea').value].map((ch) => {
		document.getElementById('outputArea').appendChild(document.createTextNode(ch));
		const ress = queryDict(ch);
		if (ress) {
			switch (styleSelectValue) {
				case 'nsgfzsfzt':
					makeEntry_nsgfzsfzt(ress).map((res) => {
						document.getElementById('outputArea').appendChild(res);
					});
					break;
				case 'noto-traditional-nushu':
					document.getElementById('outputArea').appendChild(makeEntry_ntn(ress));
					break;
				case 'noto-sans-nushu':
					document.getElementById('outputArea').appendChild(makeEntry_nsn(ress));
					break;
				case 'unicode-nushu':
					document.getElementById('outputArea').appendChild(makeEntry_un(ress));
					break;
			}
		}
	});

	document.getElementById('outputArea').focus();
}
