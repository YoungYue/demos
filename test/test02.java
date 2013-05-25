import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

/**
 * @ClassName: test02
 * @Description: 
 * @author YuYang
 * @date 2013-5-19 下午1:40:46
 */

public class test02 {
	public static void main(String[] args) {
		/*String path = "E:\\Study\\workspace\\apache-tomcat-7.0.32\\webapps\\demos\\resources\\userFiles\\4\\hotIcon\\";
		String[] list = (new File(path)).list();
		if(list != null && list.length>0) {
			for(String fileName : list) {
				System.out.println(fileName);
			}
		}*/
		/*List<Object> list = new ArrayList<Object>();
		Map<String, String> map = null;
		for(int i = 0; i < 10; i++) {
			map = new HashMap<String, String>();
			map.put("key", i+"");
			list.add(map);
		}
		
		String jsonStr = JSON.toJSONString(list);
		System.out.println(jsonStr);*/
		
		/*String files = "[{\"fid\":1,\"fileName\":\"b7d2f5bcf22a6dc03902b563b6ab1db7.jpg\"},{\"fid\":2,\"fileName\":\"e3d399c8532696ceca30e3d1af71c226.jpg\"}]";
		System.out.println(files);
		List<HashMap> list = JSON.parseArray(files, HashMap.class);
		for(Map<String, Object> map : list ){
			System.out.println(map.get("fid").toString());
			System.out.println(map.get("fileName"));
		}*/
		
		String[] s = new String[4];
		s[0] = "aa";
		s[1] = "bb";
		s[2] = "cc";
		s[3] = "dd";
		String a = s.toString();
		System.out.println(a);
	}
}
