package com.lnonazik.webproject.service;

import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.model.Track;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TrackService {

    
    List<Track> findAllTracks();

    void saveNewProduct(TrackDTO trackDTO);

    void delete(Long id);

    void delete(String track);
}
