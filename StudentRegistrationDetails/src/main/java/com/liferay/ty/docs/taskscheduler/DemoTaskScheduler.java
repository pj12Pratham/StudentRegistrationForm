package com.liferay.ty.docs.taskscheduler;

import com.liferay.dispatch.executor.BaseDispatchTaskExecutor;
import com.liferay.dispatch.executor.DispatchTaskExecutor;
import com.liferay.dispatch.executor.DispatchTaskExecutorOutput;
import com.liferay.dispatch.model.DispatchTrigger;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

import org.osgi.service.component.annotations.Component;

@Component(
		property = {
				"dispatch.task.executor.name=demoTaskScheduler",
				"dispatch.task.executor.type=demoTaskScheduler"
		},
		service = DispatchTaskExecutor.class
		)
public class DemoTaskScheduler extends BaseDispatchTaskExecutor{

	private static final Log _log = LogFactoryUtil.getLog(DemoTaskScheduler.class);

	@Override
	public String getName() {
		return "demoTaskScheduler";
	}

	@Override
	public void doExecute(DispatchTrigger dispatchTrigger, DispatchTaskExecutorOutput dispatchTaskExecutorOutput)
			throws Exception {

		_log.info("My first Job Scheduler : demoTaskScheduler");
	}

}
