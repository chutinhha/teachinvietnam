
function extractPageName(hrefString) {
    var arr = hrefString.split('/');
    return (arr.length < 2) ? hrefString : arr[arr.length - 2].toLowerCase() + arr[arr.length - 1].toLowerCase();
}

function setActiveMenu(arr, crtPage) {
    for (var i = 0; i < arr.length; i++) {
        //if (extractPageName(arr[i].href) == crtPage || extractPageName(arr[i].href).indexOf("intership.aspx")>0) {
        if (extractPageName(arr[i].href) == crtPage) {
            if (arr[i].parentNode.tagName != "DIV") {
                arr[i].className = "selected";
                arr[i].parentNode.className = "selected";
            }
        }
    }
}

function setPage() {
    var hrefString = document.location.href ? document.location.href : document.location;
    if (document.getElementById("nav") != null) {
        setActiveMenu(document.getElementById("nav").getElementsByTagName("a"), extractPageName(hrefString));
    }
}