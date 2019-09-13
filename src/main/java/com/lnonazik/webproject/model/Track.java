package com.lnonazik.webproject.model;

import javax.persistence.*;

@Entity
public class Track {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String performer;
    private String album;
    private String path;

   /* @ManyToOne(cascade = CascadeType.REMOVE)*/

    @ManyToOne
    private User user;

    public Track(){

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Track{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", performer='" + performer + '\'' +
                ", album='" + album + '\'' +
                ", path='" + path + '\'' +
                ", user=" + user +
                '}';
    }
}
