package com.login.bycript.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.login.bycript.bean.UserBean;
import com.login.bycript.modal.User;
import com.login.bycript.service.EmailService;
import com.login.bycript.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	EmailService emailService;

	
	public static final String path = "user";

	private static final String PARAM_ID = "id";
	
	@RequestMapping("/")
	public String ShowHomePageLogin(HttpServletRequest httpServletRequest,Model model){
		return path + "/" +"index";
	}

	@RequestMapping("/login")
	public String ShowHomeLogin(HttpServletRequest httpServletRequest,Model model){
		return path + "/" +"login";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String ShowRegister(HttpServletRequest httpServletRequest,Model model){
		return path + "/" +"register";
	}
	
	@RequestMapping(value="/forgot-pass", method=RequestMethod.GET)
	public String ShowForgotPassword(HttpServletRequest httpServletRequest,Model model){
		return path + "/" +"forgotPassword";
	}
	

	@RequestMapping(value="/successLogin", method=RequestMethod.GET)
	public String ShowSuccessLogin(HttpServletRequest httpServletRequest,Model model){
		return path + "/" +"successPage";
	}
	
	@RequestMapping("/listUserLogin")
	public String ShowHomePageList(HttpServletRequest httpServletRequest,Model model){
		List<User>listUser = userService.findAll();
		model.addAttribute("listUser",listUser);
		return path + "/" +"listUser";
	}
	
	@RequestMapping(value="/listUserRegister", method=RequestMethod.GET)
	public String ShowHomePageListUser(HttpServletRequest httpServletRequest,Model model){
		List<User>listUser = userService.findAll();
		model.addAttribute("listUser",listUser);
		return path + "/" +"listUserLogin";
	}
	
	@RequestMapping(value="/reset/password/{id}", method=RequestMethod.GET)
	public String ShowEditCustomer(HttpServletRequest httpServletRequest,Model model,final @PathVariable(PARAM_ID) long id){
		User user = userService.findId(id);
		model.addAttribute("user",user);
		return path + "/" +"edit-user-login";
	}
	
	@RequestMapping(value="/successUpdatePass", method=RequestMethod.GET)
	public String ShowSuccessUpdatePassword(HttpServletRequest httpServletRequest,Model model){
		return path + "/" +"successUpdate";
	}
	
	@RequestMapping(value="/reset/password/user/{id}", method=RequestMethod.POST)
	public String EditCustomer(HttpServletRequest httpServletRequest,Model model,final @PathVariable(PARAM_ID) long id,@Valid UserBean params,RedirectAttributes redirectAttrs){
		
		if(!params.getPassword().equals(params.getConfirmPassword())){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "password not correct");
			return "redirect:" + "/reset/password/"+id;
		}
		
		User user = userService.updateUser(id,params); 
		redirectAttrs.addFlashAttribute("message" , "Reset Password success");
		redirectAttrs.addFlashAttribute("user" , user);
		return "redirect:" + "/successUpdatePass";
	}
	
	@RequestMapping(value="/login/signin", method=RequestMethod.POST)
	public String AddNew(HttpServletRequest httpServletRequest,Model model,final @Valid UserBean params,RedirectAttributes redirectAttrs)throws Exception{
		redirectAttrs.addFlashAttribute("register" , params);
		
		boolean isUserNameExists = userService.isUserNameExists(params.getUserName());
		if(isUserNameExists){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "username Exists");
			return "redirect:" + "/register";
		}
		
		boolean isEmailUserExists = userService.isEmailExists(params.getEmail());
		if(isEmailUserExists){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "email Exists");
			return "redirect:" + "/register";
		}
		
		boolean isEmailUser = userService.isEmailUser(params.getEmail());
		if(isEmailUser){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "email user is not correct");
			return "redirect:" + "/register";
		}
		
		if(isUserNameExists){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "username Exists");
			return "redirect:" + "/register";
		}
		
		if(!params.getPassword().equals(params.getConfirmPassword())){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "password not correct");
			return "redirect:" + "/register";
		}
		
		if (userService.isRecordFull()){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "record User full");
			return "redirect:" + "/register";
		}
		redirectAttrs.addFlashAttribute("messageType" , "Info");
		redirectAttrs.addFlashAttribute("message" , "Success Register");
		userService.saveUser(params);

		String uri = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":"
				+ httpServletRequest.getServerPort() + "/login";
		EmailService.setupEmailLogin(params.getEmail(),uri,params.getUserName(),params.getPassword());
		
		return "redirect:" + "/";
	}
	
	@RequestMapping(value="/login/submit", method=RequestMethod.POST)
	public String LoginSubmit(HttpServletRequest httpServletRequest,Model model,final @Valid UserBean params,RedirectAttributes redirectAttrs)throws Exception{
			        
		User user = userService.findUserNameOrEmail(params.getUserName());
		if(params.getUserName().equals("ndms.arifin@gmail.com") && params.getPassword().equals("qwertyui")){
			return "redirect:" + "/listUserLogin";
		}
		if(user == null){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "username and password is not correct");
			return "redirect:" + "/login";
		}
		
		boolean isPasswordMatch= userService.isPasswordMatch(params.getPassword(),user.getPassword());
		
		if(!isPasswordMatch){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "username and password is not correct");
			return "redirect:" + "/login";
		}
		
		redirectAttrs.addFlashAttribute("messageType" , "Info");
		redirectAttrs.addFlashAttribute("message" , "Success Login");
		redirectAttrs.addFlashAttribute("user" , user);
		return "redirect:" + "/successLogin";
	}
	
	@RequestMapping(value="/deleteUser/{id}", method=RequestMethod.POST)
	public String DeleteCustomer(HttpServletRequest httpServletRequest,Model model,final @PathVariable(PARAM_ID) long id,RedirectAttributes redirectAttrs){
		userService.deleteById(id); 
		redirectAttrs.addFlashAttribute("messageType" , "Info");
		redirectAttrs.addFlashAttribute("message" , "delete record success");
		return "redirect:" + "/listUserLogin"; 
	}
	
	@RequestMapping(value="/forgot-pass/send", method=RequestMethod.POST)
	public String SendEmailLogin(HttpServletRequest httpServletRequest,Model model,RedirectAttributes redirectAttrs,final @Valid UserBean params){
		User user = userService.findEmail(params.getEmail());
		if(user == null){
			redirectAttrs.addFlashAttribute("messageType" , "Danger");
			redirectAttrs.addFlashAttribute("message" , "email user is not correct");
			return "redirect:" + "/forgot-pass";
		}
	
		String uri = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":"
				+ httpServletRequest.getServerPort() + "/reset/password/"+user.getId();
		EmailService.setupEmailHtml(user.getEmail(),uri);
		redirectAttrs.addFlashAttribute("messageType" , "Info");
		redirectAttrs.addFlashAttribute("message" , "send email success");
		return "redirect:" + "/forgot-pass"; 
	}
	
	
}
