package com.chj.core.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chj.core.base.DataGrid;
import com.chj.core.dao.SystemMonitoringLogDao;
import com.chj.core.entity.SystemMonitoringLogEntity;
import com.chj.core.repository.SystemMonitoringLogEntityRepository;
import com.chj.core.service.SystemMonitoringLogService;

@Service
public class SystemMonitoringLogServiceImpl extends BaseAbstractService
		implements SystemMonitoringLogService {

	@Autowired
	private SystemMonitoringLogDao systemMonitoringLogDao;

	@Autowired
	private SystemMonitoringLogEntityRepository systemMonitoringLogRepository;

	public List<SystemMonitoringLogEntity> findAll() {
		return systemMonitoringLogRepository.findAll();
	}

	@Override
	public SystemMonitoringLogEntity save(SystemMonitoringLogEntity entity) {
		if (entity.getId() == null || entity.getId() == 0) {
			entity.setCreateDate(new Date());
		} else {
			SystemMonitoringLogEntity dbEntity = findUserById(entity.getId());
			entity.setCreateDate(dbEntity.getCreateDate());
		}
		entity.setUpdateDate(new Date());
		return systemMonitoringLogRepository.save(entity);
	}

	@Override
	public SystemMonitoringLogEntity findUserById(int id) {
		return systemMonitoringLogRepository.findOne(id);
	}

	@Override
	public void deleteSystemMonitoringLog(int id) {
		systemMonitoringLogRepository.delete(id);
	}

	@Override
	public DataGrid<SystemMonitoringLogEntity> findPage(int nowpage, int rows,
			SystemMonitoringLogEntity systemMonitoringLog) {
		return systemMonitoringLogDao.findPage(nowpage, rows,
				systemMonitoringLog);
	}

}
