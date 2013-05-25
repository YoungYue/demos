var yy = {};
yy.upFile = {};

yy.getProjectName = function() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
};

$.extend($.fn.validatebox.defaults.rules, {
	eqPassword : {/* 扩展验证两次密码 */
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '密码不一致！'
	},
	isNumber : {
		validator : function(value, param) {
			var reg = new RegExp("^[0-9]*$");
			return reg.test(value);
		},
		message : '该项只能为数字！'
	}
});

/**
 * 增加formatString功能
 * 
 * 使用方法：sy.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 */
formatString = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

/**
 * @author 夏悸
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展tree，使其支持平滑数据格式
 */
$.fn.tree.defaults.loadFilter = function(data, parent) {
	var opt = $(this).data().tree.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};
/**
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展treegrid，使其支持平滑数据格式
 */
$.fn.treegrid.defaults.loadFilter = function(data, parentId) {
	var opt = $(this).data().treegrid.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};
/**
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展combotree，使其支持平滑数据格式
 */
$.fn.combotree.defaults.loadFilter = $.fn.tree.defaults.loadFilter;

/**
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
	var t = top;
	if (l < 1) {
		l = 1;
	}
	if (t < 1) {
		t = 1;
	}
	var width = parseInt($(this).parent().css('width')) + 14;
	var height = parseInt($(this).parent().css('height')) + 14;
	var right = l + width;
	var buttom = t + height;
	var browserWidth = $(window).width();
	var browserHeight = $(window).height();
	if (right > browserWidth) {
		l = browserWidth - width;
	}
	if (buttom > browserHeight) {
		t = browserHeight - height;
	}
	$(this).parent().css({/* 修正面板位置 */
		left : l,
		top : t
	});
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;

/**
 * @author 孙宇
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

stringToList = function(value) {

	if (isArray(value)) {
		return value;
	}

	if (value) {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

// 判断是否是数组的函数
var isArray = function(obj) {
	return obj && !(obj.propertyIsEnumerable('length')) && typeof obj === 'object' && typeof obj.length === 'number';
};

var treeMenuData;

jQuery.extend({
	/**
	 * @see 将javascript数据类型转换为json字符串
	 * @param 待转换对象,支持
	 *            object,array,string,function,number,boolean,regexp
	 * @return 返回json字符串
	 */
	toJSON : function(object) {
		var type = typeof object;
		if ('object' == type) {
			if (Array == object.constructor)
				type = 'array';
			else if (RegExp == object.constructor)
				type = 'regexp';
			else
				type = 'object';
		}
		switch (type) {
		case 'undefined':
		case 'unknown':
			return;
		case 'function':
		case 'boolean':
		case 'regexp':
			return object.toString();
		case 'number':
			return isFinite(object) ? object.toString() : 'null';
		case 'string':
			return '"' + object.replace(/(|")/g, "$1").replace(/n|r|t/g, function() {
				var a = arguments[0];
				return (a == 'n') ? 'n' : (a == 'r') ? 'r' : (a == 't') ? 't' : "";
			}) + '"';
		case 'object':
			if (object === null)
				return 'null';
			var results = [];
			for ( var property in object) {
				var value = jQuery.toJSON(object[property]);
				if (value !== undefined)
					results.push(jQuery.toJSON(property) + ':' + value);
			}
			return '{' + results.join(',') + '}';
		case 'array':
			var results = [];
			for ( var i = 0; i < object.length; i++) {
				var value = jQuery.toJSON(object[i]);
				if (value !== undefined)
					results.push(value);
			}
			return '[' + results.join(',') + ']';
		}
	}
});

/**
 * author ____′↘夏悸 create date 2012-11-5
 */
$.extend($.fn.datagrid.methods, {
	autoMergeCells : function(jq, fields) {
		return jq.each(function() {
			var target = $(this);
			if (!fields) {
				fields = target.datagrid("getColumnFields");
			}
			var rows = target.datagrid("getRows");
			var i = 0, j = 0, temp = {};
			for (i; i < rows.length; i++) {
				var row = rows[i];
				j = 0;
				for (j; j < fields.length; j++) {
					var field = fields[j];
					var tf = temp[field];
					if (!tf) {
						tf = temp[field] = {};
						tf[row[field]] = [ i ];
					} else {
						var tfv = tf[row[field]];
						if (tfv) {
							tfv.push(i);
						} else {
							tfv = tf[row[field]] = [ i ];
						}
					}
				}
			}
			$.each(temp, function(field, colunm) {
				$.each(colunm, function() {
					var group = this;

					if (group.length > 1) {
						var before, after, megerIndex = group[0];
						for ( var i = 0; i < group.length; i++) {
							before = group[i];
							after = group[i + 1];
							if (after && (after - before) == 1) {
								continue;
							}
							var rowspan = before - megerIndex + 1;
							if (rowspan > 1) {
								target.datagrid('mergeCells', {
									index : megerIndex,
									field : field,
									rowspan : rowspan
								});
							}
							if (after && (after - before) != 1) {
								megerIndex = after;
							}
						}
					}
				});
			});
		});
	}
});

/**
 * 验证图片大小及格式
 * 
 * @param this_
 * @returns {Boolean}
 */
function checkImgType(this_) {

	var filepath = $(this_).val();
	var extStart = filepath.lastIndexOf(".");

	var ext = filepath.substring(extStart, filepath.length).toUpperCase();

	if (ext != ".JPG") {
		$.messager.show({
			title : '提示',
			msg : '图片只能是JPG格式！'
		});

		$(this_).focus();
		if ($.browser.msie) { // 判断浏览器
			this_.select();
			document.execCommand("delete");
		} else {
			$(this_).val("");
		}
		return false;
	}

	var file_size = 0;
	if ($.browser.msie) {
		var img = new Image();
		img.src = filepath;
		console.info(img.fileSize);
		file_size = img.fileSize / 1024;
		console.info(file_size);
		if (img.fileSize > 0) {
			if (file_size > 45) {
				$.messager.show({
					title : '提示',
					msg : '图片大小不能超过45KB！'
				});
				$(this_).focus();
				this_.select();
				document.execCommand("delete");
				return false;
			}
		}
	} else {
		file_size = this_.files[0].size / 1024;
		var size = file_size;
		console.info(size);
		if (size > 45) {
			$.messager.show({
				title : '提示',
				msg : '图片大小不能超过45KB！'
			});
			$(this_).focus();
			$(this_).val("");
			return false;
		}
	}
	return true;
}

$.extend($.fn.validatebox.defaults.rules, {
	checkSup : {/* 扩展验证用户上级 */
		validator : function(value, param) {
			var userId = $('#moduls_fun_addDeterPerson_userId').combogrid('getValue');
			var supId = $('#moduls_fun_addDeterPerson_personSup').combogrid('getValue');
			return supId != userId;
		},
		message : '测评者上级不能是本人！'
	},
	checkSub : {/* 扩展验证用户下级 */
		validator : function(value, param) {
			var userId = $('#moduls_fun_addDeterPerson_userId').combogrid('getValue');
			var supId = $('#moduls_fun_addDeterPerson_personSup').combogrid('getValue');
			var subId = $('#moduls_fun_addDeterPerson_personSub').combogrid('getValue');
			return userId != subId && supId != subId;
		},
		message : '下级不能是本人或与上级相同！'
	},
	perExist : {/* 扩展验证测评者是否存在 */
		validator : function(value, param) {
			var falg = true;
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/deterPersonAction!perExist.action',
				data : {
					userId : $('#moduls_fun_addDeterPerson_userId').combogrid('getValue')
				},
				cache : false,
				async : false,
				dataType : 'JSON',
				success : function(r) {
					if (r.success) {
						falg = false;
					}
				}
			});

			return falg;
		},
		message : '该测评者已经存在！'
	},
	userExist : {/* 扩展验证用户是否存在 */
		validator : function(value, param) {
			var falg = true;
			$.ajax({
				type : 'POST',
				url : 'userController/userExist.do',
				data : {
					username : value
				},
				cache : false,
				async : false,
				dataType : 'JSON',
				success : function(r) {
					if (r.success) {
						falg = false;
					}
				}
			});

			return falg;
		},
		message : '该用户已经存在！'
	}
});