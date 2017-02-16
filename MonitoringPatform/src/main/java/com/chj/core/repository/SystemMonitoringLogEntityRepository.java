package com.chj.core.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.chj.core.entity.SystemMonitoringLogEntity;

@Repository
public interface SystemMonitoringLogEntityRepository extends JpaRepository<SystemMonitoringLogEntity, Serializable> {


}
