package com.chj.common.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chj.common.dto.MenuDto;
import com.chj.common.util.JsonUtils;

@Controller
public class HomeController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping({ "/", "/index", "/welcome" })
	public String index(HttpServletRequest request) {
		return "/welcome";
	}

	@RequestMapping(value = "loadMenu", method = RequestMethod.GET)
	@ResponseBody
	public List<MenuDto> loadMenu(HttpServletRequest request,
			HttpServletResponse response) {
		List<MenuDto> loadMenuList = getLoadMenu();
		logger.info("menuList=" + JsonUtils.beanToJsonString(loadMenuList));
		return loadMenuList;
	}

	public List<MenuDto> getLoadMenu() {
		List<MenuDto> loadMenus = new ArrayList<MenuDto>();
		MenuDto one = new MenuDto("系统监控","","");
		one.getChildren().add(new MenuDto("系统监控信息","system_monitor_key","systemInfoList"));
		one.getChildren().add(new MenuDto("系统监控日志","system_monitor_key","systemMonitoringLogList"));
		loadMenus.add(one);
		return loadMenus;
	}

}
