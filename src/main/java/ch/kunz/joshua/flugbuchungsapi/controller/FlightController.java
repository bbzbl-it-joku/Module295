package ch.kunz.joshua.flugbuchungsapi.controller;

import ch.kunz.joshua.flugbuchungsapi.data.Flight;
import ch.kunz.joshua.flugbuchungsapi.security.Roles;
import ch.kunz.joshua.flugbuchungsapi.service.FlightService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.annotation.security.RolesAllowed;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@SecurityRequirement(name = "bearerAuth")
@RequestMapping("/api/flight")
public class FlightController {
    private FlightService flightService;

    public FlightController(FlightService flightService) {
        this.flightService = flightService;
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping
    public ResponseEntity<List<Flight>> getFlights(@RequestParam(required = false) String destination, @RequestParam(required = false) String origin) {
        if (destination != null && origin != null) {
            return new ResponseEntity<>(flightService.findByOriginAndDestination(origin, destination), HttpStatus.OK);
        } else if (destination != null && origin == null) {
            return new ResponseEntity<>(flightService.findByDestination(destination), HttpStatus.OK);
        } else if (origin != null && destination == null) {
            return new ResponseEntity<>(flightService.findByOrigin(origin), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(flightService.findAll(), HttpStatus.OK);
        }
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/{id}")
    public ResponseEntity<Flight> getFlightById(@PathVariable Long id) {
        return new ResponseEntity<>(flightService.findById(id).orElse(null), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/airline/{airlineId}")
    public ResponseEntity<List<Flight>> getFlightsByAirlineId(@PathVariable Long airlineId) {
        return new ResponseEntity<>(flightService.findByAirlineId(airlineId), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/seat/{seatId}")
    public ResponseEntity<Flight> getFlightsBySeatId(@PathVariable Long seatId) {
        return new ResponseEntity<>(flightService.findBySeatId(seatId), HttpStatus.OK);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PostMapping
    public ResponseEntity<Flight> createFlight(@RequestBody Flight flight) {
        return new ResponseEntity<>(flightService.save(flight), HttpStatus.CREATED);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PutMapping("/{id}")
    public ResponseEntity<Flight> updateFlight(@PathVariable Long id, @RequestBody Flight flight) {
        flight.setId(id);
        try {
            return new ResponseEntity<>(flightService.update(flight), HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteFlight(@PathVariable Long id) {
        flightService.deleteById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
