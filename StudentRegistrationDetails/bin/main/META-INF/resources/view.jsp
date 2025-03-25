<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.ty.liferay.model.Student"%>
<%@ include file="./init.jsp" %>

<p>
	<b><liferay-ui:message key="studentregistrationdetails.caption"/></b>
</p>

<portlet:resourceURL id="/getCity" var="getCityValues"/>

<portlet:renderURL var="passValue">
	<portlet:param name="mvcRenderCommandName" value="/passingData"/>
</portlet:renderURL>

<portlet:renderURL var="showData">
	<portlet:param name="mvcRenderCommandName" value="/showDetails"/>
</portlet:renderURL> 

<h1 align="center">Student Registration Form</h1>
<div align="right">
	<%-- <form action="${showStudent}" onsubmit="renderFormSubmit()">
		<button class="btn btn-secondary" type="submit">View Students</button>
	</form> --%>
	
	<a href="${showData}">	
		<button class="btn btn-success">View Students</button>
	</a>
</div>	
<br>
<section id="mainSection">
<!-- 	<h3>Personal Information</h3>
 -->	
 	<form id="fieldForm" action="${passValue}" method="post">
 		<div>
 			<h2>Personal Information</h2>
 		</div>
 		<div id="display_Id" class="fieldArrange" style="display: none;">
			<label for="stdId">Student ID</label>
			<input type="number" id="stdId" name="<portlet:namespace/>stdId" readonly="readonly"/>
		</div>
		<div class="fieldArrange">
			<label for="name">Student Name</label>
			<input type="text" id="name" name="<portlet:namespace/>sname"/>
		</div>
		<div class="divArrange">
			<div class="fieldArrange">
				<label for="age">Age</label>
				<input type="number" id="age" value="0" name="<portlet:namespace/>age"/>
			</div>
			
			<div class="fieldArrange">
				<label for="dob">Date of Birth</label>
				<input type="date" id="dob" name="<portlet:namespace/>dob"/>
			</div>
			<div class="fieldArrange">
				<label>Gender</label>
				<div style="display: flex; gap:1px;">
					<input type="radio" id="male" value="male" name="<portlet:namespace/>gender"/>
					<label for="male">Male</label>
					<input type="radio" id="female" value="female" name="<portlet:namespace/>gender"/>
					<label for="female">Female</label>
					<input type="radio" id="other" value="other" name="<portlet:namespace/>gender"/>
					<label for="other">Others</label>
				</div>
			</div>
		</div>
		<div class="divArrange">
			<div class="fieldArrange">
				<label for="phone">Mobile No.</label>
				<input type="number" id="phone" value="0" name="<portlet:namespace/>phone"/>
			</div>
			<div class="fieldArrange">
				<label for="email">Email</label>
				<input type="email" id="email" name="<portlet:namespace/>email"/>
			</div>			
		</div>
		<div class="fieldArrange">
			<label for="addr">Address</label>
			<input type="text" id="addr" name="<portlet:namespace/>addr"/>
		</div>
		<div class="divArrange">
			<div class="fieldArrange">
				<label for="state">State</label>
				<select name="<portlet:namespace/>state" id="state" onchange="selectState()">
				  <option value="">Choose an option</option>
				  <option value="Gujarat">Gujarat</option>
				  <option value="Karnataka">Karnataka</option>
				  <option value="Madhya Pradesh">Madhya Pradesh</option>
				  <option value="Maharashtra">Maharashtra</option>
				</select>
			</div>		
			<div class="fieldArrange">
				<label for="city">City</label>
				<select name="<portlet:namespace/>city" id="city"></select>
			</div>
			
			<div class="fieldArrange">
			<label for="zipcode">ZIP Code</label>
			<input type="number" id="zipcode" value="0" name="<portlet:namespace/>zipcode"/>
			</div>
		</div>
		<div class="fieldArrange">
			<button type="submit" class="btn btn-primary" id="nextBtn" >Next</button> 
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
	#fieldForm{	
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
		width: 100px;
		float: right;	
	}
</style>

 
<%
	/* 
	Object studentObj =	renderRequest.getAttribute("student");		
	
 	if(studentObj != null && studentObj instanceof Student)
 	{ 		
		Student student = (Student) studentObj;
		String name = student.getStdName();
		int age = student.getAge();
		Date dob = student.getDob();
		String gender = student.getGender();
		long phone = student.getMobileNo();
		String email = student.getStdEmail();
		String address = student.getAddress();
		String state = student.getState();
		String city = student.getCity();
		int zip = student.getPincode();
 	}
 */
%>
 
 <script>

function selectState(){	
	$.ajax({
		url: '${getCityValues}',
		type: 'post',
		data:{
			<portlet:namespace/>state: $("#state").val()
		},
		success: function(result){
				console.log(result);
				
			 	$("#city").empty();
				
				for(let city of result.cityList){					
					/* console.log(city); */
					addOption(city, city);
				}
			}
	});
}

function addOption(key, value){
	var option = document.createElement("option");
	option.value  = value;
	option.text = key;
	document.getElementById("city").add(option);
}

function renderFormSubmit(){
	console.log("form toh submit hora h, issue khi or h.....")
}


	<% 
	Object studentObj =	renderRequest.getAttribute("student");			
	if(studentObj != null && studentObj instanceof Student)
	{ 		
		Student student = (Student) studentObj;
		long sid = student.getStdId();
		String name = student.getStdName();
		int age = student.getAge();		
		Date dob = student.getDob();
	%>
		var test = new Date("<%= dob %>"
				);
		var dobDate = (test.getDate()+1) + "-" + ( test.getMonth()+1) + "-" + test.getFullYear();
		console.log("Formatted date by javascript is:  ", dobDate);
	<%	
		String gender = student.getGender();
		long phone = student.getMobileNo();
		String email = student.getStdEmail();
		String address = student.getAddress();
		String state = student.getState();
		String city = student.getCity();
		int zip = student.getPincode(); 
	%>

		
		<% if (sid == 0 ) { %>
		console.log("are khali Id aa gyi");
		<% } else { %>
		$('#display_Id').css('display', 'flex');
		$('#display_Id').css('flex-direction', 'column');
		console.log("are Id me kuch toh h....");
		$('#stdId').prop('value', "<%= sid %>"
		);
		<%}%>

		<% if (name == null ) { %>
		console.log("are khali name aa gya");
		<% } else { %>
		console.log("are firstname me kuch toh h....");
		$('#name').prop('value', "<%= name %>"
		);
		<%}%>
		
		<% if (age == 0 ) { %>
		console.log("are khali age aayi h");
		<% } else { %>
		console.log("are age me kuch toh h....");
		$('#age').prop('value', "<%= age %>"
		);
		<%}%>
		
		<% if (dob == null ) { %>
		console.log("are khali dob aa gya");
		<% } else { %>
		console.log("are dob me kuch toh h....");
		$('#dob').prop('value', dobDate);
		<%}%>
		
		<% if (phone == 0 ) { %>
		console.log("are khali phone number aaya h");
		<% } else { %>
		console.log("are phone no. me kuch toh h....");
		$('#phone').prop('value', "<%= phone %>"
		);
		<%}%>
		
		<% if (email == null ) { %>
		console.log("are khali email aa gya");
		<% } else { %>
		console.log("are email me kuch toh h....");
		$('#email').prop('value', "<%= email%>"
		 );
		<%}%>
		
		<% if (address == null ) { %>
		console.log("are khali dob aa gya");
		<% } else { %>
		console.log("are address me kuch toh h....");
		$('#addr').prop('value', "<%= address %>" 
		 );
		<%}%>
		
		<% if (zip == 0 ) { %>
		console.log("are khali zipcode aaya h");
		<% } else { %>
		console.log("are zipcode me kuch toh h....");
		$('#zipcode').prop('value', "<%= zip %>"
		);
		<%}%>
		
		<% if (gender == null ) { %>
		console.log("are gender toh khaali h");
		<% } else if ( "male".equals(gender) ){ %>
		console.log("gender toh male h...");
		$('#male').prop('checked', true);
		<% } else if ( "female".equals(gender) ){ %>
		console.log("gender toh female h...");
		$('#female').prop('checked', true);
		<% }  else if ( "other".equals(gender) ){%>
		console.log("gender toh others h...");
		$('#other').prop('checked', true>);
		<% } %>		
		
		<% if (state == null ) { %>
		console.log("are khali state aa gya");
		<% } else { %>
		console.log("are state me kuch toh h....");
		$('#state').prop('value', "<%= state %>"
		 );
		<%} %>
		
		<% if (city == null ) { %>
		console.log("are khali city aa gya");
		<% } else { %>
		console.log("are city me kuch toh h....");
		selectState();
		<%}%>
		
	<% } else {%>
	 		console.log("Student Object is getting null value...");
	<% } %>
	


</script>
