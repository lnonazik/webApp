package com.lnonazik.webproject;

import com.lnonazik.webproject.service.StorageService;
import com.lnonazik.webproject.serviceImplement.storage.StorageProperties;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

import javax.annotation.PostConstruct;
import java.util.TimeZone;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class WebprojectApplication {

    @PostConstruct
    void started() {
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
    }
    public static void main(String[] args) {
        SpringApplication.run(WebprojectApplication.class, args);
    }

    CommandLineRunner init(StorageService storageService){
        return (args -> {
            storageService.deleteAll();
            storageService.init();
        });
    }

}
