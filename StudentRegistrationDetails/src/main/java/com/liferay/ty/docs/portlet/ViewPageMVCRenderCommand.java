package com.liferay.ty.docs.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCRenderCommand;
import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

@Component(
		immediate = true,
		property = {
				"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
				"mvc.command.name=/viewPage"
		},
		service = MVCRenderCommand.class
		)
public class ViewPageMVCRenderCommand implements MVCRenderCommand{
	
	private static final Log _log = LogFactoryUtil.getLog(ViewPageMVCRenderCommand.class);
	@Override
	public String render(RenderRequest renderRequest, RenderResponse renderResponse) throws PortletException {
		_log.info("Inside ViewPageMvcRenderCommandClass to render registration page.");
		return "/view.jsp";
	}

}
