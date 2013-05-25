/**
* @ClassName: FileServiceI
* @Description: 
* @author YuYang
* @date 2013-5-19 下午2:51:15
*/
package com.demos.biz.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.demos.biz.domain.Files;


public interface FileServiceI {

	/**
	 * 
	 * @param contextPath
	 * @param file
	 * @param userId 
	 * @param menuId 
	 * @return
	 */
	String saveFile(String contextPath, MultipartFile file, String oldFileName, String saveFileName);
	
	List<Map<String, String>> getHotIcon(String filePath);

	/**
	 * @param iconNames
	 * @return
	 */
	void deleteHotIcon(String filePath, String iconNames);
	
	List<Files> getList();
    
    void addFile(String realPath, MultipartFile file, Integer menuId);

	void updateFile(String realPath, MultipartFile file, Integer menuId, Integer fileId, String oldFileName);

	void deleteFiles(String ids, String realPath);
}
