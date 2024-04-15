package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.AirlineData;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AirlineRepository extends JpaRepository<AirlineData, Long> {
    public Optional<AirlineData> findByName(String name);
    public List<AirlineData> findByCountry(String country);
}
