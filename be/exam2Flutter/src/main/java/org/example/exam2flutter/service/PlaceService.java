package org.example.exam2flutter.service;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.example.exam2flutter.entity.Place;
import org.example.exam2flutter.repository.PlaceRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PlaceService {
    PlaceRepository placeRepository;

    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }
}
