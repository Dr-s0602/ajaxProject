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
    let xhRequest;
    if(window.XMLHttpRequest){
        xhRequest = new XMLHttpRequest();
    }else{
        xhRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xhRequest;
}

function testGetRequest(){
    let xhRequest;
    let responseValue; // 서버로 부터 응답온 값 보관용
    if(window.XMLHttpRequest){
        xhRequest = new XMLHttpRequest();
    }else{
        xhRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhRequest.open("GET","/testa/test2.do?userid=user007&userpwd=pass007",true);
    xhRequest.send(null);

    //응답 처리 추가
    xhRequest.onreadystatechange = function(){
        if(xhRequest.readyState == 4){
            if(xhRequest.status == 200){
                responseValue = xhRequest.responseText;
                alert("server return : " + responseValue);
                document.getElementById("username").value = responseValue
            }else{
                alert("요청 오류 : " + xhRequest.status);
            }
        }
    };
    //return responseValue;
}

function testPOSTRequest(){
    let xhRequest;
    let responseValue; // 서버로 부터 응답온 값 보관용
    if(window.XMLHttpRequest){
        xhRequest = new XMLHttpRequest();
    }else{
        xhRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhRequest.open("POST","/testa/test3.do",true);
    xhRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhRequest.send("title=제목입니다&writer=user007&content=게시글 내용 문구입니다.");

}