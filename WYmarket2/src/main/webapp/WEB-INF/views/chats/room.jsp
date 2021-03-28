<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
 <link rel="icon" href="<%=application.getContextPath() %>/image/chatf.ico">
    <link rel="shortcut icon" href="<%=application.getContextPath() %>/image/chatf.ico">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<script>
var Chat__roomId = ${param.roomId};
</script>

<script>
//폼이 발송되기 전에 한번씩 실행
//엔터 한번 칠대 마다 실행
function Chat__addMessage(writer,body){
	$.post(
			'./doAddMessage',
			{
				roomId:Chat__roomId,
				writer:writer,
				body:body
			},
			function(data){
				  
			},
			'json'
		);
}

function Chat__drawMessage(chatMessage){
	
	var html = chatMessage.writer + ' : ' + chatMessage.body;
	
	$('.chat-messages').prepend('<div>'+html+'</div>');
}

var Chat__lastLoadedMessageId = 0;

function Chat__loadNewMessages(){
	 $.get(
			 './getMessagesFrom',
			 {
				 roomId : Chat__roomId,
				 from : Chat__lastLoadedMessageId+1,
			 },
			 function(data){
				for(var i=0; i<data.messages.length; i++){
					Chat__drawMessage(data.messages[i]);
					Chat__lastLoadedMessageId = data.messages[i].id;
				}
			 },
			 'json'
	 );
}
setInterval(Chat__loadNewMessages,1000);

function submitChatMessageForm(form){
	form.writer.value = form.writer.value.trim();//공백 제거

	if( form.writer.value.length==0){
		alert('작성자를 입력해주세요');
		form.writer.focus();
		
		return false;
	}
	if( form.body.value.length==0){
		alert('내용을 입력해주세요');
		form.body.focus();
		
		return false;
	}
	
	var writer = form.writer.value;
	var body = form.body.value;
	
	form.body.value='';
	form.body.focus();
	
	Chat__addMessage(writer,body);
}

</script>
<style>
.cen{
	text-align-last: center;
  
}
.style{
    
    justify-content: center;
	
}
.content{ 
    height: 600px;
   
    width: 500px;
    margin-left: auto;
    margin-right: auto;
    margin-bottom:5%;
     
    box-shadow: 1px 1px 10px rgb(180, 178, 178);
    border-radius: 1.0rem;
    padding: 10px 0;
    background-color: rgb(251, 250, 250);
}
.top{
	margin-top: 5%;
	margin-bottom: 20px;
	font-size: 50px;
	color: orange;
}
.gra{
	background-color: gray;
	border: none;
}
.gra:hover{
	background-color: gray;
}
.sub{
background-color: rgba(255, 191, 82, 1);;
	border: none;
	font-size: 10px;
	margin-bottom: 3px;
}
.sub:hover{
background-color: #FF8A3D;
}
</style>
</head>
<body>
	 
<div class="container-md cen style">
	<div class="top">WY Talk  
	<form action="./chatting" method="get"> 
		<input style="display: none" type="text" name="roomId" value="${vo.roomId }" />
		<input style="display: none" type="text" name="buyerName" value="${vo.buyerName}" />
		<input style="display: none" type="text" name="sellerName" value="${vo.sellerName}" />
		<input style="display: none" type="text" name="user" value="${userNick}" /> 
	<button type="submit" class="btn btn-primary gra">
	나가기
	</button>
	</form>
	</div>
    <div class="content"> 
	<b>${vo.item } 상품 (${vo.price}원)</b> <br>
	 
	<div style="margin-left: 60%;">구매자 : ${vo.buyerName }  </div> 
	<div style="margin-left: 60%;">판매자 : ${vo.sellerName }  </div> 
	<br><br>
	
	<form onsubmit="submitChatMessageForm(this); return false;">
		<div>
			<input style="display: none"type="text" name="writer" value="${userNick}" autocomplete="off" readonly/>
		</div>
	 	<div>
			<input type="text" name="body" placeholder="내용" autocomplete="off"/>&nbsp;
            <input class="btn btn-primary sub" type="submit" value="▲"/>
		</div>
		 
			 
		 
	</form>
 <br>
 	<div class="chat-messages" style="overflow:auto;  height: 450px;" ></div>
</div>  
</div>
	 
 
</body>
</html>