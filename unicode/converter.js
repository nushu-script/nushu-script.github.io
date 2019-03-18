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

function makeImg(input) {
    return '<img id="' + input + '" src="https://nushuscript.org/unicode_nushu/glyph/' + input + '.jpg" />';
}

function processChar(ys) {
    return dictmap[ys] ?
    HTMLEncode(ys) + dictmap[ys].map(makeImg).join('') :
    HTMLEncode(ys);
}

function convert() {
    document.getElementById('selectContext').innerHTML = document.getElementById('textBox').value.split('').map(processChar).join('');
}
