package com.liferay.ty.docs.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCResourceCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;
import com.ty.liferay.model.Student;
import com.ty.liferay.service.StudentLocalService;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(
		immediate = true,
		property = {
				"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
				"mvc.command.name=/deleteStudent"
		},
		service = MVCResourceCommand.class
		)
public class RemoveStudentMVCResourceCommand extends BaseMVCResourceCommand{
	
	@Override
	protected void doServeResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws Exception {
		_log.info("Inside RemoveStudentMVCResourceCommand to student.......");
		
		long Id = ParamUtil.getLong(resourceRequest, "stdId");
		
		_log.info("Student Id is::::: " + Id);
		
		Student student = studentLocalService.deleteStudent(Id);
		_log.info("Removed Student is::::::: " +student);
	}
	
	private static final Log _log = LogFactoryUtil.getLog(RemoveStudentMVCResourceCommand.class);
	
	@Reference
	private StudentLocalService studentLocalService;
}
