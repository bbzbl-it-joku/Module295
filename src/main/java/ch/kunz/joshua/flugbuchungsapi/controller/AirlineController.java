package ch.kunz.joshua.flugbuchungsapi.controller;

import ch.kunz.joshua.flugbuchungsapi.data.AirlineData;
import ch.kunz.joshua.flugbuchungsapi.security.Roles;
import ch.kunz.joshua.flugbuchungsapi.service.AirlineService;
import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.annotation.security.RolesAllowed;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@SecurityRequirement(name = "bearerAuth")
@RequestMapping("/api/airline")
@Validated
public class AirlineController {
    private AirlineService airlineService;

    public AirlineController(AirlineService airlineService) {
        this.airlineService = airlineService;
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping
    public ResponseEntity<List<AirlineData>> getAirlines() {
        return new ResponseEntity<>(airlineService.findAll(), HttpStatus.OK);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PostMapping
    public ResponseEntity<AirlineData> createAirline(@RequestBody AirlineData airline) {
        return new ResponseEntity<>(airlineService.save(airline), HttpStatus.CREATED);
    }

    @RolesAllowed({Roles.User, Roles.Staff, Roles.Admin})
    @GetMapping("/{id}")
    public ResponseEntity<Optional<AirlineData>> getAirlineById(@PathVariable Long id) {
        return new ResponseEntity<>(airlineService.findById(id), HttpStatus.OK);
    }

    @RolesAllowed({Roles.Staff, Roles.Admin})
    @PutMapping("/{id}")
    public ResponseEntity<AirlineData> updateAirline(@PathVariable Long id, @RequestBody AirlineData airline) {
        airline.setId(id);
        return new ResponseEntity<>(airlineService.save(airline), HttpStatus.OK);
    }

    @RolesAllowed(Roles.Admin)
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteAirline(@PathVariable Long id) {
        airlineService.deleteById(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
