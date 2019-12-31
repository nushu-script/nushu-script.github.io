'use strict';

var dictmap;

fetch('https://nushuscript.org/unicode_nushu/map.json')
.then(function(response) { return response.json(); })
.then(function(res) {
	dictmap = res;
});

function makeSingleOrMultipleEntry(ress) {
	var span = document.createElement('span');
	span.lang = 'zh-Nshu';
	span.innerText = ress.map(function(res) {
		return String.fromCodePoint(parseInt(res));
	}).join('');
	return span;
}

function handleConvert() {
	document.getElementById('outputArea').innerHTML = '';

	document.getElementById('inputArea').value.split('').map(function(ch) {
		document.getElementById('outputArea').appendChild(document.createTextNode(ch));
		var ress = dictmap[ch];
		if (ress) {
			document.getElementById('outputArea').appendChild(makeSingleOrMultipleEntry(ress));
		}
	});

	document.getElementById('outputArea').focus();
}
