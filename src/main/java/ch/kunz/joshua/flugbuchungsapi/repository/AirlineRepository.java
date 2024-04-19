package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AirlineRepository extends JpaRepository<Airline, Long> {
    public List<Airline> findByName(String name);
    public List<Airline> findByCountry(String country);
    public List<Airline> findByNameAndCountry(String name, String country);
}
