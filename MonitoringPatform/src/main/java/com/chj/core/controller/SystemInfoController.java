package com.chj.core.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.chj.core.entity.SystemInfoEntity;
import com.chj.core.service.SystemInfoService;

@Controller
public class SystemInfoController {
	final static Logger logger = LoggerFactory
			.getLogger(SystemInfoController.class);

	@Autowired
	private SystemInfoService systemInfoService;

	@RequestMapping(value = "systemInfoList")
	public String systemInfoList(Model model) {
		return "systemInfo/list";
	}

	@RequestMapping(value = "reloadSystemInfoList", method = RequestMethod.POST)
	@ResponseBody
	public DataGrid<SystemInfoEntity> reloadSystemInfoList(
			@RequestParam("page") int nowpage, @RequestParam("rows") int rows,
			@ModelAttribute("systemInfo") SystemInfoEntity systemInfo) {
		DataGrid<SystemInfoEntity> dg = systemInfoService.findPage(nowpage,
				rows, systemInfo);
		return dg;
	}

	@RequestMapping(value = "addSystemInfo", method = RequestMethod.GET)
	public String addSystemInfo(Model model) {
		SystemInfoEntity newSystemInfoEntity = new SystemInfoEntity();
		newSystemInfoEntity.setId(0);
		model.addAttribute("systemInfo", newSystemInfoEntity);
		// 新增字段：上级reportManager，系统所有用户USERNUM与登陆用户REPORTMANAGER匹配
		List<SystemInfoEntity> list = systemInfoService.findAll();
		model.addAttribute("list", list);
		return "systemInfo/edit";
	}

	@RequestMapping(value = "editSystemInfo", method = RequestMethod.GET)
	public String editSystemInfo(@RequestParam("entityId") int entityId,
			Model model) {
		if (entityId == 0)
			return null;
		SystemInfoEntity dbSystemInfoEntity = systemInfoService
				.findUserById(entityId);
		model.addAttribute("systemInfo", dbSystemInfoEntity);
		List<SystemInfoEntity> list = systemInfoService.findAll();
		model.addAttribute("list", list);
		return "systemInfo/edit";
	}

	@RequestMapping(value = "showSystemInfo", method = RequestMethod.GET)
	public String showSystemInfo(@RequestParam("entityId") int entityId,
			Model model) {
		if (entityId == 0)
			return null;
		SystemInfoEntity dbSystemInfoEntity = systemInfoService
				.findUserById(entityId);
		model.addAttribute("systemInfo", dbSystemInfoEntity);
		List<SystemInfoEntity> list = systemInfoService.findAll();
		model.addAttribute("list", list);
		return "systemInfo/edit";
	}

	@RequestMapping(value = "saveSystemInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> saveSystemInfo(
			@ModelAttribute("systemInfoEntity") SystemInfoEntity systemInfo) {
		Map<String, String> map = new HashMap<String, String>();
		systemInfoService.save(systemInfo);
		map.put("mes", "保存成功");
		return map;
	}

	@RequestMapping(value = "deleteSystemInfo", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> deleteSystemInfo(
			@RequestParam("entityId") int entityId) {
		Map<String, String> map = new HashMap<String, String>();
		systemInfoService.deleteSystemInfo(entityId);
		map.put("mes", "删除成功");
		return map;
	}
}
