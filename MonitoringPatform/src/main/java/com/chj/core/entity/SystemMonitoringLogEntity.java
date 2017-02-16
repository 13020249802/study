package com.chj.core.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.chj.core.base.BaseEntity;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@Entity
@Table(name = "T_SYSTEM_MONITORING_LOG")
@JsonInclude(Include.NON_NULL)
public class SystemMonitoringLogEntity extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", nullable = false, unique = true)
	private Integer id;

	@Column(name = "SYSTEM_TYPE", nullable = false, length = 5)
	private String systemType;

	@Column(name = "SYSTEM_INFO", length = 50)
	private String SystemInfo;

	@Column(name = "SYSTEM_IP", length = 20)
	private String systemIp;

	@Column(name = "SYSTEM_URL", length = 500)
	private String monitoringUrl;

	@Column(name = "SYSTEM_STATUS", length = 1)
	private String systemStatus = "1";

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSystemType() {
		return systemType;
	}

	public void setSystemType(String systemType) {
		this.systemType = systemType;
	}

	public String getSystemInfo() {
		return SystemInfo;
	}

	public void setSystemInfo(String systemInfo) {
		SystemInfo = systemInfo;
	}

	public String getSystemIp() {
		return systemIp;
	}

	public void setSystemIp(String systemIp) {
		this.systemIp = systemIp;
	}

	public String getMonitoringUrl() {
		return monitoringUrl;
	}

	public void setMonitoringUrl(String monitoringUrl) {
		this.monitoringUrl = monitoringUrl;
	}

	public String getSystemStatus() {
		return systemStatus;
	}

	public void setSystemStatus(String systemStatus) {
		this.systemStatus = systemStatus;
	}

}
