package org.example.exam2flutter.controllers;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.example.exam2flutter.entity.Place;
import org.example.exam2flutter.service.PlaceService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/place")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class PlayerController {
    PlaceService placeService;

    @GetMapping
    public List<Place> getAllPlaces() {
        return placeService.getAllPlaces();
    }
}
