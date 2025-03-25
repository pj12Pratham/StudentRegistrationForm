package com.liferay.ty.docs.portlet;

import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.JSONPortletResponseUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.BaseMVCResourceCommand;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCResourceCommand;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.ty.docs.constants.StudentRegistrationDetailsPortletKeys;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.osgi.service.component.annotations.Component;

@Component(
		immediate = true,
		property = {
				"javax.portlet.name=" + StudentRegistrationDetailsPortletKeys.STUDENTREGISTRATIONDETAILS,
				"mvc.command.name=/getCity"
		},
		service = MVCResourceCommand.class
		)
public class GetCityMVCResourceCommand extends BaseMVCResourceCommand {

	private static final Log _log = LogFactoryUtil.getLog(GetCityMVCResourceCommand.class);

	@Override
	protected void doServeResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws Exception {
		
		_log.info("Inside GetCityMVCResourceCommand class..........");
		
//		String state = (String)resourceRequest.getAttribute("state");
		String state = ParamUtil.getString(resourceRequest, "state");
		
		_log.info("state:::::" + state);
		
		List<String> cityList = new ArrayList<String>();
		cityList.add("---select---");
		
		if(state.equalsIgnoreCase("gujarat")) {
			cityList.add("Ahmedabad");
			cityList.add("Gandhinagar");
			cityList.add("Porbandar");
			cityList.add("Rajkot");
			cityList.add("Surat");
			cityList.add("Vadodara");
			cityList.add("Vapi");
		}else if(state.equalsIgnoreCase("maharashtra")) {
			cityList.add("Lonavala");
			cityList.add("Mumbai");
			cityList.add("Nagpur");
			cityList.add("Nashik");
			cityList.add("Panvel");
			cityList.add("Pune");
			cityList.add("Thane");
		}else if(state.equalsIgnoreCase("karnataka")) {
			cityList.add("Bengaluru");
			cityList.add("Davanagere");
			cityList.add("Mangaluru");
			cityList.add("Mysuru");
			cityList.add("Raichur");
			cityList.add("Ramanagara");
			cityList.add("Udupi");
		}else if(state.equalsIgnoreCase("Madhya Pradesh")) {
			cityList.add("Bhopal");
			cityList.add("Dewas");
			cityList.add("Indore");
			cityList.add("Jabalpur");
			cityList.add("Guna");
			cityList.add("Gwalior");
			cityList.add("Ujjain");
		}
		
		JSONObject jsonObject = JSONFactoryUtil.createJSONObject();
		jsonObject.put("cityList", cityList);
		JSONPortletResponseUtil.writeJSON(resourceRequest, resourceResponse, jsonObject);
		
	}
}
