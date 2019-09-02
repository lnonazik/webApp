package com.lnonazik.webproject.repository;

import com.lnonazik.webproject.model.Track;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrackResository extends JpaRepository<Track, Long> {
}
