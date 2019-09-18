package com.lnonazik.webproject.controller;


import com.lnonazik.webproject.service.MailService;
import com.lnonazik.webproject.service.TrackService;
import com.lnonazik.webproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
public class MainController {


    private final UserService userService;

    private final TrackService trackService;


    private int total = 5;

    @Autowired
    public MainController(UserService userService, TrackService trackService) {
        this.userService = userService;
        this.trackService = trackService;
    }

    @GetMapping({"/", "/index"})
    public String index(Model model){
        model.addAttribute("allTrackList", trackService.findAllTracks());
        return "index";
    }

    @GetMapping("/home")
    public String home(Principal principal, Model model) {
        System.out.println(principal);
        System.out.println(userService.findOne(principal.getName()));
        model.addAttribute("username", principal.getName());
        return "home";
    }

    @GetMapping("/track")
    public String track(){
        return "newTrack";
    }



    @GetMapping("/contacts")
    public String contact(){
        return "contacts";
    }




}