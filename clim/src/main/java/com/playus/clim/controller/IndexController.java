package com.playus.clim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
<<<<<<< HEAD
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		
=======
	
	@RequestMapping(value= {"/", "/index"}, method=RequestMethod.GET)
	public String index() {
>>>>>>> master
		return "index";
	}

}
