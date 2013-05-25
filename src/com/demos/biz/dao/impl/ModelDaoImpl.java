package com.demos.biz.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.ModelDaoI;
import com.demos.biz.domain.Model;
import com.demos.biz.mapper.ModelMapper;

@Component("modelDao")
public class ModelDaoImpl implements ModelDaoI {

	private ModelMapper modelMapper;

	public List<Model> getList() {
		return modelMapper.getList();
	}

	public ModelMapper getModelMapper() {
		return modelMapper;
	}

	@Resource
	public void setModelMapper(ModelMapper modelMapper) {
		this.modelMapper = modelMapper;
	}

	@Override
	public void add(Model t) {
		this.modelMapper.addModel(t);

	}

	@Override
	public void delete(String[] idArray) {
		this.modelMapper.deleteModel(idArray);
	}

	@Override
	public void update(Model t) {
		this.modelMapper.updateModel(t);

	}

	@Override
	public int getTotal() {
		return 0;
	}

}
