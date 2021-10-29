package com.webprj.studio.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.webprj.Control.Controller;
import com.webprj.di.entity.Reservation;
import com.webprj.studio.service.StudioService;

public class apiScheduleController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response, StudioService studioService) {

		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		
		String method = request.getMethod().toUpperCase();
		String json = null;
		System.out.println("request method : " + method);
		
		int btnNum = Integer.parseInt(request.getParameter("btn"));
		System.out.println(btnNum);
		
		String URI = request.getRequestURI(); // /api/schedules/1
		String[] temp=URI.split("/");
		String BtnNo=temp[3];
		
		if (method.equals("GET")) {
			if (BtnNo == "1") {
				System.out.println("api,if문 진입");
				List<Reservation> RsvList = studioService.getRsvList(null);
				json = new Gson().toJson(RsvList);
				System.out.println("json : " + json);
			} else {
				return "error";
			}
		}
		return json;
	}

}
