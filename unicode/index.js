'use strict';

var dictmap;

fetch('/unicode/map.json')
.then(function(response) { return response.json(); })
.then(function(res) { dictmap = res; });

function makeEntry_nsgfzsfzt(ress) {
	return ress.map(function(res) {
		var img = document.createElement('img');
		img.src = 'https://cdn.jsdelivr.net/gh/nushu-script/nushu-nsgfzsfzt@latest/' + res + '.jpg';
		return img;
	});
}

function makeEntry_ntn(ress) {
	var span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.classList.add('noto-traditional-nushu');
	span.innerText = ress.join('');
	return span;
}

function makeEntry_un(ress) {
	var span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.classList.add('unicode-nushu');
	span.innerText = ress.join('');
	return span;
}

function makeEntry_nsn(ress) {
	var span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.classList.add('noto-sans-nushu');
	span.innerText = ress.join('');
	return span;
}

function handleConvert() {
	document.getElementById('outputArea').innerHTML = '';

	var styleSelectValue = styleSelect.options[styleSelect.selectedIndex].value;

	document.getElementById('inputArea').value.split('').map(function(ch) {
		document.getElementById('outputArea').appendChild(document.createTextNode(ch));
		var ress = dictmap[ch];
		if (ress) {
			switch (styleSelectValue) {
				case 'nsgfzsfzt':
					makeEntry_nsgfzsfzt(ress).map(function(res) {
						document.getElementById('outputArea').appendChild(res);
					});
					break;
				case 'noto-traditional-nushu':
					document.getElementById('outputArea').appendChild(makeEntry_ntn(ress));
					break;
				case 'unicode-nushu':
					document.getElementById('outputArea').appendChild(makeEntry_un(ress));
					break;
				case 'noto-sans-nushu':
					document.getElementById('outputArea').appendChild(makeEntry_nsn(ress));
					break;
			}
		}
	});

	document.getElementById('outputArea').focus();
}
