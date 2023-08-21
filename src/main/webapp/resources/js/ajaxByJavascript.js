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
    //let responseValue; // 서버로 부터 응답온 값 보관용
    if(window.XMLHttpRequest){
        xhRequest = new XMLHttpRequest();
    }else{
        xhRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhRequest.open("POST","/testa/test3.do",true);
    xhRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhRequest.send("title=제목입니다&writer=user007&content=게시글 내용 문구입니다.");

}
function loadFromXML(){
    let xhRequest;
    let values = "";
    if(window.XMLHttpRequest){
        xhRequest = new XMLHttpRequest();
    }else{
        xhRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xhRequest.open("GET","/testa/resources/xml/members.xml",true);
    

    //응답 처리 추가
    xhRequest.onreadystatechange = function(){
        if(xhRequest.readyState == 4){
            if(xhRequest.status == 200){
                var xmlDoc = xhRequest.respaonseXML;
                 // 서버로 부터 읽은 XML 값을 변수에 저장
                var member = xmlDoc.getElementsByTagName("member");
                //xml 파일안의 member 엘리먼트 3개가 배열로 저장
                //member 엘리먼트 안의 child element 들 추출
                var userid = xmlDoc.getElementsByTagName("userid");
                //userid 3개 추출
                var username = xmlDoc.getElementsByTagName("username");
                //username 3개 추출
                var age = xmlDoc.getElementsByTagName("age");
                //age 3개 추출
                var gender = xmlDoc.getElementsByTagName("gender");
                //gender 3개 추출
                var email = xmlDoc.getElementsByTagName("email");
                //email 3개 추출
                var phone = xmlDoc.getElementsByTagName("phone");
                //phone 3개 추출
                
                //for(var index = 0; index < member.length; index++){
                for(var index in member){
                    valuses += "userid : " + userid[index].firstChild.nodeValue;
                    valuses += ", username : " + username[index].firstChild.nodeValue;
                    valuses += ", age : " + age[index].firstChild.nodeValue;
                    valuses += ", gender : " + gender[index].firstChild.nodeValue;
                    valuses += ", email : " + email[index].firstChild.nodeValue;
                    valuses += ", phone : " + phone[index].firstChild.nodeValue + "<br/>";
                }

            }else{
                alert("요청 오류 : " + xhRequest.status);
            }
        }   // outter if
    }; // onreadystatechange

    xhRequest.send(null); //get 방식이라 null
    console.log(values);
    return values;

}