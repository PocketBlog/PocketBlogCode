<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="GBK" import="java.util.*,com.blog.dao.ConstantUtil.*,com.blog.bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<LINK href="global.css" type="text/css" rel="stylesheet"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
function emptyTest()
{
	if(document.searchForm.keyword.value.trim() == "")
		{
			alert("�����������ؼ���");
			return false;
		}
	return true;
}


</script>

<body onload="window.parent.frames['friend'].location.reload()" class="bodyBack">
<%	
	User user = (User)session.getAttribute("user");
	System.out.println(user == null);
	if(user == null){
%>		
		<script type="text/javascript">
		
		window.parent.frames["content"].location.href="welcome.jsp";
		window.parent.frames["write"].location.href="write.jsp";
		
		</script>
		<form action="UserServlet" method="post">
			<table border="0" style="margin-left:30px;">
				<tr>
					<td colspan="2" class="arinfo3" align="center">��¼�ڴ�΢��</td>
				</tr>
				<tr>
					<td>�û���:<input name="u_no" size="15" class="login_input"/></td>
				</tr>
				<tr>
					<td>��&nbsp;&nbsp;��:<input type="password" name="u_pwd" size="15" class="login_input"/></td>
				</tr>
				<tr>
					<td><input class="btn" type="submit" value="��¼"/><a href="register.jsp" style="margin-left:100px"target="content">ע��</a></td>
				</tr>
			</table>
			<input type="hidden" name="action" value="login" />
		</form>
<%
		String result = (String)request.getAttribute("loginResult");
		if(result != null){
%>
			<font color="#ff0000" size="2.8"><%=result %></font>
<%
		}
	}
	else{				//��ʾ��¼�ɹ���Ϣ
		
%>
	
	<form action="UserServlet">
	<DIV id=nav class="arinfo">
		<table border="0">
			<tr>
				<td rowspan="2"><img src="head.jsp?hid=<%=user.h_id %>" width="60" height="75" /></td>
				<td><b><%= user.u_name %></b></td>
			</tr>
			<tr bgcolor="#99ccff">
				<td align="right" colspan="2">
					<a href="UserServlet?action=modify" target="content"><b>�޸�����</b></a>
					<a href="UserServlet?action=logout"><b>ע��</b></a>
				</td>
			</tr>
			<tr>
				<td colspan="2"><i><b>���飺</b></i><%=user.u_state %></td>
			</tr>
			<tr>
				<td>
				
				
				</td>
			</tr>
		</table>
		</DIV>
	</form>
	<br/>
	<form action="FriendServlet" target="content" method="post" name="searchForm">
		<input type="text" name="keyword" size="12" class="f2_input"/>
		<input class="btn" type="submit" value="��������" onclick="return emptyTest()"/>
		<input type="hidden" name="action" value="searchFriend" />
	</form>
	
	<script type="text/javascript">
		//window.parent.frames.item('friend').location.reload();
	</script>

<%
	}
%>

</body>
</html>