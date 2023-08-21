<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>testa</title>
        <script type="text/javascript" src="/testa/resources/js/jquery-3.7.0.min.js"></script>
    </head>

    <body>
        <h1>testjQueryAjax page</h1>
        <hr>
        <h2>1. 서버로 전송값 없고, 결과로 문자열 받아 처리하는 방법 : get 방식</h2>
        <p id="p1" style="width: 300px; height: 50px; border: 1px solid red;"></p>
        <button id="test1">test</button>

        <script type="text/javascript">
            $(function () {
                $('#test1').click(function () {
                    //컨트롤러로 서비스 요청하고, 결과로 문자열만 받는 경우에는 
                    //jQuery 에서 2개의 메소드를 제공하고 있음

                    //get 방식으로 요청 할 경우
                    $.get("/teata/test1.do", function (data) {
                        //data 매개변수가 서버츠에서 응답한 값 받는 변수임
                        $('#p1').text(data); //받은 값이 문자열이면 가공없이 바로 사용함
                    });
                    // get(URL컨트롤러[, 데이터] [, 성공][, 데이터형])
                    $.ajax({
                        url: "/testa/test1.do",
                        type: "get",
                        success: function (data) {
                            $('#p1').text($('#p1').text() + ", " + data);
                        }

                    });
                    //jquery.ajax()

                }); //click
            }); //document ready
        </script>
        <hr>
        <h2>2. 서버로 값 보내고, 결과로 문자열 받아 처리하는 방법 : get 방식</h2>
        <p id="p2" style="width: 300px; height: 50px; border: 1px solid red;"></p>
        <button id="test2">test</button>
        <script type="text/javascript">
            $(function () {
                $('#test2').click(function () {
                    // $get() 과 $.ajax()

                    $.get("/testa/test2.do", {
                        userid: 'user01',
                        userpwd: 'pass01'
                    }, function (data) {
                        $("#p2").text(data);
                    });
                    $.ajax({
                        url: "/testa/test2.do",
                        type: "get",
                        data: { userid: 'user02', userpwd: 'pass02' },
                        success: function (data) {
                            $('#p2').text($('#p2').text() + ", " + data);
                        }
                    });
                });
            });
        </script>
        <hr>
        <h2>3. 서버로 값 보내고, 결과 안받는 방법 : post</h2>
        <button id="test3">test</button>
        <script type="text/javascript">
            $(function () {
                $('#test3').click(function () {
                    // $get() 과 $.ajax()

                    $.get("/testa/test3.do", {
                        title: '제목입니다.',
                        writer: 'user77',
                        content: '게시글 내용 문구 입니다.'
                    });

                    $.ajax({
                        url: "/testa/test3.do",
                        type: "post",
                        data: {
                            title: '제목입니다2.',
                            writer: 'user772',
                            content: '게시글 내용 문구 입니다2.'
                        }
                    });
                });
            });
        </script>

        <hr>
        <h2>4. 서버로 값 보내고, 결과로 JSON 받아 처리하는 방법 : get 방식</h2>
        <p id="p4" style="width: 300px; height: 150px; border: 1px solid red;"></p>
        <button id="test4">test</button>
        <script type="text/javascript">
            $(function () {
                $('#test4').click(function () {
                    // $get() 과 $.ajax()

                    $.get("/testa/test4.do", {
                        no: '12'
                    },
                        //전송값 객체는 이름 : '값'으로 표기해야 함
                        function (data) {
                            console.log("test4 : " + typeof (data));
                            console.log(data);
                            //한글 깨짐을 막기 위해 문자 인코딩 처리한 값은 자바스크립트 내장함수인
                            //decodeURIComponent(인코딩된 값) 로 디코딩 처리해야 함

                            $("#p4").text(data.userid + ", " + data.userpwd + ", " +
                                decodeURIComponent(data.username) + ", " + data.age + ", " + data.email + ", " + data.phone);
                        });

                    $.ajax({
                        url: "/testa/test4.do",
                        type: "get",
                        data: { no: '17' },
                        dataType: "json",   //응답값이 문자열("text") 일때는 생략 가능함
                        success: function (data) {
                            console.log("test4 : " + typeof (data));
                            console.log(data);

                            $('#p4').text($('#p4').text() + ", " + data.userid + ", " + data.userpwd + ", " +
                                decodeURIComponent(data.username) + ", " + data.age + ", "
                                + data.email + ", " + data.phone);
                        }
                    });
                });
            });
        </script>
        <hr>
        <h2>5. 서버로 값 보내고, 서버측의 list 나 map 결과를 json 배열로 받아 처리하는 방법 : get 방식</h2>
        <p id="p5" style="width: 300px; height: 200px; border: 1px solid red;"></p>
        <button id="test5">test</button>
        <script type="text/javascript">
            $(function () {
                $('#test5').click(function () {
                    // $get() 과 $.ajax()

                    $.getJSON("/testa/test5.do",
          {no: 'T5'}, //전송값 객체는 이름: '값' 으로 표기해야 함 
          function(data){
             console.log("test5 : " + typeof(data));
             console.log(data); //{"list": Array(5)}
             
             //data를 String으로 바꿈 => 내장된 JSON 객체의 stringify() 메소드 사용함
             var str = JSON.stringify(data);
             console.log(str);
             
             //string을 json 객체로 바꿈
             var json = JSON.parse(str);
             console.log("str -> json : " + json);
                         
             //한글깨짐을 막기 위해 문자 인코딩 처리한 값은 자바스크립트 내장함수인
             //decodeURIComponent()로 디코딩 처리해야 함
             
             for(var i in json.list){
                  $('#p5').html($('#p5').html() + json.list[i].userid + ", " 
                        + json.list[i].userpwd + ", " + 
                     decodeURIComponent(json.list[i].username) + ", " 
                     + json.list[i].age + ", "
                     + json.list[i].email + ", " + json.list[i].phone + "<br>");
               }
          });

          $.ajax({
         url: "/testa/test5.do",
         type: "post",
         data: {no : 't5'},
         dataType: "json",   //응답값이 문자열("text") 일때는 생략 가능함
         success: function(data){
            console.log("test5 : " + typeof(data));
            console.log(data);
            
            //data 를 String 으로 바꿈 => 내장된 JSON 객체의 stringify() 메소드 사용
            var str = JSON.stringify(data);
            console.log(str);
            
            //string 을 json 객체로 바꿈
            var json = JSON.parse(str);
            console.log("str -> json : " + json);
            
            //한글깨짐을 막기 위해 문자 인코딩 처리한 값은 자바스크립트 내장함수인
            //decodeURIComponent(인코딩된 값) 로 디코딩 처리해야 함
            for(var i in json.list){
               $('#p5').html($('#p5').html() + json.list[i].userid + ", " 
                     + json.list[i].userpwd + ", " + 
                  decodeURIComponent(json.list[i].username) + ", " 
                  + json.list[i].age + ", "
                  + json.list[i].email + ", " + json.list[i].phone + "<br>");
            }
         }
      });
                });
            });
        </script>
<h2>6. 서버로 값 보내고, 서버측의 xml파일을로드하여,각 노드의 값들을 출력 처리하는 방법</h2>
<p id="p6" style="width: 300px; height: 600px; border: 1px solid red;"></p>
<button id="test6">test</button>
<script type="text/javascript">
    $(function () {
        $('#test6').click(function () {
            // $get() 과 $.ajax()

            $.get("/testa/resources/xml/members.xml",
                function (data) {
                    $(data).find("member").each(function(){
                        var info = "userid : " + $(this).find("userid").text()
                                + ", username : " + $(this).find("username").text()
                                + ", age : " + $(this).find("age").text()
                                + ", gender : " + $(this).find("gender").text()
                                + ", email : " + $(this).find("email").text()
                                + ", phone : " + $(this).find("phone").text() + "<br/>";
                    $('#p6').append(info);
                    }); //each
                }, "xml");//get

            $.ajax({
                url: "/testa/resources/xml/members.xml",
                // type : "get", //기본이 get임, 생략 가능함
                cache : false, //사용자 캐시를 사용할 것인가 
                dataType: "xml",   //응답값이 문자열("text") 일때는 생략 가능함
                success: function (data) {
                    $(data).find("member").each(function(){
                        var info = "userid : " + $(this).find("userid").text()
                                + ", username : " + $(this).find("username").text()
                                + ", age : " + $(this).find("age").text()
                                + ", gender : " + $(this).find("gender").text()
                                + ", email : " + $(this).find("email").text()
                                + ", phone : " + $(this).find("phone").text() + "<br/>";
                    $('#p6').append(info);
                    }); //each
                }
            });
        });
    });
</script>

    </body>

    </html>