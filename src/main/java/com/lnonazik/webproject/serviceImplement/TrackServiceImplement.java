package com.lnonazik.webproject.serviceImplement;

import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.model.Track;
import com.lnonazik.webproject.model.User;
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
    public Track saveNewProduct(TrackDTO trackDTO) {
        Track track = new Track();

        track.setName(trackDTO.getName());
        track.setPerformer(trackDTO.getPerformer());
        track.setAlbum(trackDTO.getAlbum());
        track.setPath(trackDTO.getPath());
        trackResository.save(track);
        return track;
    }

    @Override
    public void saveTrack(Track track) {
        trackResository.save(track);
    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public void delete(String track) {

    }

    @Override
    public List<Track> findAllTracksByUser(User user) {
        return trackResository.findAllByUser(user);
    }


}

