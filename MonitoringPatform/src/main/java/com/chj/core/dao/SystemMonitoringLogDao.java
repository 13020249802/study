package com.chj.core.dao;

import com.chj.core.base.DataGrid;
import com.chj.core.entity.SystemMonitoringLogEntity;

public interface SystemMonitoringLogDao {

	/**
	 * 分页
	 * 
	 * @param nowpage
	 * @param rows
	 * @param SystemInfo
	 * @return DataGrid<SystemInfoEntity>
	 */
	DataGrid<SystemMonitoringLogEntity> findPage(int nowpage, int rows, SystemMonitoringLogEntity SystemMonitoringLog);

}
