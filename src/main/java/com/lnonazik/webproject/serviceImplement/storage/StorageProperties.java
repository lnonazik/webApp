package com.lnonazik.webproject.serviceImplement.storage;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("storage")
public class StorageProperties {

    private String location = "F:\\JavaProject\\webproject\\src\\main\\resources\\static\\tracks";

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
