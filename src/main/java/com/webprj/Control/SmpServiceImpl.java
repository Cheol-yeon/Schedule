package com.webprj.Control;

import com.webprj.studio.dao.LoginDao;

public class SmpServiceImpl implements SmpService {
	private LoginDao loginDao = null;
	
	public SmpServiceImpl() {}
	
	public SmpServiceImpl(LoginDao loginDao) {
		this.loginDao = loginDao;
	}


	@Override
	public boolean loginAvailability(String id, String pwd) {
		return (Boolean) null;
	}

}