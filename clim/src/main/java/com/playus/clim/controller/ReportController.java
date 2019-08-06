package com.playus.clim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playus.clim.service.ReportsService;
import com.playus.clim.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportsService reportsService;
	
	@RequestMapping(value="/QnA", method=RequestMethod.GET)
	public String faq() {
		
		
		return "faq";
		
	}
	
	@RequestMapping(value="/QnA", method=RequestMethod.POST)
	public String faq(Report report) {
		
		reportsService.reportFaq(report);
		
		return "redirect:/QnA";
	}
	
}
