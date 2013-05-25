package com.demos.biz.mapper;

import java.util.List;

import com.demos.biz.domain.Model;

public interface ModelMapper {
	List<Model> getList();

	void addModel(Model model);
	
	void updateModel(Model model);

	void deleteModel(String[] idArray);
}