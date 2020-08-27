'use strict';

/* Baidu analytics */

var _hmt = _hmt || [];

(function() {
	var hm = document.createElement("script");
	hm.src = "https://hm.baidu.com/hm.js?dcbaf5b7a829c56b9d361330ffb0a26e";
	var s = document.getElementsByTagName("script")[0]; 
	s.parentNode.insertBefore(hm, s);
})();

/* Mail */

function makeMail() {
	var _h='&#x69;&#x70;&#x74;&#x2E;&#x6F;&#x72;&#x67;';
	var _a='&#x72;&#x74;&#x40;&#x6E;&#x75;&#x73;&#x68;&#x75;&#x73;&#x63;&#x72;';
	var _n='&#x73;&#x75;&#x70;&#x70;&#x6F;';
	var _e=_n+_a+_h;
	_a=document.createElement('span');
	_a.innerHTML=_e;
	return 'm'+'a'+'ilto'+':'+_a.innerText;
}

window.addEventListener('DOMContentLoaded', function() {
	var meilbwox = document.getElementById('meilbwox');
	if (meilbwox)
		meilbwox.href = makeMail();
});
