package com.chj.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.chj.core.base.DataGrid;
import com.chj.core.dao.SystemMonitoringLogDao;
import com.chj.core.entity.SystemMonitoringLogEntity;

@Repository
public class SystemMonitoringLogDaoImpl implements SystemMonitoringLogDao {

	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public DataGrid<SystemMonitoringLogEntity> findPage(int nowpage, int rows, SystemMonitoringLogEntity systemMonitoringLog) {
		DataGrid<SystemMonitoringLogEntity> dg = new DataGrid<SystemMonitoringLogEntity>();
		long total = 0l;
		List<SystemMonitoringLogEntity> list = null;
		String dataSql = "select s from SystemMonitoringLogEntity s where s.deleteFlag <> :deleteFlag ";
		String acountSql = "select count(s) from SystemMonitoringLogEntity s where s.deleteFlag <> :deleteFlag ";
		if (!StringUtils.isBlank(systemMonitoringLog.getSystemType())) {
			dataSql += "and lower(s.systemType) = :systemType ";
			acountSql += "and lower(s.systemType) = :systemType ";
		}
		if (!StringUtils.isBlank(systemMonitoringLog.getSystemIp())) {
			dataSql += "and lower(s.systemIp) like :systemIp ";
			acountSql += "and lower(s.systemIp) like :systemIp ";
		}
		dataSql += "order by s.updateDate desc ";
		Query dataQuery = em.createQuery(dataSql).setParameter("deleteFlag", "0");
		Query countQuery = em.createQuery(acountSql).setParameter("deleteFlag", "0");
		if (!StringUtils.isBlank(systemMonitoringLog.getSystemType())) {
			dataQuery.setParameter("systemType", systemMonitoringLog.getSystemType());
			countQuery.setParameter("systemType", systemMonitoringLog.getSystemType());
		}
		if (!StringUtils.isBlank(systemMonitoringLog.getSystemIp())) {
			dataQuery.setParameter("systemIp", "%" + systemMonitoringLog.getSystemIp() + "%");
			countQuery.setParameter("systemIp", "%" + systemMonitoringLog.getSystemIp() + "%");
		}
		list = dataQuery.setFirstResult((nowpage - 1) * rows).setMaxResults(rows).getResultList();
		total = (Long) countQuery.getSingleResult();

		dg.setRows(list);
		dg.setTotal(total);
		return dg;
	}
}
