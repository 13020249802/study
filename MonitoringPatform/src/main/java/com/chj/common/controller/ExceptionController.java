package com.chj.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorAttributes;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.chj.common.dto.ResponseData;

/**
 * 重写BasicErrorController,主要负责系统的异常页面的处理以及错误信息的显示
 * 
 * @see org.springframework.boot.autoconfigure.web.BasicErrorController
 * @see org.springframework.boot.autoconfigure.web.ErrorMvcAutoConfiguration
 */
@Controller
@RequestMapping(value = "error")
@EnableConfigurationProperties({ ServerProperties.class })
public class ExceptionController implements ErrorController {

	public Logger logger = LoggerFactory.getLogger(this.getClass());

	private ErrorAttributes errorAttributes;

	@Autowired
	private ServerProperties serverProperties;

	/**
	 * 初始化ExceptionController
	 * 
	 * @param errorAttributes
	 */
	@Autowired
	public ExceptionController(ErrorAttributes errorAttributes) {
		Assert.notNull(errorAttributes, "ErrorAttributes must not be null");
		this.errorAttributes = errorAttributes;
	}

	@RequestMapping(value = "404", produces = "text/html")
	public ModelAndView error404(HttpServletRequest request, HttpServletResponse response) {
		response.setStatus(HttpStatus.OK.value());
		return new ModelAndView("common/404");
	}

	@RequestMapping(value = "500", produces = "text/html")
	public ModelAndView error500(HttpServletRequest request, HttpServletResponse response) {
		response.setStatus(HttpStatus.OK.value());
		return new ModelAndView("common/500");
	}

	@RequestMapping(value = "permitionDenied", produces = "text/html")
	public ModelAndView errorPermitionDenied(HttpServletRequest request, HttpServletResponse response) {
		response.setStatus(HttpStatus.OK.value());
		return new ModelAndView("common/permitionDenied");
	}

	/**
	 * 定义404的JSON数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "permitionDenied")
	@ResponseBody
	public ResponseEntity<ResponseData> errorPermitionDenied(HttpServletRequest request) {
		HttpStatus status = getStatus(request);
		return new ResponseEntity<ResponseData>(ResponseData.getErrorResponse("该操作无法通过认证，请联系管理员!"), status);
	}

	/**
	 * 定义404的JSON数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "404")
	@ResponseBody
	public ResponseEntity<ResponseData> error404(HttpServletRequest request) {
		HttpStatus status = getStatus(request);
		return new ResponseEntity<ResponseData>(ResponseData.getErrorResponse("系统错误"), status);
	}

	/**
	 * 定义500的错误JSON信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "500")
	@ResponseBody
	public ResponseEntity<ResponseData> error500(HttpServletRequest request) {
		HttpStatus status = getStatus(request);
		return new ResponseEntity<ResponseData>(ResponseData.getErrorResponse("系统错误"), status);
	}

	/**
	 * 获取错误的信息
	 * 
	 * @param request
	 * @param includeStackTrace
	 * @return
	 */
	private Map<String, Object> getErrorAttributes(HttpServletRequest request, boolean includeStackTrace) {
		RequestAttributes requestAttributes = new ServletRequestAttributes(request);
		return this.errorAttributes.getErrorAttributes(requestAttributes, includeStackTrace);
	}

	/**
	 * 是否包含trace
	 * 
	 * @param request
	 * @return
	 */
	private boolean getTraceParameter(HttpServletRequest request) {
		String parameter = request.getParameter("trace");
		if (parameter == null) {
			return false;
		}
		return !"false".equals(parameter.toLowerCase());
	}

	/**
	 * 获取错误编码
	 * 
	 * @param request
	 * @return
	 */
	private HttpStatus getStatus(HttpServletRequest request) {
		Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
		if (statusCode == null) {
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}
		try {
			return HttpStatus.valueOf(statusCode);
		} catch (Exception ex) {
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}
	}

	/**
	 * 实现错误路径,暂时无用
	 * 
	 * @see ExceptionMvcAutoConfiguration#containerCustomizer()
	 * @return
	 */
	@Override
	public String getErrorPath() {
		return "";
	}

}
