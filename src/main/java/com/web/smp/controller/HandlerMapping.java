package com.web.smp.controller;

import java.util.HashMap;
import java.util.Map;

import com.web.smp.controller.impl.ApiContentController;
import com.web.smp.controller.impl.ApiScheduleController;
import com.web.smp.controller.impl.ApiUserController;
import com.web.smp.controller.impl.ControllerInterface;
import com.web.smp.controller.impl.IndexController;
import com.web.smp.controller.impl.MainController;


public class HandlerMapping {
	private Map<String, ControllerInterface> handlerMapper = null;

	public HandlerMapping() {
		handlerMapper = new HashMap<String, ControllerInterface>();

		handlerMapper.put("/index", new IndexController());
		handlerMapper.put("/main", new MainController());
		
		handlerMapper.put("/api/users", new ApiUserController());
		handlerMapper.put("/api/schedules", new ApiScheduleController());
		handlerMapper.put("/api/contents", new ApiContentController());
	}

	public ControllerInterface getHandler(String path) {
		String[] temp=path.split("/"); 
		// /main/1라면 [0]='', [1]="main", [2]="1"가 저장됨
		
		if(temp.length>3) {//리소스가 2개 초과면 2개까지 분류만 path로 넘기기
			return handlerMapper.get("/"+temp[1]+"/"+temp[2]);
		}else {
			return handlerMapper.get(path);// /api/users
		}
	}
}
