'use strict';

var dictmap;

fetch('https://nushuscript.org/nsbzzzd/table.json')
.then(function(response) { return response.json(); })
.then(function(res) {
	dictmap = buildIndex(res);
});

function buildIndex(dictarr) {
	return dictarr.reduce(function(obj, x) {
		var id = x[0], romanization = x[1], chars = x[2];
		for (var i = 0, n = chars.length; i < n; i++) {
			var oldVal = obj[chars[i]];
			if (!oldVal)
				obj[chars[i]] = [[id, romanization]];
			else
				obj[chars[i]].push([id, romanization]);
		}
		return obj;
	}, {});
}

function createImgWithFigCaption(res) {
	var id = res[0], romanization = res[1];

	var figure = document.createElement('figure');

	var img = document.createElement('img');
	img.src = 'https://nushuscript.org/nsbzzzd/img/' + id + '.png';
	img.alt = romanization;
	figure.appendChild(img);

	var figcaption = document.createElement('figcaption');
	figcaption.innerText = '江永方言拼音：' + romanization;
	figure.appendChild(figcaption);

	return figure;
}

function handleConvert() {
	var ress = dictmap[document.getElementById('inputArea').value];
	if (!ress) {
		document.getElementById('outputArea').innerHTML = '<p class="center">暂无数据。</p>';
	} else {
		document.getElementById('outputArea').innerHTML = '';

		ress.map(function(res) {
			document.getElementById('outputArea').appendChild(createImgWithFigCaption(res));
		});
	}
}
