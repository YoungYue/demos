/**
* @ClassName: FileServiceImpl
* @Description: 
* @author YuYang
* @date 2013-5-19 下午2:53:52
*/
package com.demos.biz.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.demos.biz.dao.FilesDaoI;
import com.demos.biz.domain.Files;
import com.demos.biz.service.FileServiceI;
import com.demos.biz.utils.MD5Util;

@Component("fileService")
public class FileServiceImpl implements FileServiceI {
	
	private FilesDaoI filesDao;

	@Override
	public String saveFile(String realpath, MultipartFile file, String oldFileName, String saveFileName) {
		String fileName = "";
		try {
			fileName = MD5Util.getFileMD5String(file.getInputStream());
			fileName = fileName + "-" + saveFileName;
			fileName = fileName + "." + file.getOriginalFilename().replace(".", ",").split(",")[1];
			if(fileExists(realpath + fileName)) {
				throw new RuntimeException("文件已经存在！");
			}
			
			deleteFile(realpath + oldFileName.replace("-" + saveFileName, ""));
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realpath + fileName));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return fileName;

	}
	
	@Override
	public List<Map<String, String>> getHotIcon(String filePath) {
		List<Map<String, String>> iconList = new ArrayList<Map<String,String>>();
		Map<String, String> map = null;
		String[] list = (new File(filePath)).list();
		if(list != null && list.length>0) {
			for(String fileName : list) {
				if(fileName.endsWith("Thumbs.db")) {
					continue;
				}
				map = new HashMap<String, String>();
				map.put("iconId", fileName);
				iconList.add(map);
			}
		}
		return iconList;
	}
	
	@Override
	public void deleteHotIcon(String filePath, String iconNames) {
		for(String iconName : iconNames.split(",")) {
			deleteFile(filePath + iconName);
		}
	}
	
	private boolean deleteFile(String fileName) {
		File file = new File(fileName);
		if(file.isFile() && file.exists()) return file.delete();
		return false;
	}
	
	private boolean fileExists(String fileName) {
		File file = new File(fileName);
		if(file.isFile()) return file.exists();
		return false;
	}

	@Override
	public List<Files> getList() {
		return filesDao.getList();
	}

	@Override
	public void addFile(String realPath, MultipartFile file, Integer menuId) {
		String fileName = "";
		String fileRealName = file.getOriginalFilename();
		String fileType = fileRealName.replace(".", ",").split(",")[1];
		try {
			fileName = MD5Util.getFileMD5String(file.getInputStream());
			fileName = fileName + "." + fileType;
			if(fileExists(realPath + fileName)) {
				throw new RuntimeException("文件已经存在！");
			}
			
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath + fileName));
			
			Files f = new Files();
			f.setMenuId(menuId);
			f.setFileName(fileName);
			f.setFileSize((file.getSize()/1024) + "");
			f.setFileRealName(fileRealName);
			f.setFileType(fileType);
			filesDao.add(f);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void updateFile(String realPath, MultipartFile file, Integer menuId, Integer fileId, String oldFileName) {
		String fileName = "";
		String fileRealName = file.getOriginalFilename();
		String fileType = fileRealName.replace(".", ",").split(",")[1];
		try {
			fileName = MD5Util.getFileMD5String(file.getInputStream());
			fileName = fileName + "." + fileType;
			if(fileExists(realPath + fileName)) {
				throw new RuntimeException("文件已经存在！");
			}
			
			deleteFile(realPath + oldFileName);
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realPath + fileName));
			
			Files f = new Files();
			f.setFid(fileId);
			f.setMenuId(menuId);
			f.setFileName(fileName);
			f.setFileSize((file.getSize()/1024) + "");
			f.setFileRealName(fileRealName);
			f.setFileType(fileType);
			filesDao.update(f);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void deleteFiles(String files, String realPath) {
		List<HashMap> list = JSON.parseArray(files, HashMap.class);
		String[] ids = new String[list.size()];
		
		for(int i = 0; i < list.size(); i++){
			Map<String, Object> map = list.get(i);
			ids[i] = map.get("fid").toString();
			
			this.deleteFile(realPath + (String)map.get("fileName"));
		}
		filesDao.delete(ids);
	}

	@Resource(name="filesDao")
	public void setFilesDao(FilesDaoI filesDao) {
		this.filesDao = filesDao;
	}

}
