package com.chj.core.service;

import java.util.List;

import com.chj.core.base.DataGrid;
import com.chj.core.entity.SystemMonitoringLogEntity;

public interface SystemMonitoringLogService extends BaseService {

	/**
	 * 获取所有系统信息信息
	 * 
	 * @param
	 * @return List<SystemMonitoringLogEntity>
	 */
	public List<SystemMonitoringLogEntity> findAll();

	/**
	 * 保存系统信息
	 * 
	 * @param user
	 * @return SystemMonitoringLogEntity
	 */
	public SystemMonitoringLogEntity save(SystemMonitoringLogEntity entity);

	/**
	 * 根据id查询系统信息
	 * 
	 * @param nowpage
	 * @param rows
	 * @param TeacherEntity
	 * @return
	 */
	public SystemMonitoringLogEntity findUserById(int id);

	/**
	 * 根据id删除信息
	 * 
	 * @param id
	 * @return
	 */
	public void deleteSystemMonitoringLog(int id);

	/**
	 * 分页
	 * 
	 * @param nowpage
	 * @param rows
	 * @param SystemMonitoringLog
	 * @return DataGrid<SystemMonitoringLogEntity>
	 */
	public DataGrid<SystemMonitoringLogEntity> findPage(int nowpage, int rows,
			SystemMonitoringLogEntity systemMonitoringLog);

}