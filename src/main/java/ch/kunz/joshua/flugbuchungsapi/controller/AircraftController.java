package ch.kunz.joshua.flugbuchungsapi.controller;


import ch.kunz.joshua.flugbuchungsapi.data.Aircraft;
import ch.kunz.joshua.flugbuchungsapi.security.Roles;
import ch.kunz.joshua.flugbuchungsapi.service.AircraftService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.annotation.security.RolesAllowed;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@SecurityRequirement(name = "bearerAuth")
@RequestMapping("/api/aircraft")
public class AircraftController {
    private AircraftService aircraftService;

    public AircraftController(AircraftService aircraftService) {
        this.aircraftService = aircraftService;
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping
    public ResponseEntity<List<Aircraft>> getAircrafts() {
        return new ResponseEntity(aircraftService.findAll(), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/{id}")
    public ResponseEntity<Aircraft> getAircraftById(Long id) {
        return new ResponseEntity(aircraftService.findById(id).orElse(null), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/airline/{airlineId}")
    public ResponseEntity<List<Aircraft>> getAircraftsByAirlineId(Long airlineId) {
        return new ResponseEntity(aircraftService.findByAirlineId(airlineId), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/type/{type}")
    public ResponseEntity<List<Aircraft>> getAircraftsByType(String type) {
        return new ResponseEntity(aircraftService.findByType(type), HttpStatus.OK);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PostMapping
    public ResponseEntity<Aircraft> createAircraft(Aircraft aircraft) {
        return new ResponseEntity(aircraftService.save(aircraft), HttpStatus.CREATED);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PutMapping("/{id}")
    public ResponseEntity<Aircraft> updateAircraft(Long id, Aircraft aircraft) {
        aircraft.setId(id);
        try {
            return new ResponseEntity(aircraftService.update(aircraft), HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

    @RolesAllowed(Roles.Admin)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAircraft(Long id) {
        try {
            aircraftService.deleteById(id);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

}
