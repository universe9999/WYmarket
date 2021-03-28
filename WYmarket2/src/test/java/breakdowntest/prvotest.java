package breakdowntest;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;



import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})

@Log4j
public class prvotest {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext context;
	private MockMvc mockMvc;

	@Before
	public void testInit() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void receiptSuccess() throws Exception {
		ModelAndView mnv =  mockMvc.perform(
				MockMvcRequestBuilders.get("/param/purchase")
				.param("itemid", "1")
				.param("usernick", "승환")
				.param("address", "ab")
				.param("ititle", "경기도")
				.param("price", "100")
				
				)			
		.andReturn()
		.getModelAndView();		
		log.info("실려있는 어트리뷰트: " + mnv.getModel().get("phvo"));
		log.info("뷰의 경로: " + mnv.getViewName());
	}	
	
}
