package com.lnonazik.webproject.repository;

import com.lnonazik.webproject.model.Track;
import com.lnonazik.webproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TrackResository extends JpaRepository<Track, Long> {

    List<Track> findAllByUser(User user);
}
