package com.chj.common.util;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Json Utils
 * 
 * @author Wang Wei
 * @since 1.0
 * @see JsonUtils
 */
public class JsonUtils {
	private static boolean isPretty = false;
	private static ObjectMapper mapper;

	public static boolean isPretty() {
		return isPretty;
	}

	/**
	 * 获取ObjectMapper实例
	 * 
	 * @param createNew
	 *            方式：true，新实例；false,存在的mapper实例
	 * @return
	 */
	public static synchronized ObjectMapper getMapperInstance(boolean createNew) {
		if (createNew) {
			return new ObjectMapper();
		} else if (mapper == null) {
			mapper = new ObjectMapper();
		}
		return mapper;
	}

	/**
	 * 将java对象转换成json字符串
	 * 
	 * @param Object
	 * @return
	 * @throws BaseException
	 */
	public static String beanToJsonString(Object object) {

		try {
			return beanToJsonString(object, true, false);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 将java对象转换成json字符串
	 * 
	 * @param Object
	 * @param isNotNull
	 * @return
	 * @throws BaseException
	 */
	public static String beanToJsonString(Object object, boolean isNotNull) {
		return beanToJsonString(object, isNotNull, false);
	}

	/**
	 * 将java对象转换成json字符串
	 * 
	 * @param Object
	 * @param isNotNull
	 * @param createNew
	 *            ObjectMapper实例方式:true，新实例;false,存在的mapper实例
	 * @return
	 * @throws BaseException
	 */
	public static String beanToJsonString(Object object, boolean isNotNull, boolean createNew) {

		String jsonString = null;

		try {
			ObjectMapper objectMapper = getMapperInstance(createNew);

			if (isNotNull)
				objectMapper.setSerializationInclusion(Include.NON_NULL);

			if (isPretty) {
				jsonString = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(object);
			} else {
				jsonString = objectMapper.writeValueAsString(object);
			}
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonString;
	}

	/**
	 * 将json字符串转换成java对象
	 * 
	 * @param json
	 *            准备转换的json字符串
	 * @param cls
	 *            准备转换的类
	 * @return
	 * @throws BaseException
	 */
	public static Object jsonStringToBean(String json, Class<?> cls) {
		try {
			return jsonStringToBean(json, cls, false);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * 将json字符串转换成java对象
	 * 
	 * @param json准备转换的json字符串
	 * @param field
	 * @param cls准备转换的类
	 * @return
	 * @throws BaseException
	 */
	public static Object jsonArrayToBean(String json, String field, Class<?> cls) {
		try {
			String vjson = "{\"" + field + "\":" + json + "}";
			return jsonStringToBean(vjson, cls, false);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * 将json字符串转换成java对象
	 * 
	 * @param json
	 *            准备转换的json字符串
	 * @param cls
	 *            准备转换的类
	 * @param createNew
	 *            ObjectMapper实例方式:true，新实例;false,存在的mapper实例
	 * @return
	 * @throws BaseException
	 */
	public static Object jsonStringToBean(String json, Class<?> cls, Boolean createNew) {

		try {
			ObjectMapper objectMapper = getMapperInstance(createNew);
			return objectMapper.readValue(json, cls);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * 将json字符串转换成java List对象
	 * 
	 * @param json
	 *            准备转换的json字符串
	 * @param cls
	 *            准备转换的类
	 * @param createNew
	 *            ObjectMapper实例方式:true，新实例;false,存在的mapper实例
	 * @return
	 * @throws BaseException
	 */
	public static Object jsonStringToBeanList(String json, Class<?> cls, Boolean createNew) {

		try {
			ObjectMapper objectMapper = getMapperInstance(createNew);
			// 专门创建bean的集合类类型供json转换
			JavaType javaType = getCollectionType(objectMapper, ArrayList.class, cls);
			return objectMapper.readValue(json, javaType);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * 获取泛型的Collection Type
	 * 
	 * @param objectMapper
	 *            ObjectMapper
	 * @param collectionClass
	 *            泛型的Collection
	 * @param elementClasses
	 *            元素类
	 * @return JavaType Java类型
	 */
	public static JavaType getCollectionType(ObjectMapper objectMapper, Class<?> collectionClass, Class<?>... elementClasses) {
		return objectMapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
	}

	/**
	 * 将json字符串转换成java List对象
	 * 
	 * @param json
	 *            准备转换的json字符串
	 * @param cls
	 *            准备转换的类
	 * @param createNew
	 *            ObjectMapper实例方式:true，新实例;false,存在的mapper实例
	 * @return
	 * @throws BaseException
	 */
	public static Object jsonStringToBeanList(String json, Class<?> cls) {

		try {
			return jsonStringToBeanList(json, cls, false);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
