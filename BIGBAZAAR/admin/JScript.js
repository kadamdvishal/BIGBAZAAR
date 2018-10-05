function clicks(str) {
    element = document.getElementById(str).style;
    element.display == "none" ? element.display = "block" : element.display = "none";
}
function time() {
    var d = new Date();
    var result = "Current Time : ";
    result += d.getHours() + " : ";
    result += d.getMinutes() + " : ";
    result += d.getSeconds();
    window.status = result;
    setTimeout("time()", 1000 );
}