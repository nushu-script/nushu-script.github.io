"use strict";

function HTMLEncode(input) {
    var converter = document.createElement("DIV");
    converter.innerText = input;
    var output = converter.innerHTML;
    converter = null;
    return output;
} 

function picNoToHTML(input) {
    return "<img id=\"" + input + "\" src=\"glyph/" + input + ".jpg\" style=\"vertical-align: text-top;\" width=\"44\" height=\"158\" />";
} 

function convert() {
    var selectContextHTML = "";
    var xs = document.getElementById("textBox").value.split("");
    for (var i = 0; i < xs.length; i++) {
        var ys = xs[i];
        var mapedYs = picMap[ys];
        if (!mapedYs) {
            selectContextHTML += HTMLEncode(ys);
        } else {
            var splitedMapedYs = mapedYs.split("|");
            selectContextHTML += HTMLEncode(ys);
            for (var j = 0; j < splitedMapedYs.length; j++) {
                selectContextHTML += picNoToHTML(splitedMapedYs[j]);
            }
        }
    }
    document.getElementById("selectContext").innerHTML = selectContextHTML;
}
