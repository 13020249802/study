package com.chj.core.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chj.core.base.DataGrid;
import com.chj.core.entity.SystemMonitoringLogEntity;
import com.chj.core.service.SystemMonitoringLogService;

@Controller
public class SystemMonitoringLogController {
	final static Logger logger = LoggerFactory
			.getLogger(SystemMonitoringLogController.class);

	@Autowired
	private SystemMonitoringLogService systemMonitoringLogService;

	@RequestMapping(value = "systemMonitoringLogList")
	public String systemMonitoringLogList(Model model) {
		return "systemMonitoringLog/list";
	}

	@RequestMapping(value = "reloadSystemMonitoringLogList", method = RequestMethod.POST)
	@ResponseBody
	public DataGrid<SystemMonitoringLogEntity> reloadSystemMonitoringLogList(
			@RequestParam("page") int nowpage,
			@RequestParam("rows") int rows,
			@ModelAttribute("systemMonitoringLog") SystemMonitoringLogEntity systemMonitoringLog) {
		DataGrid<SystemMonitoringLogEntity> dg = systemMonitoringLogService
				.findPage(nowpage, rows, systemMonitoringLog);
		return dg;
	}

	@RequestMapping(value = "showSystemMonitoringLog", method = RequestMethod.GET)
	public String showSystemMonitoringLog(
			@RequestParam("entityId") int entityId, Model model) {
		if (entityId == 0)
			return null;
		SystemMonitoringLogEntity dbSystemMonitoringLogEntity = systemMonitoringLogService
				.findUserById(entityId);
		model.addAttribute("systemMonitoringLog", dbSystemMonitoringLogEntity);
		List<SystemMonitoringLogEntity> list = systemMonitoringLogService
				.findAll();
		model.addAttribute("list", list);
		return "systemMonitoringLog/edit";
	}

}
