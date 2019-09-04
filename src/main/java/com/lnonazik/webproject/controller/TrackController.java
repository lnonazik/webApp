package com.lnonazik.webproject.controller;

import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.service.TrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.Part;


@Controller
public class TrackController {

    @Autowired
    private TrackService trackService;

    @GetMapping("/addTrack")
    public String track(Model m){
        return "newTrack";
    }

    @PostMapping("/addTrack")
    public String track(@RequestBody Part track){
        System.out.println(track);
        return "newTrack";
    }


}
