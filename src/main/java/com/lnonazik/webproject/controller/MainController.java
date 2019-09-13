package com.lnonazik.webproject.controller;


import com.lnonazik.webproject.dto.ProductDto;
import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.service.ProductService;
import com.lnonazik.webproject.service.TrackService;
import com.lnonazik.webproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class MainController {

    private final ProductService productService;

    private final UserService userService;

    private final TrackService trackService;

    private int total = 5;

    @Autowired
    public MainController(ProductService productService, UserService userService, TrackService trackService) {
        this.productService = productService;
        this.userService = userService;
        this.trackService = trackService;
    }

    @GetMapping({"/", "/index"})
    public String index(Model model,
                        @RequestParam(name = "page", defaultValue = "1", required = false) String page,
                        @RequestParam(name = "sort", defaultValue = "productName", required = false) String sort,
                        @RequestParam(name = "total", defaultValue = "5", required = false) String total) {
        this.total = (Integer.valueOf(total) != 5) ? Integer.valueOf(total) : this.total;
        model.addAttribute("products",
                productService.findAll(PageRequest.of(Integer.valueOf(page) - 1, this.total, Sort.by(sort))));
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

    @GetMapping("/product")
    public String product(Model model) {
        model.addAttribute("product", new ProductDto());
        return "product";
    }

    @PostMapping("/newProduct")
    public String product(@ModelAttribute(name = "product") @Valid ProductDto product, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("product", product);
            return "product";
        }
        productService.saveNewProduct(product);
        return "redirect:/product";
    }




}