package com.demos.biz.mapper;

import java.util.List;

import com.demos.biz.domain.Files;

public interface FilesMapper {
	List<Files> getList(Integer menuId);
    
    int getTotal();
    
    void addFile(Files file);

	void updateFile(Files file);

	void deleteFile(String[] fileIdArr);
}