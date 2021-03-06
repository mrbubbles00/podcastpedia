<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<%@ include file="/WEB-INF/jsp/common/recaptcha_options.jsp" %>


<div id="user_registration_form_wrapper" class="bg_color border_radius shadowy common_mar_pad">

  <h2 class="title_before_form"><spring:message code="user.registration.header" text="Registration"/></h2>
  <hr class="before_form_header_line"/>

  <c:url value="/users/registration" var="submitEmailForPasswordResetUrl" />
  <form:form name="registration_form" class="vertical_style_form"
             method="POST" modelAttribute="user" action="${submitEmailForPasswordResetUrl}" >

    <div id="label_above_elements">
      <label for="displayName" class="label">
        <spring:message code="user.registration.display_name" text="Display name - optional"/>
      </label>
    </div>
    <p>
      <form:input path="displayName" id="displayName" class="form_input"/>
    </p>

    <!--username field-->
    <div id="label_above_elements">
      <label for="username" class="label">
        <spring:message code="user.registration.label.email" text="Email - required, verified but never shown"/>
      </label>
    </div>
    <p>
      <form:input path="username" id="username" class="form_input"/>
      <form:errors path="username" cssClass="error_form_validation"/>
    </p>

    <!-- password field -->
    <div id="label_above_elements">
      <label for="password" class="label">
        <spring:message code="user.registration.label.password" text="Password"/>
      </label>
    </div>
    <p>
      <form:password path="password" id="password" class="form_input"/>
      <form:errors path="password" cssClass="error_form_validation"/>
    </p>

    <!-- confirm password field -->
    <div id="label_above_elements">
      <label for="matchingPassword" class="label">
        <spring:message code="user.registration.password_confirmation" text="Confirm password"/>
      </label>
    </div>
    <p>
      <form:password path="matchingPassword" id="matchingPassword" class="form_input"/>
      <form:errors path="matchingPassword" cssClass="error_form_validation"/>
    </p>

    <!-- TODO - maybe add here preferred language   -->
    <p class="captcha_help_p">
      <spring:message code="add_podcast.spam" text="Help us prevent spam!"/>
      <br/>
      <spring:message code="label.captcha_first_part" text="Please type the two words in the image below - press"/>
      <img id="captcha_help_pic"src="<c:url value='/static/images/recaptcha_refresh.png'/>" alt="refresh" />
      <spring:message code="label.captcha_second_part" text="for a new challenge"/>
    </p>
    <div id="captcha_paragraph">
      <c:if test="${invalidRecaptcha == true}">
        <span class="error_form_validation"><spring:message code="invalid.captcha" text="Invalid captcha please try again"/></span>
      </c:if>
      <%
        ReCaptcha c = ReCaptchaFactory.newSecureReCaptcha("6LcW3OASAAAAAKEJTHMmp_bo5kny4lZXeDtgcMqC",
          "6LcW3OASAAAAAKVX2duVsSy2uMMHL105-jPDrHMD", false);
        out.print(c.createRecaptchaHtml(null, null));
      %>
    </div>

    <spring:message var="submit_registration_btn" code="submit" text="Submit registration"/>
    <input type="submit" value="${submit_registration_btn}"  id="send_message" class="submit_form_button"/>
    <div class="clear"></div>
  </form:form>
  <br><br><br>
  <spring:message code="user.registration.agreement_privacy_policy" text="Confirm agreement to privacy policy"/>
</div>
