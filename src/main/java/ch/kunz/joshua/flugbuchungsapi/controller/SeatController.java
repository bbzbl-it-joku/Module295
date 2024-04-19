package ch.kunz.joshua.flugbuchungsapi.controller;

import ch.kunz.joshua.flugbuchungsapi.data.Seat;
import ch.kunz.joshua.flugbuchungsapi.security.Roles;
import ch.kunz.joshua.flugbuchungsapi.service.SeatService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.annotation.security.RolesAllowed;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@SecurityRequirement(name = "bearerAuth")
@RequestMapping("/api/seat")
public class SeatController {
    private SeatService seatService;

    public SeatController(SeatService seatService) {
        this.seatService = seatService;
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping
    public ResponseEntity<List<Seat>> getSeats(@RequestParam(required = false) Long flightId, @RequestParam(required = false) Long passengerId, @RequestParam(required = false) String seatNumber) {
        if (flightId != null && passengerId != null && seatNumber != null) {
            return new ResponseEntity<>(seatService.findByFlightIdAndPassengerIdAndSeatNumber(flightId, passengerId, seatNumber), HttpStatus.OK);
        } else if (flightId != null && passengerId != null && seatNumber == null) {
            return new ResponseEntity<>(seatService.findByFlightIdAndPassengerId(flightId, passengerId), HttpStatus.OK);
        } else if (flightId != null && passengerId == null && seatNumber != null) {
            return new ResponseEntity<>(seatService.findByFlightIdAndSeatNumber(flightId, seatNumber), HttpStatus.OK);
        } else if (flightId != null && passengerId == null && seatNumber == null) {
            return new ResponseEntity<>(seatService.findByFlightId(flightId), HttpStatus.OK);
        } else if (flightId == null && passengerId != null && seatNumber != null) {
            return new ResponseEntity<>(seatService.findByPassengerIdAndSeatNumber(passengerId, seatNumber), HttpStatus.OK);
        } else if (flightId == null && passengerId != null && seatNumber == null) {
            return new ResponseEntity<>(seatService.findByPassengerId(passengerId), HttpStatus.OK);
        } else if (flightId == null && passengerId == null && seatNumber != null) {
            return new ResponseEntity<>(seatService.findBySeatNumber(seatNumber).map(List::of).orElse(List.of()), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(seatService.findAll(), HttpStatus.OK);
        }
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/{id}")
    public ResponseEntity<Seat> getSeatById(@PathVariable Long id) {
        return new ResponseEntity<>(seatService.findById(id).orElse(null), HttpStatus.OK);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PostMapping
    public ResponseEntity<Seat> createSeat(@RequestBody Seat seat) {
        return new ResponseEntity<>(seatService.save(seat), HttpStatus.CREATED);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PutMapping("/{id}")
    public ResponseEntity<Seat> updateSeat(@PathVariable Long id, @RequestBody Seat seat) {
        seat.setId(id);
        try {
            return new ResponseEntity<>(seatService.update(seat), HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RolesAllowed(Roles.Admin)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSeat(@PathVariable Long id) {
        try {
            seatService.deleteById(id);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
}

