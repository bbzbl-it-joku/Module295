package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Aircraft;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AircraftRepository extends JpaRepository<Aircraft, Long> {
    public List<Aircraft> findByAirlineId(Long airlineId);
    public List<Aircraft> findByType(String type);
    public List<Aircraft> findByAirlineIdAndType(Long airlineId, String type);
}
