package com.chj.common.dto;

import java.io.Serializable;

public class ResponseData implements Serializable {

	private static final long serialVersionUID = 1L;

	public static final String RESPONSE_SUCCESS = "success";
	public static final String RESPONSE_WARN = "warn";
	public static final String RESPONSE_ERROR = "error";

	private String response;
	private String respMsg;
	private Object data;

	public ResponseData() {
	}

	public ResponseData(String response, String respMsg) {
		this.response = response;
		this.respMsg = respMsg;
	}

	public ResponseData(String response) {
		this.response = response;
	}

	public String getResponse() {
		return response;
	}

	public String getRespMsg() {
		return respMsg;
	}

	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public static ResponseData getResponseData(String response, String respMsg) {
		ResponseData restResponse = new ResponseData();
		restResponse.setResponse(response);
		restResponse.setRespMsg(respMsg);
		return restResponse;
	}

	public static ResponseData getResponseData(String response, Object data) {
		ResponseData restResponse = new ResponseData();
		restResponse.setResponse(response);
		restResponse.setData(data);
		return restResponse;
	}

	public static ResponseData getResponseData(String response, String respMsg, Object data) {
		ResponseData restResponse = new ResponseData();
		restResponse.setResponse(response);
		restResponse.setRespMsg(respMsg);
		restResponse.setData(data);
		return restResponse;
	}

	public static ResponseData getErrorResponse(String respMsg) {
		return getResponseData(RESPONSE_ERROR, respMsg);
	}

	public static ResponseData getSuccessResponse(Object data) {
		return getResponseData(RESPONSE_SUCCESS, data);
	}
}
