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

@Component(immediate = true, property = {
		"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
		"mvc.command.name=/editStudentData" }, service = MVCRenderCommand.class)

public class EditStudentMVCRenderCommand implements MVCRenderCommand {

	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		_log.info("Inside EditStudentMVCRenderClass.....");

		long Id = ParamUtil.getLong(renderRequest, "id");


		Student student = null;

		if (Id != 0) {
			_log.info("Sending details to update Student from EditStudentMVCRenderClass...");
			_log.info("Id of updated student is: " + Id);
			try {
				student = studentLocalService.getStudent(Id);
				_log.info("student to be updated is :" + student);

			} catch (PortalException e) {
				_log.info("Error while fetching student in update..." + e);
			}
		} else {
			_log.info("Sending details by using Back button...");
			String stdName = ParamUtil.getString(renderRequest, "name");
			int age = ParamUtil.getInteger(renderRequest, "age");

			String dob = ParamUtil.getString(renderRequest, "dob");
			Date dobDate = java.sql.Date.valueOf(dob);

			String gender = ParamUtil.getString(renderRequest, "gender");
			long phone = ParamUtil.getLong(renderRequest, "phone");
			String email = ParamUtil.getString(renderRequest, "email");
			String address = ParamUtil.getString(renderRequest, "address");
			String state = ParamUtil.getString(renderRequest, "state");
			String city = ParamUtil.getString(renderRequest, "city");
			int zip = ParamUtil.getInteger(renderRequest, "zip");

			_log.info("Student Name:::::::" + stdName);
			_log.info("age:::::::" + age);
			_log.info("dob:::::::" + dobDate);
			_log.info("gender:::::::" + gender);
			_log.info("phone:::::::" + phone);
			_log.info("email:::::::" + email);
			_log.info("address:::::::" + address);
			_log.info("state:::::::" + state);
			_log.info("city:::::::" + city);
			_log.info("zip:::::::" + zip);

			student = studentLocalService.createStudent(0l);
			student.setStdName(stdName);
			student.setAge(age);
			student.setDob(dobDate);
			student.setGender(gender);
			student.setMobileNo(phone);
			student.setStdEmail(email);
			student.setAddress(address);
			student.setState(state);
			student.setCity(city);
			student.setPincode(zip);

			_log.info("student to be renderBack to edit is :" + student);
		}

		renderRequest.setAttribute("student", student);

		return "/view.jsp";
	}

	private static final Log _log = LogFactoryUtil.getLog(EditStudentMVCRenderCommand.class);

	@Reference
	private StudentLocalService studentLocalService;
}
