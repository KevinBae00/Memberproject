<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.dao.MemberDAO, com.member.bean.MemberVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
.buttons{
	border-radius: 4px;
}
.button1{
	background-color: green;
	color: white;
}
.button2{
	background-color: yellow;
	color: black;
}
.button3{
	background-color: blue;
	color: white;
}
.button4{
	background-color: red;
	color: white;
}
.specify{
	font-weight: bold;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='delete_ok.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>Members</h1>
<%
	MemberDAO memberDAO = new MemberDAO();
	List<MemberVO> list = memberDAO.getList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th class = "specify">NO</th>
	<th class = "specify">User ID</th>
	<th class = "specify">User Name</th>
	<th class = "specify">Email</th>
	<th class = "specify">Registered Date</th>
	<th class = "specify" colspan="3"><button class="buttons button1" type="button" onclick="location.href='addform.jsp'" >Add</button></th>
</tr>
<c:forEach items="${list}" var="u" varStatus="status">
	<tr>
		<td>${fn:length(list)-status.index}</td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getRegdate()}</td>
		<td><button class="buttons button2" type="button"
					onclick="location.href='view.jsp?id=${u.getSid()}'" >View</button>
		<button class="buttons button3" type="button"
					onclick="location.href='editform.jsp?id=${u.getSid()}'" >Edit</button>
		<button class="buttons button4" type="button"
					onclick="javascript:delete_ok('${u.getSid()}')" >Delete</button></td>
	</tr>
</c:forEach>
</table>
</body>
</html>