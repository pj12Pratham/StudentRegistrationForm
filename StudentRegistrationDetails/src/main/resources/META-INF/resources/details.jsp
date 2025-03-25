<%@page import="com.ty.liferay.model.Student"%>
<%@page import="java.util.List"%>
<%@ include file="./init.jsp" %>
 
 <portlet:resourceURL id="/deleteStudent" var="delStudent" />
 <%-- <portlet:actionURL name="/editStudent" var="updateDetails"/> --%>
 
<portlet:renderURL var="editDetails">
	<portlet:param name="mvcRenderCommandName" value="/editStudentData"/>
</portlet:renderURL>

<portlet:renderURL var="registration">
	<portlet:param name="mvcRenderCommandName" value="/viewPage"/>
</portlet:renderURL>

 <h1 style="text-align:center;">Student Details</h1>
 <div align="right">
	<a href="${registration}">
		<button class="btn btn-info">Registration</button>
	</a>
</div>

<% List<Student> Students = (List<Student>)renderRequest.getAttribute("studentList"); %>

<table class="table table-dark table-striped" border="1px solid" >
	<thead>
		<tr align="center">
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Date of Birth</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<th>City</th>
			<th>State</th>
			<th>ZIP Code</th>
			<th>X<sup>th</sup> School</th>
			<th>X<sup>th</sup> Percentage</th>
			<th>X<sup>th</sup> Year of Passing</th>
			<th>XII<sup>th</sup> School</th>
			<th>XII<sup>th</sup> Percentage</th>
			<th>XII<sup>th</sup> Year of Passing</th>
			<th>College</th>
			<th>Degree</th>
			<th>Percentage/CGPA</th>
			<th>Year of Passing</th>
			<th colspan="2">Action</th>
		</tr>
	</thead>
	<tbody class="dark">
	<% for(Student student : Students){ %>
		<tr style="text-align:center;" student_id = "<%= student.getStdId()%>">
			<td><%= student.getStdId() %></td>
			<td><%= student.getStdName() %></td>
			<td><%= student.getAge() %></td>
			<td><%= student.getGender() %></td>
			<td><%= student.getDob() %></td>
			<td><%= student.getStdEmail() %></td>
			<td><%= student.getMobileNo() %></td>
			<td><%= student.getAddress() %></td>
			<td><%= student.getCity() %></td>
			<td><%= student.getState() %></td>
			<td><%= student.getPincode() %></td>
			<td><%= student.getX_school() %></td>
			<td><%= student.getX_percentage() %></td>
			<td><%= student.getX_yop() %></td>
			<td><%= student.getXii_school() %></td>
			<td><%= student.getXii_percentage() %></td>
			<td><%= student.getXii_yop()%></td>
			<td><%= student.getCollege() %></td>
 			<td><%= student.getDegree_percentage() %></td>
 			<td><%= student.getDegree() %></td>
			<td><%= student.getDegree_yop() %></td>
		 	<td> 
				<a href="${editDetails}&<portlet:namespace/>id=<%= student.getStdId()%>">
					<button class="btn btn-primary" type="submit">Edit</button>
				</a> 
			</td>
			
			<td> <button class="btn btn-danger" onclick="removeStudent(<%= student.getStdId()%>)">Delete</button> </td>
		</tr>
	<%} %>	
	</tbody>
</table>

<script type="text/javascript">
console.log("Inside All Details of student Jsp Page");

function removeStudent(id){
	console.log("Inside remove Student function....");
	console.log("Id to be deleted is: ", id);
	$.ajax({
		url: '${delStudent}',
		type: 'post',
		data:{
			<portlet:namespace/>stdId: id
		},	
		success: function(result){
			var row = document.querySelector('tr[student_id="'+ id +'"]');
			if(row){
				row.remove();
			} 
		} 
	});	
}
</script>