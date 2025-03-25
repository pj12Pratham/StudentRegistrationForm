package com.liferay.ty.docs.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCActionCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;
import com.ty.liferay.service.StudentLocalService;

import java.util.Date;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(immediate = true, property = {
		"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
		"mvc.command.name=/studentDetails" }, service = MVCActionCommand.class)
public class SubmitDataMVCActionCommand extends BaseMVCActionCommand {

	@Override
	protected void doProcessAction(ActionRequest actionRequest, ActionResponse actionResponse) throws Exception {

		_log.info("Inside SubmitDataMVCActionCommand class to submit all data in database........");

		long stdId = ParamUtil.getLong(actionRequest, "stdId");

		String stdName = ParamUtil.getString(actionRequest, "sname");
		int age = ParamUtil.getInteger(actionRequest, "age");

		String dob = ParamUtil.getString(actionRequest, "dob");
		Date dobDate = java.sql.Date.valueOf(dob);

		String gender = ParamUtil.getString(actionRequest, "gender");
		long phone = ParamUtil.getLong(actionRequest, "phone");
		String email = ParamUtil.getString(actionRequest, "email");
		String address = ParamUtil.getString(actionRequest, "addr");
		String state = ParamUtil.getString(actionRequest, "state");
		String city = ParamUtil.getString(actionRequest, "city");
		int zip = ParamUtil.getInteger(actionRequest, "zipcode");
		String x_school = ParamUtil.getString(actionRequest, "x_school");
		int x_perc = ParamUtil.getInteger(actionRequest, "x_perc");
		int x_yop = ParamUtil.getInteger(actionRequest, "x_yop");
		String xii_school = ParamUtil.getString(actionRequest, "xii_school");
		int xii_perc = ParamUtil.getInteger(actionRequest, "xii_perc");
		int xii_yop = ParamUtil.getInteger(actionRequest, "xii_yop");
		String college = ParamUtil.getString(actionRequest, "college");
		String degree = ParamUtil.getString(actionRequest, "degree");
		int deg_perc = ParamUtil.getInteger(actionRequest, "deg_perc");
		int deg_yop = ParamUtil.getInteger(actionRequest, "deg_yop");

		_log.info("Student ID:::::::" + stdId);
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

		_log.info("x_school:::::::" + x_school);
		_log.info("x_perc:::::::" + x_perc);
		_log.info("x_yop:::::::" + x_yop);
		_log.info("xii_school:::::::" + xii_school);
		_log.info("xii_perc:::::::" + xii_perc);
		_log.info("xii_yop:::::::" + xii_yop);
		_log.info("college:::::::" + college);
		_log.info("degree:::::::" + degree);
		_log.info("deg_perc:::::::" + deg_perc);
		_log.info("deg_yop:::::::" + deg_yop);

		if (stdId > 0) {
			_log.info("Update method called...");
			studentLocalService.updateStudent(stdId, stdName, age, dobDate, gender, phone, email, address, state, city,
					zip, x_school, x_perc, x_yop, xii_school, xii_perc, xii_yop, college, degree, deg_perc, deg_yop);
		} else {
			_log.info("Add method called...");
			studentLocalService.addStudent(stdName, age, dobDate, gender, phone, email, address, state, city, zip,
					x_school, x_perc, x_yop, xii_school, xii_perc, xii_yop, college, degree, deg_perc, deg_yop);
		}

		actionResponse.getRenderParameters().setValue("mvcRenderCommandName", "/showDetails");
	}

	private static final Log _log = LogFactoryUtil.getLog(SubmitDataMVCActionCommand.class);

	@Reference
	private StudentLocalService studentLocalService;
}
