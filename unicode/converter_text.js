"use strict";

function HTMLEncode(input) {
	var x = document.createElement('p');
	x.innerText = input;
	return x.innerHTML;
}

var dictmap;

fetch('https://nushuscript.org/unicode_nushu/map.json')
.then(function(response) { return response.json(); })
.then(function(res) {
	dictmap = res;
});

var storage;

function handleConvert() {
	// Store to global variable
	storage = boxInput.value.split('').map(function(x) {
		var s = dictmap[x];
		if (!s) {
			return x;
		} else {
			var s2 = s.map(function(n) { return String.fromCodePoint(parseInt(n)); });
			if (s2.length == 1)
				return s2[0];
			else
				return { value: s2, chosen: 0 };
		}
	});

	// Build HTML
	boxSelect.innerHTML = Array.from(storage, function(x, i) {
		if (Object.prototype.toString.call(x) === '[object String]')
			return HTMLEncode(x);
		else
			return '<select onchange="storage[' + i + '].chosen = this.selectedIndex; pushResult()">'
				+ x.value.map(function(y) {
					return '<option>' + y + '</option>'
				}).join('')
				+ '</select>';
	}).join('');

	// Select2
	$('select').select2({ minimumResultsForSearch: Infinity, width: '1.5em' });

	pushResult();
}

function pushResult() {
	boxOutput.value = storage.map(function(x) {
		if (Object.prototype.toString.call(x) === '[object String]')
			return x;
		else
			return x.value[x.chosen];
	}).join('');
}
