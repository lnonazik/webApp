package com.lnonazik.webproject.service;

import com.lnonazik.webproject.model.Track;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface TrackService {

    
    List<Track> findAllTracks();
}
