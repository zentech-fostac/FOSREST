<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>



<ct:url var="addAction" value="/stateadminadd.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="stateAdminForm" onsubmit="return validateFields();">

	<section>
		 <%@include file="/website/roles/top-menu.jsp"%> 
	</section>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Sidebar -->
				 <%@include file="/website/roles/slider.jsp"%> 
				<!-- /#sidebar-wrapper -->
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
						<!-- vertical button -->
						<div class="row">
							<div class="col-lg-12">
								<a href="#menu-toggle" class="vertical-menu-position-btn"
									id="menu-toggle"> <i class="fa fa-bars"></i> <span
									class="orange-font">Welcome Fotest</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									State Admin <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>State Admin</legend>
											<cf:input path="id" type="hidden" />
											<cf:input path="userId" type="hidden" />
											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>First Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="firstNameErr" style="display: none;"
																class="style-li error-red">First Name should not
																be blank.</li>

														</ul>
													</div>
													<cf:input path="firstName" placeholder="First Name"
														class="form-control" />

												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Middle Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="middleNameErr" style="display: none;"
																class="style-li error-red">Middle Name should not
																be blank.</li>

														</ul>
													</div>
													<cf:input path="middleName" placeholder="Middle Name"
														class="form-control" />

												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Last Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="lastNameErr" style="display: none;"
																class="style-li error-red">Last Name should not be
																blank.</li>

														</ul>
													</div>
													<cf:input path="lastName" placeholder="Last Name"
														class="form-control" />

												</div>

											</div>
											<!-- right side -->
											<div class="row">

												<!-- left -->
												<div class="col-xs-6">

													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Aadhar
																		Number:</strong></li>
																<li class="style-li error-red"><cf:errors
																		path="aadharNumber" cssClass="error" /></li>
															</ul>
														</div>
														<cf:input path="aadharNumber" maxlength="12"
															onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
															placeholder="Aadhar Number" class="form-control"
															required="required" />
													</div>

													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Email:</strong></li>
																<li class="style-li error-red">*</li>
																<!--  valid -->
																<li id="EmailErr" style="display: none;"
																	class="style-li error-red">Email can not be
																	blank.</li>

															</ul>
														</div>

														<cf:input type="text" path="email" class="form-control"
															placeholder="Email" onblur="emailVal(this.id,this.value)"
															required="" />
													</div>

													<input type="submit" id="updatebtn"
														style="display: none; float: right; margin-right: 122px;"
														value="Update" class="btn login-btn" /> 
														 <!-- <input type="submit" id="createbtn" value="Update"
														class="btn login-btn" />  -->
												</div>
											</div>

										</fieldset>
									</div>
								</div>
							</div>

							<!-- search Results -->
							<div class="col-xs-12 " id="testt">

								<!-- table -->
								 <div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>State Admin List</legend>
											<ct:if test="${!empty liststateadmin}">
												<table border="1" id="datatablesfosrest"
													class="table table-bordered table-responsive">

													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>User Id</th>
															<th>First Name</th>
															<th>Middle Name</th>
															<th>Last Name</th>
															<th>Aadhar number</th>
															<th>Edit</th>
															<th>Delete</th>

														</tr>
													</thead>

													<ct:forEach items="${liststateadmin}" var="stateadmin"
														varStatus="loop">

														<tr>
															<td>${loop.count}</td>
															<td>${stateadmin.userId}</td>
															<td>${stateadmin.firstName}</td>
															<td>${stateadmin.middleName}</td>
															<td>${stateadmin.lastName}</td>
															<td>${stateadmin.aadharNumber}</td>
															<td><button
																	onclick='editstateadmin(${stateadmin.id});return false;'>Edit</button></td>
															<td><a
																href="<ct:url value='/stateadmin/remove/${stateadmin.id}.fssai' />">Delete</a></td>
														</tr>
													</ct:forEach>
												</table>
											</ct:if>
										</fieldset>
									</div>
								</div> 
							</div>

							<!-- search div ends -->

						</div>
						<!-- row ends -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="idH" value="" />
</cf:form>
<script>
             /*  var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";
               */
                     function editstateadmin(id){

                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'stateadmin/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#firstName").val(mainData1.firstName);
            	    $("#middleName").val(mainData1.middleName);
            	    $("#lastName").val(mainData1.lastName);
        		    $("#aadharNumber").val(mainData1.aadharNumber);
        		    $("#userId").val(mainData1.userId);
        		    $("#email").val(mainData1.email);
        		    $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                return false;
                } 
                 
                 
               
                /*  function validateFields(){
                	 $("#trainingNameErr").css("display" , "none");
                	 $("#moduleNameErr").css("display" , "none");
                	 $("#durationErr").css("display" , "none");
                  	
                	 if($("#trainingName").val() == ''){
                 		 $("#trainingNameErr").css("display" , "block");
                  		return false; 
                 	 }
                  	if($("#moduleName").val() == 0){
                		 $("#moduleNameErr").css("display" , "block");
                 		return false; 
                	 }
                  	if($("#duration").val() == 0){
               		 $("#durationErr").css("display" , "block");
                		return false; 
               	 }
              }  */
                </script>

<%-- <%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

            <cf:form action="stateadminsearch.fssai" name="myForm" method="POST" commandName="stateAdminForm">
                <!-- horizontal navigation -->
                <section>

                    <%@include file="../roles/top-menu.jsp"%>
                </section>
                <!-- main body -->
                <section class="main-section-margin-top">
                    <div class="container-fluid">
                        <div id="wrapper">
                            <!-- Sidebar -->
                            <%@include file="../roles/slider.jsp" %>
                                <!-- /#sidebar-wrapper -->
                                <!-- Page Content -->
                                <div id="page-content-wrapper">
                                    <div class="container-fluid">
                                        <!-- vertical button -->
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome   ${logId} </span> </a>
                                            </div>
                                        </div>
                                        <!-- add the content here for main body -->

                                        <section class="section-form-margin-top">

                                            <!-- fostac logo -->
                                            <!-- login form -->
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <h3 class="text-capitalize heading-3-padding">Trainer User Management</h3>
                                                    <form>
                                                        <!-- personal information -->
                                                        <div class="personel-info">
                                                            <fieldset>
                                                                <!-- left side -->
                                                                <div class="col-md-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <ul class="lab-no">
                                                                                <li class="style-li"><strong>First Name:</strong></li>
                                                                                <li class="style-li error-red"> </li>
                                                                            </ul>
                                                                        </div>
                                                                        <cf:input type="text" class="form-control" path="firstName" placeholder="First Name" /> </div>
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <ul class="lab-no">
                                                                                <li class="style-li"><strong>Middle Name:</strong></li>
                                                                                <li class="style-li error-red"> </li>
                                                                            </ul>
                                                                        </div>
                                                                        <cf:input type="text" class="form-control" path="middleName" placeholder="Middle Name" /> </div>
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <ul class="lab-no">
                                                                                <li class="style-li"><strong>Last Name:</strong></li>
                                                                                <li class="style-li error-red"> </li>
                                                                            </ul>
                                                                        </div>
                                                                        <cf:input type="text" class="form-control" path="lastName" placeholder="Last Name" /> </div>
                                                                </div>
                                                                <!-- right side -->
                                                                <div class="col-md-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <ul class="lab-no">
                                                                                <li class="style-li"><strong>User ID:</strong></li>
                                                                                <li class="style-li error-red"> </li>
                                                                            </ul>
                                                                        </div>
                                                                        <cf:input type="text" class="form-control" path="userId" placeholder="User Id" /> </div>
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <ul class="lab-no">
                                                                                <li class="style-li"><strong>Aadhar Number:</strong></li>
                                                                                <li class="style-li error-red"> </li>
                                                                            </ul>
                                                                        </div>
                                                                        <cf:input type="text" class="form-control" path="aadharNumber" placeholder="Aadhar Number" /> </div>
                                                                    <div class="form-group">
                                                                        <div>
                                                                            <ul class="lab-no">
                                                                                <li class="style-li"><strong>Status:</strong></li>
                                                                                <li class="style-li error-red"></li>
                                                                            </ul>
                                                                        </div>
                                                                        <cf:select path="status" class="form-control">
                                                                            <cf:option value="0" label="Selet Status" />
                                                                            <cf:option value="A" label="Active" />
                                                                            <cf:option value="I" label="In-Active" />
                                                                        </cf:select>
                                                                    </div>
                                                                </div>
                                                                <!-- personal information ends -->
                                                            </fieldset>
                                                        </div>
                                                        <!-- personal information ends -->
                                                        <!-- Training center Details  -->
                                                        <div class="row" style="height: 20px;"></div>
                                                        <!-- captcha -->
                                                        <!-- buttons -->
                                                        <div class="col-md-4 hidden-xs"></div>
                                                        <div class="col-md-4 col-xs-12">
                                                            <a href="#">
                                                            <input type="hidden" path="profileID" name="profileID" id="profileID" value="1"/>
                                                            <input type="hidden" path="logindetails" name="logindetails" id="logindetails" value=""/>
                                                                <input type="submit" class="form-control login-btn" value="Search"> </a>
                                                        </div>
                                                        <div class="col-md-4 hidden-xs"></div>
                                                        <!-- training center details ends -->
                                                    </form>
                                                </div>
                                                <div class="col-md-2 hidden-xs"></div>
                                            </div>

                                        </section>
                                        <section class="section-form-margin-top">

                                            <!-- fostac logo -->
                                            <!-- login form -->
                                            <div class="row" style="height:20px;"></div>
                                            <div class="row">
                                                <div class="col-xs-12 table-overflow-responsive">
                                                     <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                        <thead>
                                                            <th>User ID</th>
                                                            <th>First Name</th>
                                                            <th>Middle Name</th>
                                                            <th>Last Name</th>
                                                            <th>Aadhar Number</th>
                                                            <th>Current Status</th>
                                                            <th>Update Status</th>
                                                        </thead>
                                                        <tbody>
                                                            <ct:choose>
                                                                <ct:when test="${not empty searchstateAdmin }">
                                                                    <ct:forEach var="listValue" items="${searchstateAdmin}" varStatus="loop">
                                                                        <tr>
                                                                            <td>
                                                                                <label><a href="stateAdminPersonalInformation.fssai?userId=${listValue[6]}" value="${listValue[0]}">${listValue[1]}</a></label>
                                                                            </td>
                                                                            <td>
                                                                                <label>${listValue[2] }</label>
                                                                            </td>
                                                                            <td>
                                                                                <label>${listValue[3]}</label>
                                                                            </td>
                                                                            <td>
                                                                                <label>${listValue[4]}</label>
                                                                            </td>
                                                                            <td>
                                                                                <label>${listValue[5]}</label>
                                                                            </td>
                                                                             <td>
                                                                                    <label>${listValue[8]}</label>
                                                                                </td>
                                                                                <td>
                                                                                    <label><input type="submit"  onclick=" return activateDeActivateUser('${listValue[6]}','${listValue[7]}','3');" value="${listValue[7]}"/></label>
                                                                                </td>
                                                                        </tr>
                                                                    </ct:forEach>
                                                                </ct:when>
                                                                <ct:otherwise>
                                                                    <td colspan="5">
                                                                        <label>No records available</label>
                                                                    </td>

                                                                </ct:otherwise>
                                                            </ct:choose>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-md-2 hidden-xs"></div>
                                            </div>

                                        </section>

                                    </div>
                                </div>
                        </div>
                    </div>
                </section>
                <!-- scripts -->
            </cf:form>
                  <script>
                function activateDeActivateUser(loginDetails,status,profileID){
                	if(confirm("Are you Sure ? You want to "+status )){
                		$("#logindetails").val(loginDetails);	
                		$("#status").val((status=="INACTIVE"?"I":"A"));	
                		$("#stateAdminForm").attr("action" , "activateDeActivateTrainer.fssai");
                    } else{
                        return false;
                    }
                }
            </script>
 --%>