<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="website/js/commonController.js"></script>
     <script>
                function OnStart() {
                   
                	flatpickr("#trainingStartDate" , {
                		enableTime: true
                	});	
                	
                 	flatpickr("#trainingEndDate" , {
                 		enableTime: true
                	});	
                }
                window.onload = OnStart;

            </script>
  <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> 
<cf:form action="${addAction}" name="myForm" method="POST" commandName="TrainingScheduleForm" onsubmit="return validateFields();"> 

    <section>
         <%@include file="../roles/top-menu.jsp"%>
    </section>
    <!-- main body -->
    <section class="main-section-margin-top">
        <div class="container-fluid">
            <div id="wrapper">
                <!-- Sidebar -->
                <div > <%@include file="../roles/slider.jsp" %>
                </div>
                <!-- /#sidebar-wrapper -->
                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <!-- vertical button -->
                        <div class="row">
                            <div class="col-lg-12">
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                    <h1>Training Schedule Master</h1>
                                    <div class="row">
                                        <div class="col-xs-12">
										<cf:input type="hidden" path="trainingScheduleId" />
                                            <!-- left side -->
                                            <div class="col-xs-6">
                                            
                                            	<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>User Type</strong></li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select UserType </label> <cf:errors
																path="userType" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select User Type" />
													<cf:options items="${userType}" />
												</cf:select>
											</div>
                                            
                                            
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Type:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="trainingType" class="form-control">
													<cf:option value="" label="Select training" />
													<cf:options items="${trainingType}" />
												</cf:select>
											</div>
                                                
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Phase:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="trainingPhase" class="form-control">
													<cf:option value="" label="Select training phase" />
													<cf:options items="${trainingPhase}"/>	
												</cf:select>
                                                </div>
                                                
                                                    <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Start Date:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:input class="form-control" path="trainingStartDate"  type="text" placeholder="Training Start Date"/>
                                                </div>
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training
																Partner Name:</strong></li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:select path="trainingPartner" class="form-control"
													onchange="getTrainingInstitude(this.value , 'trainingInstitude')">
													<cf:option value="0" label="Select Training Partner" />
													<cf:options items="${listTrainingPartner}"  itemValue="trainingPartnerId" itemLabel="trainingPartnerName" /></cf:select>
											</div>
											
													<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training Institude:</strong></li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:select path="trainingInstitude" class="form-control"
													onchange="">
													<cf:option value="0" label="Select Training Institude" />
													<cf:options items="${listTrainingInstitude}"   itemValue="id" itemLabel="trainingCenterName" />
													</cf:select> 
											</div>

											<div class="form-group">
                                                    <div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training Institute's Status:</strong></li>
														<li class="style-li error-red"><cf:errors
																path="trainingInstitudeStatus" cssClass="error" /></li>
													</ul>
												</div>
												 <cf:select path="trainingInstitudeStatus" class="form-control">
													<cf:option value="" label="Select Status" />
													<cf:options items="${userStatusMap}"/>	
												</cf:select>

                                                </div>
                                                
                                              <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training End Date:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:input class="form-control" path="trainingEndDate"  type="text" placeholder="Training End Date"/>
                                                </div>
                                         
                                                
                                            </div> <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                            <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                	<input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn"/>
                                                <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Search"/> 
                                               
                                                </div>
                                            </div>
                                           
                                        </div>

                                       
                                    </div>
                                </div>

                                
                                <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                           <legend>Unit Master</legend>
                                            <ct:if test="${!empty listTrainingSchedule}">
                                            <table class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>User Type</th>
                                                        <th>Training Type</th>
                                                        <th>Training Phase</th>
                                                        <th>Training Start Date</th>
                                                        <th>Training End Date</th>
                                                        <th>Status</th>
                                                        <th>Reschedule</th>
                                                        <th>Deacivate</th>
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listTrainingSchedule}" var="TrainingSchedule">
                                                <tr>
												<td>${TrainingSchedule.trainingScheduleId}</td>
												<td>${TrainingSchedule.userType}</td>
												<td>${TrainingSchedule.trainingType}</td>
												<td>${TrainingSchedule.trainingPhase}</td>
												<td>${TrainingSchedule.trainingStartDate}</td>
												<td>${TrainingSchedule.trainingEndDate}</td>
												<td>${TrainingSchedule.trainingInstitudeStatus}</td>
												<td><button onclick='editTrainingSchedule(${TrainingSchedule.trainingScheduleId});return false;' >Reschedule</button></td>
												<td><a href="<ct:url value='/TrainingSchedule/remove/${TrainingSchedule.trainingScheduleId}.fssai' />" >Deactivate</a></td>
												
											</tr>
										</ct:forEach>
                                            </table>
                                           </ct:if>
                                        </fieldset>
                                                    </div>
                                                </div>
                                            </div>
                             <!-- search div ends -->
                        </div><!-- row ends -->
                    </div>
                </div>
            </div>
        </div>
    </section>
 
                                        
   </cf:form>
   
           <script>
          
                
                function editTrainingSchedule(id){
                alert(id);
                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'TrainingSchedule/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#trainingScheduleId").val(mainData1.trainingScheduleId);
            	    $("#userType").val(mainData1.userType);
            	    $("#trainingType").val(mainData1.trainingType);
            	    $("#trainingPhase").val(mainData1.trainingPhase);
            	    $("#trainingInstitudeStatus").val(mainData1.trainingInstitudeStatus);
            	    $("#trainingStartDate").val(mainData1.trainingStartDate);
            	    $("#trainingEndDate").val(mainData1.trainingEndDate);
            	    $("#trainingPartner").val(mainData1.trainingPartner);
            	    $("#trainingInstitude").val(mainData1.trainingInstitude);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            </script>