package com.klef.jfsd.sdpproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.repository.SpotsRepository;
import com.klef.jfsd.sdpproject.repository.TouristRepository;
import com.klef.jfsd.sdpproject.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private SpotsRepository spotsRepository;

    @Autowired
    private TouristRepository touristRepository;

    // Admin Login
    @GetMapping("adminlogin")
    public String adminLogin() {
        return "adminlogin";
    }

    // Admin Home
    @GetMapping("adminhome")
    public String adminHome() {
        return "adminhome";
    }

    // Admin Logout
    @GetMapping("adminlogout")
    public ModelAndView adminLogout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        ModelAndView mv = new ModelAndView("adminlogin");
        mv.addObject("message", "You have been logged out successfully.");
        return mv;
    }

    // Check Admin Login
    @PostMapping("checkadminlogin")
    public ModelAndView checkAdminLogin(@RequestParam("auname") String username,
                                        @RequestParam("apwd") String password,
                                        HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Admin admin = adminService.checkadminlogin(username, password);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            mv.setViewName("adminhome");
        } else {
            mv.setViewName("adminlogin");
            mv.addObject("message", "Login Failed: Invalid credentials.");
        }
        return mv;
    }

    // Add Spots Page
    @GetMapping("addspots")
    public String addSpotsPage() {
        return "addspots";
    }

    // Insert Spot
    @PostMapping("insertspot")
    public ModelAndView insertSpot(@RequestParam("spot_country") String country,
                                    @RequestParam("spot_state") String state,
                                    @RequestParam("spot_name") String spotName) {
        ModelAndView mv = new ModelAndView();

        try {
            if (country.isEmpty() || state.isEmpty() || spotName.isEmpty()) {
                throw new IllegalArgumentException("All fields are required.");
            }

            Spots spot = new Spots();
            spot.setCountry(country);
            spot.setState(state);
            spot.setSpotname(spotName);

            String message = adminService.AddSpot(spot);
            mv.setViewName("spotmsg");
            mv.addObject("message", message);
        } catch (IllegalArgumentException e) {
            mv.setViewName("spoterror");
            mv.addObject("message", e.getMessage());
        } catch (Exception e) {
            mv.setViewName("spoterror");
            mv.addObject("message", "An unexpected error occurred: " + e.getMessage());
        }

        return mv;
    }

    // Add Spot Success
    @PostMapping("/addspotsuccess")
    public String addSpotSuccess() {
        return "addspotsuccess";
    }

    // View All Tourists
    @GetMapping("viewalltourists")
    public ModelAndView viewAllTourists() {
        List<Tourist> touristList = adminService.viewalltourists();
        ModelAndView mv = new ModelAndView("viewalltourists");
        mv.addObject("tourlist", touristList);
        return mv;
    }

    // Delete Tourist Page
    @GetMapping("deletetour")
    public ModelAndView deleteTourPage() {
        List<Tourist> touristList = adminService.viewalltourists();
        ModelAndView mv = new ModelAndView("deletetour");
        mv.addObject("tourlist", touristList);
        return mv;
    }

    // Delete Operation
    @GetMapping("delete")
    public String deleteTourist(@RequestParam("id") int touristId) {
        adminService.deletetour(touristId);
        return "redirect:/deletetour";
    }

    // API: Total Tourist Spots
    @GetMapping("/api/total-tourist-spots")
    public long getTotalTouristSpots() {
        return spotsRepository.count();
    }

    // API: Total Tourists
    @GetMapping("/api/total-tourists")
    public long getTotalTourists() {
        return touristRepository.count();
    }

    // Session Timeout Handler
    @GetMapping("/session-timeout")
    public ModelAndView sessionTimeout() {
        ModelAndView mv = new ModelAndView("adminlogin");
        mv.addObject("message", "Your session has expired. Please log in again.");
        return mv;
    }
}
