package com.klef.jfsd.sdpproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Spots;
import com.klef.jfsd.sdpproject.repository.SpotsRepository;

@Service
public class SpotServiceImpl implements SpotService {

    @Autowired
    private SpotsRepository spotRepository;  // Correct field name

    @Override
    public Spots getSpotById(int id) {
        // Corrected to use spotRepository (lowercase)
        return spotRepository.findById(id).orElse(null);  // Correct method call
    }

    @Override
    public void updateSpot(Spots spot) {
        // Corrected to use spotRepository (lowercase)
        spotRepository.save(spot);  // Correct method call
    }
}