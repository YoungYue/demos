import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.demos.biz.domain.Message;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml", "classpath:spring-mybatis.xml"})
public class Test01 {
	
	private Message message1;
	private Message message2;

	@Test
	public void test() {
		System.out.println(message1);
		System.out.println(message1);
		System.out.println(message2);
		System.out.println(message2);
	}

	public Message getMessage1() {
		return message1;
	}

	@Resource(name="message")
	public void setMessage1(Message message1) {
		this.message1 = message1;
	}

	public Message getMessage2() {
		return message2;
	}

	@Resource(name="message")
	public void setMessage2(Message message2) {
		this.message2 = message2;
	}
	
	

}
