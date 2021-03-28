<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
   <link rel="shortcut icon" href="#">
 
<meta charset="UTF-8">
	<title>Room</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: black;
			border-left: 3px solid #black;
			margin-bottom: 20px;
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.roomList{
			border: none;
		}
		.roomList th{
			border: 1px solid #black;
			background-color: #fff;
			color: #black;
		}
		.roomList td{
			border: 1px solid #black;
			background-color: #fff;
			text-align: left;
			color: #black;
		}
		.roomList .num{
			width: 75px;
			text-align: center;
		}
		.roomList .room{
			width: 350px;
		}
		.roomList .go{
			width: 71px;
			text-align: center;
		}
		button{
			background-color: #black;
			font-size: 14px;
			color: black;
			border: 1px solid #black;
			border-radius: 5px;
			padding: 3px;
			margin: 3px;
		}
		.inputTable th{
			padding: 5px;
		}
		.inputTable input{
			width: 330px;
			height: 25px;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;
	window.onload = function(){
		createRoom();
		getRoom();
		 
	}

	function getRoom(){
		$.ajax({
			url: "/wymarket/getRoom",
			data: "",
			type: "POST",
			dataType:"json",
			success: function (data) {
				createChatingRoom(data);
			},
			error : function(err){
				console.log('error');
				 
			}
		});
		 
	}
	
	function createRoom(){
	 
		$('#createRoom').click(function(){
			var msg = {	roomName : $('#roomName').val()	}; 
	 
			$.ajax({
				data: msg,
				url: "/wymarket/createRoom", 
				type: "POST",
				dataType:"json",
				success: function (res) { 
					createChatingRoom(res);
				},
				error : function(err){
					console.log('error');
					 
				}
			});
		});

			 
			 
		
	}

	function goRoom(number, name){
		location.href="/wymarket/moveChating?roomName="+name+"&"+"roomNumber="+number;
	}

	function createChatingRoom(res){
	   
		if(res != null){
			var tag = "<tr><th class='num'>방 번호</th><th class='room'>이름</th><th class='go'> </th></tr>";
			Array.from(res).forEach(function(element, idx){ 
				var rName = element.roomName;
				var rNumber = element.roomNumber;
				console.log("방 이름: "+rName);
				tag += "<tr>"+
							"<td class='num'>"+(idx+1)+"</td>"+
							"<td class='room'>"+ rName +"</td>"+
							"<td class='go'><button type='button' onclick='goRoom(\""+rNumber+"\", \""+rName+"\")'>참여</button></td>" +
						"</tr>";	
			});
		 
			
			$("#roomList").empty().append(tag);
		}
	
	}

	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
				console.log("calbak"+res);
				console.log("calbak"+JSON.stringify(res));
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
</script>
<body>
	<div class="container">
		<h1>WY Chatting Room</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>방 이름</th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">방 생성</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>