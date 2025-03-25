package com.liferay.ty.docs.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;
import com.ty.liferay.model.Student;
import com.ty.liferay.service.StudentLocalService;

import java.util.List;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(immediate = true, property = {
		"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
		"mvc.command.name=/showDetails"}, service = MVCRenderCommand.class)

public class ShowDetailsMVCRenderCommand implements MVCRenderCommand {

	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		_log.info("Inside ShowDetailsMVCRenderCommand class......");

		List<Student> studentList = studentLocalService.getStudents(-1, -1);
//		for (Student student : studentList) {
//			_log.info(student);
//		}
		renderRequest.setAttribute("studentList", studentList);
		return "/details.jsp";
	}

	private static final Log _log = LogFactoryUtil.getLog(ShowDetailsMVCRenderCommand.class);

	@Reference
	private StudentLocalService studentLocalService;
}
