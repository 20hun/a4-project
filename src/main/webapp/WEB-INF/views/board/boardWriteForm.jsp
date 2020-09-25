<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 말풍선 작성 화면 ]</title>

<script type="text/JavaScript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {

        // Geolocation 객체를 사용
        if(navigator.geolocation) {
            
            navigator.geolocation.getCurrentPosition(function(position) {
                
                // 위치를 가져오는데 성공할 경우
                jQuery.each(position.coords, function(key, item) {
                    jQuery("<h3></h3>").html("● " + key + " : " + item).appendTo("body");
                });
            }, function(error) {
                
                // 위치를 가져오는데 실패한 경우
                consol.log(error.message);
                // geolocation 대신 ip-api.com 사용하면 해결된다고 하는데 객체 받아서 그 안에 있는 위도, 경도 값 넣어주면 해결
                // position 객체       json 객체
            });
        } else {
            consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
        }
    });
</script>   

<script type="text/javascript">
        /* document.addEventListener("DOMContentLoaded", function() {
			function getLocation(position) {

		            var latitud = position.coords.latitude;
		            var longitude = position.coords.longitude;

		            alert(latitud);
		            alert(longitude);

		            document.getElementById("lat").value = latitud;
		            document.getElementById("lon").value = longitude;

		            if(navigator.geolocation) {
			            navigator.geolocation.getCurrentPosition(getLocation, function(error) {
			                consol.log(error.message);    
			            });
			        } else {
			            consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
			        }
			}
			}) */
			
			/* function click2(position){
        	var latitud = position.coords.latitude;
            var longitude = position.coords.longitude;
            alert(latitud);
            alert(longitude);

            document.getElementById("lat").value = latitud;
            document.getElementById("lon").value = longitude;
			} */
</script>
</head>
<body>
	<h1>[ 말풍선 작성 ]</h1>
	
	<form action="boardWrite" method="post">
		글 제목 : <input type="text" name="board_title"> <br>
		글 내용  <br>
		<textarea rows="10" cols="40" name="board_content"></textarea><br>
		<input type="text" name="lat" value=${lat }>
        <input type="text" name="lon" value=${lon }>
		<input type="submit" value="글 등록">
	</form>
</body>
</html>