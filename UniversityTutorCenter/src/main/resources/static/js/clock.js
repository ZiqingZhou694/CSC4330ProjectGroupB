function clock(){
    let hour = document.getElementById('hour')
    let min = document.getElementById('min')
    let sec = document.getElementById('sec')
    let ampm = document.getElementById('ampm')

    let h = new Date().getHours();
    let m = new Date().getMinutes();
    let s = new Date().getSeconds();
    var am = 'AM';

    if(h > 12){
        h = h -12;
        var am = 'PM';
    }

    h = (h < 10)? '0' + h : h;
    m = (m < 10)? '0' + m : m;
    s = (s < 10)? '0' + s : s;

    hour.innerHTML = h;
    min.innerHTML = m;
    sec.innerHTML = s;
    ampm.innerHTML = am;
}
var interval = setInterval(clock,1000);