<%@page import="firstProject.db.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>����</title>
	
	<script type="text/javascript">
		function addMessage(){
			var name = document.getElementById("name").value;
			var title = $("#title")[0].value;
			var contents = $("#contents")[0].value;
			
			$.ajax({
				url: "guestbook",
				type: "POST",
				data: {"name":name, "title":title, "contents":contents},
				dataType:"text",
				success:function(result){
					if(result != "error"){
						alert("�ۼ� �Ϸ�");	
						window.location.href = 'http://localhost:9090/firstProject/guestbook';
					}else{
						alert("����");
					}
				},
				error:function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		}
		
		function upMessage(){
			var name = document.getElementById("name").value;
			var title = $("#title")[0].value;
			var contents = $("#contents")[0].value;
			
			$.ajax({
				url: "guestbook",
				type: "POST",
				data: {"name":name, "title":title, "contents":contents},
				dataType:"text",
				success:function(result){
					if(result != "error"){
						alert("���� �Ϸ�");	
						window.location.href = 'http://localhost:9090/firstProject/guestbook';
					}else{
						alert("����");
					}
				},
				error:function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		}
		
		function delMessage(){
			$.ajax({
				url: "guestbook",
				type: "POST",
				data: {"name":name, "title":title, "contents":contents},
				dataType:"text",
				success:function(result){
					if(result != "error"){
						alert("���� �Ϸ�");	
						window.location.href = 'http://localhost:9090/firstProject/guestbook';
					}else{
						alert("����");
					}
				},
				error:function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
				}
			});
		}
	
	</script>
	
</head>

<body>

<%
	ArrayList<GuestbookDTO> list = (ArrayList<GuestbookDTO>)request.getAttribute("list");
%>

<div class="container">
	<h2>����</h2>
	<div class="row">
	  	<div class="col-sm-8"><p>ȯ���մϴ�</p></div>
	  	<div class="col-sm-4">
	  		<!-- <button type="button" class="btn btn-info" style="float: right" onclick="addMessage()">�۾���</button> -->
	  		<button type="button" class="btn btn-info btn-sm" 
	  			data-toggle="modal" data-target="#myModal" style="float: right">�۾���</button>
	  	</div>
	</div>	
	
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">���� ����</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	        	<label>�̸�</label>  
				<input type="text" id="name" style="width: 513px"><br>
				<label>����</label>  
				<input type="text" id="title" style="width: 513px"><br>
				<label>����</label>  
				<textarea rows="3" cols="70" id="contents" 
					placeholder="���� �ۼ��ϼ���." style="vertical-align: top; resize: none;"></textarea><br>
			</form>
	      </div>
	      <div class="modal-footer">
	      	<button id="writeBtn" type="button" class="btn btn-success" 
	      		data-dismiss="modal" onclick="addMessage()">�ۼ�</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	
	<table class="table table-striped"> 	
		<thead>
	    	<tr>
	      		<th>No</th>
		        <th>Title</th>
		        <th>Contents</th>
		        <th>date</th>
		        <th>Name</th>
	    	</tr>
	    </thead>
    <tbody>
    
    <%
  		for(int i=0; i<list.size(); i++){
	%>
		<tr>
			<td><%=list.get(i).getNo() %></td>
	        <td><%=list.get(i).getTitle() %></td>
	        <td><%=list.get(i).getContents() %></td>
	        <td><%=list.get(i).getDate() %></td>
	        <td><%=list.get(i).getName() %></td>
	        <td>
	        	<button type="button" class="btn btn-default" data-toggle="modal"
	        		data-target="#myupdate">����</button>
	        	<button type="button" class="btn btn-danger" onclick="delMessage('<%=list.get(i).getNo() %>')">����</button>
	        </td>
		</tr>
	      
		<div id="myupdate" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">���� ����</h4>
					</div>
					<div class="modal-body">
						<form>
							<label>�̸�</label>  
							<input type="text" id="name" style="width: 513px"><br>
							<label>����</label>  
							<input type="text" id="title" style="width: 513px"><br>
							<label>����</label>  
							<textarea rows="3" cols="70" id="contents" 
								placeholder="���� �ۼ��ϼ���." style="vertical-align: top; resize: none;"></textarea><br>
						</form>
					</div>
					<div class="modal-footer">
						<button id="writeBtn" type="button" class="btn btn-success" 
							data-dismiss="modal" onclick="upMessage('<%=list.get(i).getNo() %>')">����</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
				
			</div>
		</div>
    <%
  		}
    %>
	    
    </tbody>
  </table>
</div>

</body>
</html>