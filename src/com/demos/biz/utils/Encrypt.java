package com.demos.biz.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypt {
	
	/**
	 * 对inputText字符串加密
	 * 默认采用md5加密
	 * @param inputText
	 * @return
	 */
	public static String e(String inputText) {
		return md5(inputText);
	}

	/**
	 * 采用md5和sha-1算法同时加密inputText
	 * @param inputText
	 * @return
	 */
	public static String md5AndSha(String inputText) {
		return sha(md5(inputText));
	}

	/**
	 * 采用md5加密inputText字符串
	 * @param inputText
	 * @return
	 */
	public static String md5(String inputText) {
		return encrypt(inputText, "md5");
	}

	/**
	 * 采用sha-1加密inputText字符串
	 * @param inputText
	 * @return
	 */
	public static String sha(String inputText) {
		return encrypt(inputText, "sha-1");
	}

	/**
	 * 加密字符串
	 * @param inputText 将要加密的字符串
	 * @param algorithmName 加密算法
	 * @return
	 */
	private static String encrypt(String inputText, String algorithmName) {
		if ((inputText == null) || ("".equals(inputText.trim()))) {
			throw new IllegalArgumentException("place input will encrypt content!");
		}
		if ((algorithmName == null) || ("".equals(algorithmName.trim()))) {
			algorithmName = "md5";
		}
		String encryptText = null;
		try {
			MessageDigest m = MessageDigest.getInstance(algorithmName);
			m.update(inputText.getBytes("UTF8"));
			byte[] s = m.digest();

			return hex(s);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encryptText;
	}

	private static String hex(byte[] arr) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			sb.append(Integer.toHexString(arr[i] & 0xFF | 0x100).substring(1, 3));
		}
		return sb.toString();
	}
	
}