package com.chj.core.service;

import java.util.List;

import com.chj.core.base.DataGrid;
import com.chj.core.entity.SystemInfoEntity;

public interface SystemInfoService extends BaseService {

	/**
	 * 获取所有系统信息信息
	 * 
	 * @param
	 * @return List<SystemInfoEntity>
	 */
	public List<SystemInfoEntity> findAll();

	/**
	 * 保存系统信息
	 * 
	 * @param user
	 * @return SystemInfoEntity
	 */
	public SystemInfoEntity save(SystemInfoEntity entity);

	/**
	 * 根据id查询系统信息
	 * 
	 * @param nowpage
	 * @param rows
	 * @param TeacherEntity
	 * @return
	 */
	public SystemInfoEntity findUserById(int id);

	/**
	 * 根据id删除信息
	 * 
	 * @param id
	 * @return
	 */
	public void deleteSystemInfo(int id);

	/**
	 * 分页
	 * 
	 * @param nowpage
	 * @param rows
	 * @param SystemInfo
	 * @return DataGrid<SystemInfoEntity>
	 */
	public DataGrid<SystemInfoEntity> findPage(int nowpage, int rows,
			SystemInfoEntity SystemInfo);

}