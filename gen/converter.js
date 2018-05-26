var nushupics=
{
    0: document.getElementById("nushu0"),
    1: document.getElementById("nushu1"),
    2: document.getElementById("nushu2"),
    3: document.getElementById("nushu3"),
    4: document.getElementById("nushu4"),
    5: document.getElementById("nushu5"),
    6: document.getElementById("nushu6")
}

function domapping()
{
    var ch = document.getElementById("hanzi").value;
    var ret = mappingnushu[ch];
    var i = 0;
    if(ret)
    {
        var nu = ret.split("|");
        while(i<7)
        {
            if(nu[i])
            {
                nushupics[i].src="glyph/"+nu[i]+".jpg";
                nushupics[i].width=134;
                nushupics[i].height=416;
            }
            else
            {
                nushupics[i].src="";
                nushupics[i].width=0;
                nushupics[i].height=0;
            }
            i++;
        }
    }
    else while(i<7)
    {
        nushupics[i].src="";
        nushupics[i].width=0;
        nushupics[i].height=0;
        i++;
    }
    var retchar=mappingnushuchar[ch];
    document.getElementById("nushuchar").value=retchar?retchar:"";
}

function checkEnter(e){
    var et = e || window.event;
    var keycode = et.charCode || et.keyCode;
    if(keycode == 13)
    {
        if(window.event)
        {
            window.event.returnValue=false;
            domapping();
        }
        else
            e.preventDefault();  //For Firefox
    }
}
