package com.klef.jfsd.sdpproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {

    @GetMapping("/stats")
    public Map<String, Object> getStats() {
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalTouristSpots", 125);
        stats.put("totalTourists", 1234);
        stats.put("activeBookings", 456);
        return stats;
    }

    @GetMapping("/recent-activities")
    public List<Map<String, String>> getRecentActivities() {
        List<Map<String, String>> activities = new ArrayList<>();
        activities.add(Map.of(
            "icon", "fas fa-user-plus",
            "title", "New Tourist Registration",
            "description", "John Doe registered as a new tourist",
            "time", "2 minutes ago"
        ));
        activities.add(Map.of(
            "icon", "fas fa-map-marked-alt",
            "title", "New Spot Added",
            "description", "Paradise Beach added to tourist spots",
            "time", "1 hour ago"
        ));
        return activities;
    }
}
