package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.AirlineData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AirlineRepository extends JpaRepository<AirlineData, Long> {
    public Optional<AirlineData> findByName(String name);
    public List<AirlineData> findByCountry(String country);
}
