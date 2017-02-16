package com.chj.core.base;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/**
 * Base DTE
 * 
 * @author Wang Wei
 * @since 1.0
 */

@JsonInclude(Include.NON_NULL)
@MappedSuperclass
public class BaseEntity {

	@Transient
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	// 创建ID
	@Column(name = "CREATE_BY")
	private String createBy;

	// 创建时间
	@Column(name = "CREATE_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createDate = new Date();

	// 更新ID
	@Column(name = "UPDATE_BY")
	private String updateBy;

	// 更新时间
	@Column(name = "UPDATE_DATE")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateDate = new Date();

	// 记录状态 1：有效 0：无效
	@Column(name = "DELETE_FLAG", length = 1)
	private String deleteFlag = "1";

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getCreateDateStr() {
		return this.createDate == null ? "" : sdf.format(this.createDate);
	}

	public String getUpdateDateStr() {
		return this.updateDate == null ? "" : sdf.format(this.updateDate);
	}

}
