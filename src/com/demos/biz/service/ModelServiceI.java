package com.demos.biz.service;

import com.demos.biz.domain.Model;

public interface ModelServiceI {
	Object getMenu();

	Object getModel();

	void addModel(Model model);

	void deleteModel(String modIds);

	void updateModel(Model model);
}
