package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Flight;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlightRepository extends JpaRepository<Flight, Long> {
    public List<Flight> findByDestination(String destination);
    public List<Flight> findByOrigin(String origin);
    public List<Flight> findByOriginAndDestination(String origin, String destination);
    public List<Flight> findByAirlineId(Long airlineId);
    public List<Flight> findByAircraftId(Long aircraftId);

}
