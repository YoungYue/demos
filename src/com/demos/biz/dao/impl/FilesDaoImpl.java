/**
* @ClassName: FilesDaoImpl
* @Description: 
* @author YuYang
* @date 2013-5-20 下午10:12:43
*/
package com.demos.biz.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.FilesDaoI;
import com.demos.biz.domain.Files;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.mapper.FilesMapper;

@Component("filesDao")
public class FilesDaoImpl implements FilesDaoI {

	private FilesMapper fileMapper;
	
	@Override
	public void add(Files t) {
		fileMapper.addFile(t);
	}

	@Override
	public void delete(String[] idArray) {
		fileMapper.deleteFile(idArray);
	}

	@Override
	public void update(Files t) {
		fileMapper.updateFile(t);
	}

	@Override
	public List<Files> getList() {
		return fileMapper.getList(SystemContext.getMenuId());
	}

	@Override
	public int getTotal() {
		return 0;
	}

	@Resource
	public void setFileMapper(FilesMapper fileMapper) {
		this.fileMapper = fileMapper;
	}

}
