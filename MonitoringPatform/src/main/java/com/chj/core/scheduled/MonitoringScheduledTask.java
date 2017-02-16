package com.chj.core.scheduled;

import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.chj.core.entity.SystemInfoEntity;
import com.chj.core.entity.SystemMonitoringLogEntity;
import com.chj.core.repository.SystemInfoEntityRepository;
import com.chj.core.repository.SystemMonitoringLogEntityRepository;
import com.chj.core.utils.UrlUtils;

@Component
public class MonitoringScheduledTask {

	@Autowired
	private SystemInfoEntityRepository systemInfoEntityRepository;
	
	@Autowired
	private SystemMonitoringLogEntityRepository systemMonitoringLogEntityRepository;

	@Scheduled(cron = "0 */1 * * * *")
	public void reportCurrentTimeCron() throws InterruptedException {
		List<SystemInfoEntity> all = systemInfoEntityRepository.findAll();
		for (SystemInfoEntity entity : all) {
			entity.setSystemStatus(UrlUtils.isKeepAlive(entity
					.getMonitoringUrl()));
			entity.setUpdateDate(new Date());
			systemInfoEntityRepository.save(entity);

			SystemMonitoringLogEntity log = new SystemMonitoringLogEntity();
			try {
				BeanUtils.copyProperties(log, entity);
				log.setId(null);
				log.setCreateDate(new Date());
				log.setUpdateDate(new Date());
				systemMonitoringLogEntityRepository.save(log);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
