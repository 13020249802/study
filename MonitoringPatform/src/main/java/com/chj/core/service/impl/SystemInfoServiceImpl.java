package com.chj.core.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chj.core.base.DataGrid;
import com.chj.core.dao.SystemInfoDao;
import com.chj.core.entity.SystemInfoEntity;
import com.chj.core.repository.SystemInfoEntityRepository;
import com.chj.core.service.SystemInfoService;

@Service
public class SystemInfoServiceImpl extends BaseAbstractService implements
		SystemInfoService {

	@Autowired
	private SystemInfoDao systemInfoDao;

	@Autowired
	private SystemInfoEntityRepository systemInfoRepository;

	public List<SystemInfoEntity> findAll() {
		return systemInfoRepository.findAll();
	}

	@Override
	public SystemInfoEntity save(SystemInfoEntity entity) {
		if (entity.getId() == null || entity.getId() == 0) {
			entity.setCreateDate(new Date());
		} else {
			SystemInfoEntity dbEntity = findUserById(entity.getId());
			entity.setCreateDate(dbEntity.getCreateDate());
		}
		entity.setUpdateDate(new Date());
		return systemInfoRepository.save(entity);
	}

	@Override
	public SystemInfoEntity findUserById(int id) {
		return systemInfoRepository.findOne(id);
	}

	@Override
	public void deleteSystemInfo(int id) {
		systemInfoRepository.delete(id);
	}

	@Override
	public DataGrid<SystemInfoEntity> findPage(int nowpage, int rows,
			SystemInfoEntity SystemInfo) {
		return systemInfoDao.findPage(nowpage, rows, SystemInfo);
	}

}
