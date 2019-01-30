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

function convert() {
    document.getElementById('selectContext').innerHTML = document.getElementById('textBox').value
    .split('')
    .map(function(ys) {
        return HTMLEncode(ys) + (dictmap[ys] ? dictmap[ys].split(' ').map(makeImg).join('') : '');
    })
    .join('');
}
