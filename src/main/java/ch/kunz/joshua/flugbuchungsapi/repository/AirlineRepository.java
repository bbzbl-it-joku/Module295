package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AirlineRepository extends JpaRepository<Airline, Long> {
    Optional<Airline> findByName(String name);
    List<Airline> findByCountry(String country);
}
