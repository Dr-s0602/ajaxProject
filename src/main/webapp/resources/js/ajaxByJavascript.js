/*
    resources/js/ajaxByJavascript.js
    자바스크립트를 사용한 ajax 테스트용 기능 제공 파일

*/
// 브라우저에서 XMLHttpRequest 객체 지원 여부 확인
function checkNativeBrowser(){
    if(window.XMLHttpRequest){
        //firefox, opera, IE7, chrome, sapari 브라우저 지원함
        alert("XMLHttpRequest 지원함")
    }else{
        // IE 5,6 은 ActiveX control 을 지원함
        alert("XMLHttpRequest 지원 안 함, ActiveXObject 지원함");
    }
};

function createXHRequest(){
    var xhRequest;
        if(window.XMLHttpRequest){
            xhRequest = new XMLHttpRequest();
        }else{
            xhRequest = new ActiveXObject("Microsoft.XMLHTTP");
        }
    return xhRequest;
}