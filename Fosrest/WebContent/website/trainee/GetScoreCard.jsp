<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

             <script>
                function OnStart() {
                   
                  	var steps = 3;
                	var traineeSteps =
                		<%=(Integer) session.getAttribute("traineeSteps")%>
                	if(traineeSteps >= steps){
						//allow
                	}else{ 
                		if(steps-1 == traineeSteps){
                			alert('Please Complete Your Previous Training First')
                		}else{
                			alert('Please Flow Step By Step..');
                		}
                		window.location.href ='/Fosrest/loginProcess.fssai';
                	}

                	flatpickr("#trainingDate" , {
                		
                	});	
                	
              
                }
                window.onload = OnStart;

            </script>
 
<!--

//-->
</script>

 <%-- <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> --%>
<cf:form action="ListGetScoreCard.fssai" name="myForm" method="POST" commandName="GetScoreCardForm" onsubmit="return validateFields();"> 

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
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName }</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                    <h1>Get Score Card</h1>
                                    <div class="row">
                                        <div class="col-xs-12">
                                             <fieldset>
                                        <h4>Designation: ${listOnlineTraining.designation}</h4>
                                        <h4>Training Type:${listOnlineTraining.trainingType}</h4>
                                        <h4>Training Phase:${listOnlineTraining.trainingPhase}</h4>
                                         <h4> Subjects: </h4>
                                      
                                     <ct:choose>
                                     <ct:when  test="${!empty listsubjects2}">
                                     <ct:forEach var="subjects2" items="${listsubjects2}">
                                           <li> <ct:out value="${subjects2[0]}"/>&nbsp;  <ct:out value="${subjects2[1]}"/></li>
                                             </ct:forEach>
                                     </ct:when>
                                     <ct:otherwise > 
                                      <ct:forEach var="subjects" items="${listsubjects}">
                                           <li>  <ct:out value="${subjects}"/></li>
                                             </ct:forEach>
                                              <h4>Score:${listGetScoreCard.score} </h4> 
                                     </ct:otherwise>
                                     </ct:choose>
                                          <br> </fieldset>
                                    <br> </div>
                                           
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
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>
   