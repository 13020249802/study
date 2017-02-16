package com.chj.core.dao;

import com.chj.core.base.DataGrid;
import com.chj.core.entity.SystemInfoEntity;

public interface SystemInfoDao {

	/**
	 * 分页
	 * 
	 * @param nowpage
	 * @param rows
	 * @param SystemInfo
	 * @return DataGrid<SystemInfoEntity>
	 */
	DataGrid<SystemInfoEntity> findPage(int nowpage, int rows,
			SystemInfoEntity SystemInfo);

}
