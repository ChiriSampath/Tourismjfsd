package com.klef.jfsd.sdpproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.model.Tourist;
import com.klef.jfsd.sdpproject.repository.SpotsRepository;
import com.klef.jfsd.sdpproject.repository.TouristRepository;

@Service
public class TouristServiceImpl implements TouristService
{
	@Autowired
	private TouristRepository touristRepository;
	
	@Autowired
	private SpotsRepository spotRepository;

	@Override
	public String TouristRegistration(Tourist tour) {
		// TODO Auto-generated method stub
		touristRepository.save(tour);
		return "Tourist Registerd Successfully!!";
	}

	@Override
	public Tourist checktourlogin(String email, String pwd) {
		// TODO Auto-generated method stub
		return touristRepository.checktourlogin(email, pwd);
	}

	@Override
	public List<Spots> viewspots() {
		return spotRepository.findAll();
	}

	@Override
	public List<Tourist> viewalltourists() {
		return touristRepository.findAll();
	}

	

	}