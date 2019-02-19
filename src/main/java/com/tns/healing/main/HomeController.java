package com.tns.healing.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("home 메소드 호출");
		return "home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String main() {
		System.out.println("home 메소드 호출");
		return "home";
	}

	@RequestMapping(value = "/lodgmentForm", method = RequestMethod.GET)
	public String lodgment() {
		System.out.println("home 메소드 호출");
		return "room/lodgmentForm";
	}

}