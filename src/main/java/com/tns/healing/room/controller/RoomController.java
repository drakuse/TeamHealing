package com.tns.healing.room.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/room/*")
public class RoomController {
	
	private ModelAndView mav;


	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String home()
	 * { System.out.println("home 메소드 호출"); return "redirect:/boardList"; // return
	 * "boardForm"; }
	 */

	@RequestMapping(value = "/lodgmentForm", method = RequestMethod.GET)
	public String lodgment() {
		System.out.println("home 메소드 호출");
		return "room/lodgmentForm";
//		return "boardForm"; 
	}
}
