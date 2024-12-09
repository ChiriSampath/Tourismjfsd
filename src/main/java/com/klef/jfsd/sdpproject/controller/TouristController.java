package com.klef.jfsd.sdpproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.service.TouristService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TouristController 
{
	@Autowired
	private TouristService touristservice;
	
	
	
  @GetMapping("/")
  public ModelAndView home()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("home");
    return mv;
  }
  @GetMapping("aboutus")
  public ModelAndView aboutus()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("aboutus");
    return mv;
  }
  
  @GetMapping("services")
  public ModelAndView services()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("services");
    return mv;
  }
  
  @GetMapping("upcpackages")
  public ModelAndView upcpackages()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("upcpackages");
    return mv;
  }
  
  @GetMapping("/touristreg")
  public ModelAndView touristreg()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("touristreg");
    return mv;
  }
  
  
  @GetMapping("/touristlogin")
  public ModelAndView touristlogin()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("touristlogin");
    return mv;
  }
  
  @PostMapping("inserttourist")
  public ModelAndView inserttourist(HttpServletRequest request)
  {
   String name = request.getParameter("ename");
   String gender = request.getParameter("egender");
   String dob = request.getParameter("edob");
   String email = request.getParameter("eemail");
   String password = request.getParameter("epwd");
   String contact = request.getParameter("econtact");

   
     Tourist tour = new Tourist();
     tour.setName(name);
     tour.setGender(gender);
     tour.setDateofbirth(dob);
     tour.setEmail(email);
     tour.setPassword(password);
     tour.setContact(contact);

     
     String msg = touristservice.TouristRegistration(tour);
     
     ModelAndView mv = new ModelAndView("touristregsucess");
     mv.addObject("message", msg);
   
     return mv;
  }
  
  @PostMapping("checktourlogin")
 	public ModelAndView checktourlogin(HttpServletRequest request)
 	{
 		
 		ModelAndView mv=new ModelAndView();
 		
 		
 		String eemail=request.getParameter("eemail");
 		String epwd=request.getParameter("epwd");
 		
 		Tourist tour=touristservice.checktourlogin(eemail, epwd);
 		
 		if(tour!=null) {
 			
 			//session
 			
 			HttpSession session= request.getSession();
 			session.setAttribute("tourist", tour);  // employee is session variable
 			
 			//session.setMaxInactiveInterval(5);

 			mv.setViewName("touristhome");
 			
 		}
 		else {

 			mv.setViewName("touristlogin");
 			mv.addObject("message","Login Failed");
 		}
 		return mv;
 	}
  
  @GetMapping("touristhome")
  public ModelAndView touristhome()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("touristhome");
    return mv;
  }
  @GetMapping("touristprofile")
  public ModelAndView touristprofile()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("touristprofile");
    return mv;
  }
  @GetMapping("touristcontactus")
  public ModelAndView touristcontactus()
  {
    ModelAndView mv=new ModelAndView();
    mv.setViewName("touristcontactus");
    return mv;
  }
  
  @GetMapping("touristlogout")
  public ModelAndView touristlogout(HttpServletRequest request)
  {
  	HttpSession session=request.getSession();
  	
  	session.removeAttribute("tourist");
  	session.invalidate(); 
  	
    ModelAndView mv=new ModelAndView();
    mv.setViewName("touristlogin");
    return mv;
  }
  
  @GetMapping("viewspots")
  public ModelAndView viewspots() {
      ModelAndView mv = new ModelAndView();
      List<Spots> spots = touristservice.viewspots(); // Replace with actual service method
      mv.setViewName("viewspots");
      mv.addObject("spots", spots);
      return mv;
  }
}