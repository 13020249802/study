package com.chj.core.utils;

import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UrlUtils {

	public static Logger logger = LoggerFactory.getLogger(UrlUtils.class);

	public static String isKeepAlive(String urlStr) {
		int state = -1;
		int counts = 0;
		if (urlStr == null || urlStr.length() <= 0) {
			return "0";
		}
		while (counts < 5) {
			try {
				URL url = new URL(urlStr);
				HttpURLConnection con = (HttpURLConnection) url
						.openConnection();
				state = con.getResponseCode();
				System.out.println(counts + "= " + state);
				if (state == 200) {
					logger.info("URL {} is keep alive!!!", urlStr);
					return "1";
				}
			} catch (Exception ex) {
				counts++;
				urlStr = null;
				continue;
			}
		}
		logger.info("URL {} is not keep alive!!!", urlStr);
		return "0";
	}
}
