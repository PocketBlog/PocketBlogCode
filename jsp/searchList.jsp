<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="GBK" import="com.blog.dao.*,com.blog.bean.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script type="text/javascript">
function showResult(result)
{
	
}

</script>
<body>
	<%
	User user = (User)session.getAttribute("user");		//��ȡsession������
	String me = user.u_no;
	FriendControl controler = new FriendControl();
	String mFResult = (String)request.getAttribute("A");
	if(mFResult != null && !mFResult.equals("-1"))  //��Ӻ��ѳɹ�
		{%>
		
		<script type="text/javascript">
		
		//alert("��Ӻ��ѳɹ�!");
		parent.friend.location.reload();
		
		</script>
			
	<%}

ArrayList<User> friendList = (ArrayList<User>)session.getAttribute("friendList");
if(friendList == null){		  //û���������������
				
	%>
			<h3>�Բ����Ҳ�����صĺ���</h3>
	<%
			}
		
		
		
			else{		//���������Ϊ��
				for(User u:friendList){		//�����������
	%>
			<table>
				<tr>
					<td rowspan="3">
						
						<img alt="<%=u.u_name %>" src="head.jsp?hid=<%=u.h_id %>" width="52" height="52">
						
					</td>
					<td><%=u.u_name %></td>
					
					
				</tr>
				<tr>
					<td width="450px"><%=u.u_email %></td>
					<td>
					<%
					if(!controler.isMyFriend(user.u_no,u.u_no))
					{%>
					
					<a href="FriendServlet?action=makeFriend&my_id=<%=me%>&stranger_id=<%=u.u_no %>">��Ӻ���</a><img src="img/add.png" width="35" height="35"/>
						
					<% 
					
					}
					
					else{%>
						
						[�����ҵĺ���]
					<%}
					%>
					
					</td>
				</tr>
				<tr>
					<td><%=u.u_state %></td>
				</tr>
				</table><hr/>
				
	<%
				}
		}
	%>
</body>
</html>