package com.lnonazik.webproject.service;

import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.model.Track;
import com.lnonazik.webproject.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TrackService {

    
    List<Track> findAllTracks();

    Track saveNewProduct(TrackDTO trackDTO);

    void delete(Long id);

    void delete(String track);

    List<Track> findAllTracksByUser(User user);
    void saveTrack(Track track);

}
