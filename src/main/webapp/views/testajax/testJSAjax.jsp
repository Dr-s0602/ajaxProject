<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>testa</title>
    <script type="text/javascript" src="/testa/resources/js/ajaxByJavascript.js"></script>
    <script type="text/javascript">
        // 자바 스크립트에서 태그의 이벤트 설정과 작동 처리를 한다면 
        // window.onload 이벤트 안에 태그의 이벤트 설정을 해야 함
        window.onload = function(){
            document.getElementById("test1").onclick = function(){
                checkNativeBrowser();
            };
            document.getElementById("test2").onclick = function(){
                console.log("리턴 정보 : " + typeof(createXHRequest()));
            }
            document.getElementById("test3").onclick = function(){
                //alert("server return : " + testGetRequest());
                console.log("server return : " + testGetRequest());
            }
            document.getElementById("test4").onclick = function(){
                testPOSTRequest();
            }
            document.getElementById("test5").onclick = function(){
                document.getElementById("p5").innerHTML = loadFromXML();
            }
        };

    </script>
</head>
<body>
    <h1>testJSAjax page</h1>
    <hr>
    <h2>1. 브라우저의 XMLHttpRequest 지원 여부 확인</h2>
    <button id="test1" >XMLHttpRequest</button><br>

    <hr>
    <h2>2. XMLHttpRequest 객체 생성 확인</h2>
    <button id="test2">XMLHttpRequest 객체 생성 확인</button><br>

    <hr>
    <h2>3. 서버로 값을 보내고, 결과를 문자열로 받는 방식 : GET 방식</h2>
    <button id="test3">GET 방식으로 서버로 값 보내고 문자열 받기</button><br>
    <input type="text" name="username" id="username"><br>

    <hr>
    <h2>4. 서버로 값들을 전송하고, 결과를 안 받는 경우 : POST 방식 </h2>
    <button id="test4">테스트</button>

    <hr>
    <h2>5. XML 파일을 서버로 부터 로드하여, 각 노드의 값들을 출력 처리하는 방법</h2>
    <p id="p5" style="width: 500px;height: 250px;border: 1px solid red;"></p>
    <button id="test5">읽어온 xml 값 출력하기</button>
</body>
</html>