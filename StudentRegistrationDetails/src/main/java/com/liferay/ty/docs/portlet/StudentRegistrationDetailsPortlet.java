package com.liferay.ty.docs.portlet;

import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;

import org.osgi.service.component.annotations.Component;

/**
 * @author pratham
 */
@Component(
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=false",
		"javax.portlet.display-name=StudentRegistrationDetails",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp", 
		"javax.portlet.init-param.copy-request-parameters=false",
		"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class StudentRegistrationDetailsPortlet extends MVCPortlet {
}