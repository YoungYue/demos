/**
* @ClassName: FileController
* @Description: 
* @author YuYang
* @date 2013-5-19 下午2:49:37
*/
package com.demos.biz.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.demos.biz.domain.Files;
import com.demos.biz.domain.Message;
import com.demos.biz.domain.SystemContext;
import com.demos.biz.domain.User;
import com.demos.biz.service.FileServiceI;

@Controller
@SessionAttributes({"crrUser"})
@RequestMapping("fileController")
public class FileController {
	
	private FileServiceI fileService;

	@RequestMapping("uploadFile")
	public @ResponseBody
	Message uploadFile(@RequestParam("file") MultipartFile file
			, String oldFileName, String userId
			, String saveFileName, HttpSession session) {
		String realPath = session.getServletContext().getRealPath("/resources/userFiles/") + File.separator;
		realPath = realPath + userId + File.separator + saveFileName + File.separator;
		Message message = new Message();
		String fileName = "";
		try {
			fileName = fileService.saveFile(realPath, file, oldFileName, saveFileName);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			message.setInfo(e.getMessage());
		}
		message.setObj(fileName);
		return message;
	}
	@RequestMapping("getHotIcon")
	public @ResponseBody
	List<Map<String, String>> getHotIcon(@ModelAttribute("crrUser") User crrUser, HttpSession session) {
		String filePath = session.getServletContext().getRealPath("/resources/userFiles/"+crrUser.getUserId()+"/hotIcon/") + File.separator;
		List<Map<String, String>> iconList = fileService.getHotIcon(filePath);
		return iconList;
	}
	
	@RequestMapping("deleteHotIcon")
	public @ResponseBody
	Message deleteHotIcon(@ModelAttribute("crrUser") User crrUser, String iconNames, HttpSession session) {
		String filePath = session.getServletContext().getRealPath("/resources/userFiles/"+crrUser.getUserId()+"/hotIcon/") + File.separator;
		Message message = new Message();
		try {
			fileService.deleteHotIcon(filePath, iconNames);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		return message;
	}
	
	@RequestMapping("addFile")
	public @ResponseBody
	Message addFile(@RequestParam("file") MultipartFile file
			, String userId, Integer menuId, HttpSession session) {
		String saveFileName = "resourcesFiles";
		String realPath = session.getServletContext().getRealPath("/resources/userFiles/") + File.separator;
		realPath = realPath + userId + File.separator + saveFileName + File.separator;
		Message message = new Message();
		try {
			fileService.addFile(realPath, file, menuId);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			message.setInfo(e.getMessage());
			e.printStackTrace();
		}
		return message;
	}
	@RequestMapping("updateFile")
	public @ResponseBody
	Message updateFile(@RequestParam("file") MultipartFile file
			, String userId, Integer menuId, HttpSession session
			, Integer fileId, String oldFile) {
		String saveFileName = "resourcesFiles";
		String realPath = session.getServletContext().getRealPath("/resources/userFiles/") + File.separator;
		realPath = realPath + userId + File.separator + saveFileName + File.separator;
		Message message = new Message();
		try {
			fileService.updateFile(realPath, file, menuId, fileId, oldFile);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			message.setInfo(e.getMessage());
			e.printStackTrace();
		}
		return message;
	}
	@RequestMapping("getList")
	public @ResponseBody
	List<Files> getList(Integer menuId) {
		SystemContext.setMenuId(menuId);
		return fileService.getList();
	}
	@RequestMapping("deleteFile")
	public @ResponseBody
	Message deleteFile(@ModelAttribute("crrUser") User crrUser, String files, HttpSession session) {
		String saveFileName = "resourcesFiles";
		String realPath = session.getServletContext().getRealPath("/resources/userFiles/") + File.separator;
		realPath = realPath + crrUser.getUserId() + File.separator + saveFileName + File.separator;
		
		Message message = new Message();
		
		try {
			fileService.deleteFiles(files, realPath);
		} catch (Exception e) {
			message.setSuccessIsFalse();
			e.printStackTrace();
		}
		
		return message;
	}

	@Resource(name="fileService")
	public void setFileService(FileServiceI fileService) {
		this.fileService = fileService;
	}
	
}
