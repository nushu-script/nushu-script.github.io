"use strict";

function HTMLEncode(input) {
	var x = document.createElement('p');
	x.innerText = input;
	return x.innerHTML;
}

var dictmap;

fetch('https://nushuscript.org/nsbzzzd/map.json')
.then(function(response) { return response.json(); })
.then(function(res) {
	dictmap = res;
});

function makeImg(input) {
	var id = input[0], romanization = input[1];
	return '<img id="' + id + '" alt="' + romanization + '" src="https://nushuscript.org/nsbzzzd/img/' + id + '.png"/>';
}

function processChar(ys) {
	return dictmap[ys] ?
	HTMLEncode(ys) + dictmap[ys].map(makeImg).join('') :
	HTMLEncode(ys);
}

function handleConvert() {
	boxSelect.innerHTML = boxInput.value.split('').map(processChar).join('');
}
