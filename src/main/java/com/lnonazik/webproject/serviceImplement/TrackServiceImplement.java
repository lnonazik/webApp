package com.lnonazik.webproject.serviceImplement;

import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.model.Track;
import com.lnonazik.webproject.repository.TrackResository;
import com.lnonazik.webproject.service.TrackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrackServiceImplement implements TrackService {

    private final TrackResository trackResository;

    @Autowired
    public TrackServiceImplement(TrackResository trackResository) {
        this.trackResository = trackResository;
    }

    @Override
    public List<Track> findAllTracks() {
        return trackResository.findAll();
    }

    @Override
    public void saveNewProduct(TrackDTO trackDTO) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public void delete(String track) {

    }
}
