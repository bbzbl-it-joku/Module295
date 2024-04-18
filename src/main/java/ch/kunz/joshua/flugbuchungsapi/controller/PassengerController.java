package ch.kunz.joshua.flugbuchungsapi.controller;

import ch.kunz.joshua.flugbuchungsapi.data.Passenger;
import ch.kunz.joshua.flugbuchungsapi.security.Roles;
import ch.kunz.joshua.flugbuchungsapi.service.PassengerService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.annotation.security.RolesAllowed;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@SecurityRequirement(name = "bearerAuth")
@RequestMapping("/api/passenger")
public class PassengerController {

    private PassengerService passengerService;

    public PassengerController(PassengerService passengerService) {
        this.passengerService = passengerService;
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping
    public ResponseEntity<List<Passenger>> getPassengers(@RequestParam(required = false) String firstName, @RequestParam(required = false) String lastName) {
        if (firstName != null && lastName != null) {
            return new ResponseEntity<>(List.of(passengerService.findByFirstNameAndLastName(firstName, lastName).orElse(null)), HttpStatus.OK);
        } else if (firstName != null) {
            return new ResponseEntity<>(passengerService.findByFirstName(firstName).orElse(null), HttpStatus.OK);
        } else if (lastName != null) {
            return new ResponseEntity<>(passengerService.findByLastName(lastName).orElse(null), HttpStatus.OK);
        }
        return new ResponseEntity<>(passengerService.findAll(), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/{id}")
    public ResponseEntity<Passenger> getPassengerById(Long id) {
        return new ResponseEntity<>(passengerService.findById(id).orElse(null), HttpStatus.OK);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @PostMapping
    public ResponseEntity<Passenger> save(@RequestBody Passenger passenger) {
        return new ResponseEntity<>(passengerService.save(passenger), HttpStatus.CREATED);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @PutMapping("/{id}")
    public ResponseEntity<Passenger> update(@PathVariable Long id, @RequestBody Passenger passenger) {
        passenger.setId(id);
        try {
            return new ResponseEntity<>(passengerService.update(passenger), HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        try {
            passengerService.deleteById(id);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
