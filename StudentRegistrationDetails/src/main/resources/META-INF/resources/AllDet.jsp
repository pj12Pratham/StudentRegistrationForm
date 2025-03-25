<%@page import="com.ty.liferay.model.Student"%>
<%@ include file="./init.jsp" %>

<portlet:actionURL name="/studentDetails" var="alldetails"/>

<portlet:renderURL var="backtoView">
	<portlet:param name="mvcRenderCommandName" value="/editStudentData"/>
	<portlet:param name="name" value="${stdName}"/>
	<portlet:param name="age" value="${age}"/>
	<portlet:param name="dob" value="${dob}"/>
	<portlet:param name="gender" value="${gender}"/>
	<portlet:param name="phone" value="${phone}"/>
	<portlet:param name="email" value="${email}"/>
	<portlet:param name="address" value="${address}"/>
	<portlet:param name="state" value="${state}"/>
	<portlet:param name="city" value="${city}"/>
	<portlet:param name="zip" value="${zip}"/>
</portlet:renderURL>
<%
	String gender = renderRequest.getParameter("gender");
	String state = renderRequest.getParameter("state");
%>

<h1 align="center">Student Registration Form</h1>

<section id="mainSection">
<!-- 	<h3>Personal Information</h3>
 -->	
 	<form action="${alldetails}" method="post">
 		<div>
 			<h2>Educational Details</h2>
 		</div>
 		<div style="display: none;">
	 		<div class="fieldArrange">
				<label for="stdId">Student ID</label>
				<input type="number" id="stdId" name="<portlet:namespace/>stdId" readonly="readonly"/>
			</div>
 			<div class="fieldArrange">
				<label for="name">Student Name</label>
				<input type="text" id="name" name="<portlet:namespace/>sname" value="${stdName}"/>
			</div>
			<div class="divArrange">
				<div class="fieldArrange">
					<label for="age">Age</label>
					<input type="number" id="age" name="<portlet:namespace/>age" value="${age}"/>
				</div>
				
				<div class="fieldArrange">
					<label for="dob">Date of Birth</label>
					<input type="date" id="dob" name="<portlet:namespace/>dob" value="${dob}"/>
				</div>
				<div class="fieldArrange">
					<label>Gender</label>
					<div style="display: flex; gap:1px;">
						<input type="radio" id="male" value="male" <%= "male".equals(gender) ? "checked" : "" %> name="<portlet:namespace/>gender"/>
						<label for="male">Male</label>
						<input type="radio" id="female" value="female" <%= "female".equals(gender) ? "checked" : "" %> name="<portlet:namespace/>gender"/>
						<label for="female">Female</label>
						<input type="radio" id="other" value="other" <%= "other".equals(gender) ? "checked" : "" %> name="<portlet:namespace/>gender"/>
						<label for="other">Others</label>
					</div>
				</div>
			</div>
			<div class="divArrange">
				<div class="fieldArrange">
					<label for="phone">Mobile No.</label>
					<input type="number" id="phone" name="<portlet:namespace/>phone" value="${phone}"/>
				</div>
				<div class="fieldArrange">
					<label for="email">Email</label>
					<input type="email" id="email" name="<portlet:namespace/>email" value="${email}"/>
				</div>			
			</div>
			<div class="fieldArrange">
				<label for="addr">Address</label>
				<input type="text" id="addr" name="<portlet:namespace/>addr" value="${address}"/>
			</div>
			<div class="divArrange">
				<div class="fieldArrange">
					<label for="state">State</label>
					<select name="<portlet:namespace/>state" id="state">
					  <option value="">Choose an option</option>
			  		  <option value="Gujarat" <%= "Gujarat".equals(state) ? "selected" : "" %>>Gujarat</option>	
					  <option value="Karnataka" <%= "Karnataka".equals(state) ? "selected" : "" %>>Karnataka</option>
					  <option value="Madhya Pradesh" <%= "Madhya Pradesh".equals(state) ? "selected" : "" %>>Madhya Pradesh</option>
					  <option value="Maharashtra" <%= "Maharashtra".equals(state) ? "selected" : "" %>>Maharashtra</option>
					</select>
				</div>		
				<div class="fieldArrange">
					<label for="city">City</label>
					<select name="<portlet:namespace/>city" id="city">
						<option value="${city}"></option>
					</select>
				</div>
				
				<div class="fieldArrange">
				<label for="zipcode">ZIP Code</label>
				<input type="number" id="zipcode" name="<portlet:namespace/>zipcode" value="${zip}"/>
				</div>
			</div>
		</div>
		<div>
			<div class="fieldArrange">
				<label for="x_school">X<sup>th</sup> School</label>
				<input type="text" id="x_school" name="<portlet:namespace/>x_school"/>
			</div>
			<div class="commonDisplay">
				<div class="fieldArrange">
					<label for="x_perc">Percentage</label>	
					<input type="number" id="x_perc" value="0" name="<portlet:namespace/>x_perc"/>
				</div>	
				<div class="fieldArrange">	
					<label for="x_yop">Year of Passing</label>	
					<input type="number" id="x_yop" value="0" name="<portlet:namespace/>x_yop"/>				
				</div>
			</div>
		</div>
		<div>
			<div class="fieldArrange">
				<label for="xii_school">XII<sup>th</sup> School</label>
				<input type="text" id="xii_school" name="<portlet:namespace/>xii_school"/>
			</div>
			<div class="commonDisplay">
				<div class="fieldArrange">
					<label for="xii_perc">Percentage</label>	
					<input type="number" id="xii_perc" value="0" name="<portlet:namespace/>xii_perc"/>
				</div>
				<div class="fieldArrange">
					<label for="xii_yop">Year of Passing</label>	
					<input type="number" id="xii_yop" value="0" name="<portlet:namespace/>xii_yop"/>				
				</div>
			</div>
		</div>
		<div>
			<div class="fieldArrange">
				<label for="college">College</label>
				<input type="text" id="college" name="<portlet:namespace/>college"/>
			</div>
			<div class="fieldArrange">
				<label for="degree">Course</label>
				<input type="text" id="degree" name="<portlet:namespace/>degree"/>
			</div>
			<div class="commonDisplay">
				<div class="fieldArrange">
					<label for="deg_perc">Percentage</label>	
					<input type="number" id="deg_perc" value="0" name="<portlet:namespace/>deg_perc"/>
				</div>
				
				<div class="fieldArrange">
					<label for="deg_yop">Year of Passing</label>	
					<input type="number" id="deg_yop" value="0" name="<portlet:namespace/>deg_yop"/>				
				</div>
			</div>
		</div>		
		<div class="commonDisplay" style="margin-top: 3px;">
			
			<a href="${backtoView}"> 
				<button type="button" class="btn btn-primary" id="backBtn" >Back</button> 
			</a>
			<button type="submit" class="btn btn-primary" id="submitBtn" >Submit</button> 
		</div>
	</form>
</section>




<style>
	#mainSection{
		/* height: ;
		width: ; */
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: #FDDAA6;
		padding: 0px 10px;
	}
	form{	
		border-radius: 10px;
		height:70vh;
		width:40vw;
		padding: 10px 15px;
		background-color: #F5C47C;
		display:flex;
		flex-direction: column;
		justify-content: space-around;
	}
	.divArrange{
		display: flex;
		justify-content: space-between;
	}
	.fieldArrange{
		display: flex;
		flex-direction: column;
	}
	#nextBtn{
		height: 36px;
		width: 120px;
		float: right;	
	}
	
	.commonDisplay{
		display: flex;
		align-items: center;
		justify-content: space-between;		
	}
</style>

<script>
	<%
		Object studentObj = renderRequest.getAttribute("student");
		if(studentObj != null && studentObj instanceof Student){
			Student student = (Student) studentObj;
			long stdId = student.getStdId();
			String x_school = student.getX_school();
			int x_perc = student.getX_percentage();
			int x_yop = student.getX_yop();
			String xii_school = student.getXii_school();
			int xii_perc = student.getXii_percentage();
			int xii_yop = student.getXii_yop();
			String college = student.getCollege();	
			String degree = student.getDegree();
			int deg_perc = student.getDegree_percentage();
			int degree_yop = student.getDegree_yop();
	%>
	
		<% if (stdId == 0 ) { %>
		console.log("are khali Id aa gyi");
		<% } else { %>
		console.log("are Id me kuch toh h....");
		$('#stdId').prop('value', "<%= stdId %>"
		);
		<%}%>
	
		<% if (x_school == null ) { %>
		console.log("are x_school blank aa gya");
		<% } else { %>
		console.log("are x_school me kuch toh h....");
		$('#x_school').prop('value', "<%= x_school %>"
		);
		<%}%>
		
		<% if (x_perc == 0 ) { %>
		console.log("are x_perc blank aa gya");
		<% } else { %>
		console.log("are x_perc me kuch toh h....");
		$('#x_perc').prop('value', "<%= x_perc %>"
		);
		<%}%>
		
		<% if (x_yop == 0 ) { %>
		console.log("are x_yop blank aa gya");
		<% } else { %>
		console.log("are x_yop me kuch toh h....");
		$('#x_yop').prop('value', "<%= x_yop %>"
		);
		<%}%>
			
		<% if (xii_school == null ) { %>
		console.log("are xii_school blank aa gya");
		<% } else { %>
		console.log("are xii_school me kuch toh h....");
		$('#xii_school').prop('value', "<%= xii_school %>"
		);
		<%}%>
		
		<% if (xii_perc == 0 ) { %>
		console.log("are xii_perc blank aa gya");
		<% } else { %>
		console.log("are xii_perc me kuch toh h....");
		$('#xii_perc').prop('value', "<%= xii_perc %>"
		);
		<%}%>
		
		<% if (xii_yop == 0 ) { %>
		console.log("are xii_yop blank aa gya");
		<% } else { %>
		console.log("are xii_yop me kuch toh h....");
		$('#xii_yop').prop('value', "<%= xii_yop %>"
		);
		<%}%>
		
		<% if (college == null ) { %>
		console.log("are college blank aa gya");
		<% } else { %>
		console.log("are college me kuch toh h....");
		$('#college').prop('value', "<%= college %>"
		);
		<%}%>
		
		<% if (degree == null ) { %>
		console.log("are degree blank aa gya");
		<% } else { %>
		console.log("are degree me kuch toh h....");
		$('#degree').prop('value', "<%= degree %>"
		);
		<%}%>
		
		<% if (deg_perc == 0 ) { %>
		console.log("are deg_perc blank aa gya");
		<% } else { %>
		console.log("are deg_perc me kuch toh h....");
		$('#deg_perc').prop('value', "<%= deg_perc %>"
		);
		<%}%>
		
		<% if (degree_yop == 0 ) { %>
		console.log("are deg_yop blank aa gya");
		<% } else { %>
		console.log("are deg_yop me kuch toh h....");
		$('#deg_yop').prop('value', "<%= degree_yop %>"
		);
		<%}%>
		
	<% } %>	
</script>
