package com.demos.biz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.demos.biz.dao.ModelDaoI;
import com.demos.biz.domain.Model;
import com.demos.biz.service.ModelServiceI;

@Component("modelService")
public class ModelServiceImpl implements ModelServiceI {
	
	private ModelDaoI modelDao;

	public Object getMenu() {
		List<Model> list = modelDao.getList();
		List<Object> json = new ArrayList<Object>(); 
		for(Model model : list) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", model.getModId());
			map.put("text", model.getModName());
			map.put("pid", model.getParMod());
			String url = model.getModUrl();
			if(url != null) {
				Map<String, String> attributes = new HashMap<String, String>();
				attributes.put("url", model.getModUrl());
				map.put("attributes", attributes);
			} else {
				map.put("attributes", "");
			}
			json.add(map);
		}
		
		return json;
	}

	public ModelDaoI getModelDao() {
		return modelDao;
	}

	@Resource(name="modelDao")
	public void setModelDao(ModelDaoI modelDao) {
		this.modelDao = modelDao;
	}

	@Override
	public Object getModel() {
		List<Model> list = modelDao.getList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		List<Object> rows = new ArrayList<Object>();
		for(Model model : list) {
			Map<String, Object> row = new HashMap<String, Object>();
			row.put("id", model.getModId());
			row.put("text", model.getModName());
			row.put("modDes", model.getModDes());
			row.put("pid", model.getParMod());
			row.put("modCode", model.getModCode());
			row.put("modUrl", model.getModUrl());
			rows.add(row);
		}
		
		map.put("rows", rows);
		
		return rows;
	}

	@Override
	public void addModel(Model model) {
		this.modelDao.add(model);
		
	}

	@Override
	public void deleteModel(String modIds) {
		this.modelDao.delete(modIds.split(","));
	}

	@Override
	public void updateModel(Model model) {
		this.modelDao.update(model);
	}

}
