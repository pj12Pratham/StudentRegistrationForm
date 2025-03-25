package com.liferay.ty.docs.portlet;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;
import com.ty.liferay.model.Student;
import com.ty.liferay.service.StudentLocalService;

import java.util.Date;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(
			immediate = true,
			property = {
					"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
					"mvc.command.name=/passingData"
			},
			service = MVCRenderCommand.class
		)
public class TransferDataMVCRenderCommand implements MVCRenderCommand{

	private static final Log _log = LogFactoryUtil.getLog(TransferDataMVCRenderCommand.class);
	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		_log.info("Inside TransferDataMVCRenderCommand class........");		

		long stdId = ParamUtil.getLong(renderRequest, "stdId");
		_log.info("Something is there in student ID: " + stdId);
		
		Student student = null;
		if(stdId>0) {
			try {
				student = studentLocalService.getStudent(stdId);
				renderRequest.setAttribute("student", student);
				_log.info("Student get from view.jsp into TransferDataMVCRenderCommand is: " + student);
			} catch (PortalException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String stdName = ParamUtil.getString(renderRequest, "sname");
		int age = ParamUtil.getInteger(renderRequest, "age");
		
		String dob = ParamUtil.getString(renderRequest, "dob");
		Date dobDate = java.sql.Date.valueOf(dob);
		
		String gender = ParamUtil.getString(renderRequest, "gender");
		long phone = ParamUtil.getLong(renderRequest, "phone");
		String email = ParamUtil.getString(renderRequest, "email");
		String address = ParamUtil.getString(renderRequest, "addr");
		String state = ParamUtil.getString(renderRequest, "state");
		String city = ParamUtil.getString(renderRequest, "city");
		int zip = ParamUtil.getInteger(renderRequest, "zipcode");
		
		_log.info("Student Id:::::::" + stdId);
		_log.info("Student Name:::::::" + stdName);
		_log.info("age:::::::" + age);
		_log.info("dob:::::::" + dobDate);
		_log.info("gender:::::::" +gender);
		_log.info("phone:::::::" + phone);
		_log.info("email:::::::" + email);
		_log.info("address:::::::" + address);
		_log.info("state:::::::" + state);
		_log.info("city:::::::" + city);
		_log.info("zip:::::::" + zip);
		
		renderRequest.setAttribute("stdId", stdId);
		renderRequest.setAttribute("stdName", stdName);
		renderRequest.setAttribute("age", age);
		renderRequest.setAttribute("dob", dobDate);
		renderRequest.setAttribute("gender", gender);
		renderRequest.setAttribute("phone", phone);
		renderRequest.setAttribute("email", email);
		renderRequest.setAttribute("address", address);
		renderRequest.setAttribute("state", state);
		renderRequest.setAttribute("city", city);
		renderRequest.setAttribute("zip", zip);
		
		return "/AllDet.jsp";
	}
	
	@Reference
	private StudentLocalService studentLocalService;
}
