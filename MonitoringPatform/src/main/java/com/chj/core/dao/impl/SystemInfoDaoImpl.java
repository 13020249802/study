package com.chj.core.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.chj.core.base.DataGrid;
import com.chj.core.dao.SystemInfoDao;
import com.chj.core.entity.SystemInfoEntity;

@Repository
public class SystemInfoDaoImpl implements SystemInfoDao {

	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public DataGrid<SystemInfoEntity> findPage(int nowpage, int rows, SystemInfoEntity systemInfo) {
		DataGrid<SystemInfoEntity> dg = new DataGrid<SystemInfoEntity>();
		long total = 0l;
		List<SystemInfoEntity> list = null;
		String dataSql = "select s from SystemInfoEntity s where s.deleteFlag <> :deleteFlag ";
		String acountSql = "select count(s) from SystemInfoEntity s where s.deleteFlag <> :deleteFlag ";
		if (!StringUtils.isBlank(systemInfo.getSystemType())) {
			dataSql += "and lower(s.systemType) = :systemType ";
			acountSql += "and lower(s.systemType) = :systemType ";
		}
		if (!StringUtils.isBlank(systemInfo.getSystemIp())) {
			dataSql += "and lower(s.systemIp) like :systemIp ";
			acountSql += "and lower(s.systemIp) like :systemIp ";
		}
		dataSql += "order by s.createDate desc ";
		Query dataQuery = em.createQuery(dataSql).setParameter("deleteFlag", "0");
		Query countQuery = em.createQuery(acountSql).setParameter("deleteFlag", "0");
		if (!StringUtils.isBlank(systemInfo.getSystemType())) {
			dataQuery.setParameter("systemType", systemInfo.getSystemType());
			countQuery.setParameter("systemType", systemInfo.getSystemType());
		}
		if (!StringUtils.isBlank(systemInfo.getSystemIp())) {
			dataQuery.setParameter("systemIp", "%" + systemInfo.getSystemIp() + "%");
			countQuery.setParameter("systemIp", "%" + systemInfo.getSystemIp() + "%");
		}
		list = dataQuery.setFirstResult((nowpage - 1) * rows).setMaxResults(rows).getResultList();
		total = (Long) countQuery.getSingleResult();

		dg.setRows(list);
		dg.setTotal(total);
		return dg;
	}

}
