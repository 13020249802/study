package com.chj.core.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.chj.core.entity.SystemInfoEntity;

@Repository
public interface SystemInfoEntityRepository extends JpaRepository<SystemInfoEntity, Serializable> {

}
