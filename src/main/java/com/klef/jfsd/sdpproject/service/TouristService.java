package com.klef.jfsd.sdpproject.service;

import java.util.List;

import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;

public interface TouristService {
	public String TouristRegistration(Tourist tour);
	public Tourist checktourlogin(String email,String pwd);
	 public List<Spots> viewspots();
	 public List<Tourist> viewalltourists();
	

}