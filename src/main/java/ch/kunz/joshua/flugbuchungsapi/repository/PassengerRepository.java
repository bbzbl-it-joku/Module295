package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Passenger;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PassengerRepository extends JpaRepository<Passenger, Long> {
    public Optional<List<Passenger>> findByFirstName(String firstName);
    public Optional<List<Passenger>> findByLastName(String lastName);
    public Optional<Passenger> findByFirstNameAndLastName(String firstName, String lastName);
}
