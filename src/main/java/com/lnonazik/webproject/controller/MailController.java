package com.lnonazik.webproject.controller;

import com.lnonazik.webproject.service.TrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MailController {

    @Autowired
    private TrackService trackService;


}
