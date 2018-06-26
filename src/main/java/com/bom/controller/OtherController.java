package com.bom.controller;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 */
@Controller
public class OtherController {
	private static final Logger logger = LoggerFactory.getLogger(OtherController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="deli.do", method=RequestMethod.GET)
	public String delicious(Model model) {
		return "delicious/Delicious_info";
	}

}
