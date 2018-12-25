"use strict";

var xs;
var xs_choice;

function HTMLEncode(input) {
    var converter = document.createElement("DIV");
    converter.innerText = input;
    var output = converter.innerHTML;
    converter = null;
    return output;
} 

function convert() {
    xs = document.getElementById("textBox").value.split("").map(function(x) {
        var s = dictmap[x];
        if (!s)
            return x;
        else
            return s.split(" ").map(function(n) { return String.fromCodePoint(parseInt(n)); });
    });
    var selectContextHTML = "";
    for (var i = 0; i < xs.length; i++) {
        var ys = xs[i];
        if (ys) {
            if (!(ys instanceof Array)) {
                selectContextHTML += HTMLEncode(ys);
            } else if (ys.length == 1) {
                selectContextHTML += ys[0];
            } else {
                selectContextHTML += "<select id=\"NC_" + i + "\" class=\"nushu selectContextChoice\" onchange=\"mergeResult(this.id, this.selectedIndex)\" size=\"1\">";
                for (var j = 0; j < ys.length; j++) {
                    selectContextHTML += "<option class=\"nushu selectContextChoice\">" + ys[j] + "</option>";
                }
                selectContextHTML += "</select>";
            }
        }
    }
    xs_choice = xs.map(function(x) {return 0;});
    document.getElementById("selectContext").innerHTML = selectContextHTML;
    showText();
}

function mergeResult(xsi, i) {
    xs_choice[xsi.substring(3)] = i;
    showText();
}

function showText() {
    var ret = "";
    for (var i = 0; i < xs.length; i++) {
        var s = xs[i];
        if (s) {
            ret += s[xs_choice[i]];
        }
    }
    document.getElementById("output").value = ret;
}
