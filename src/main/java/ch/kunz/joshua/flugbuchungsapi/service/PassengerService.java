package ch.kunz.joshua.flugbuchungsapi.service;

import ch.kunz.joshua.flugbuchungsapi.data.Passenger;
import ch.kunz.joshua.flugbuchungsapi.repository.PassengerRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PassengerService {
    private final PassengerRepository passengerRepository;

    public PassengerService(PassengerRepository passengerRepository) {
        this.passengerRepository = passengerRepository;
    }

    public List<Passenger> findAll() {
        return this.passengerRepository.findAll();
    }

    public Optional<Passenger> findById(Long id) {
        return this.passengerRepository.findById(id);
    }

    public Optional<List<Passenger>> findByFirstName(String firstName) {
        return this.passengerRepository.findByFirstName(firstName);
    }

    public Optional<List<Passenger>> findByLastName(String lastName) {
        return this.passengerRepository.findByLastName(lastName);
    }

    public Optional<Passenger> findByFirstNameAndLastName(String firstName, String lastName) {
        return this.passengerRepository.findByFirstNameAndLastName(firstName, lastName);
    }

    public Passenger update(Passenger passenger) {
        if (!this.passengerRepository.existsById(passenger.getId()) && passenger.getId() != 0) {
            throw new IllegalArgumentException("Passenger does not exist");
        }
        return this.passengerRepository.save(passenger);
    }

    public Passenger save(Passenger passenger) {
        return this.passengerRepository.save(passenger);
    }

    public void deleteById(Long id) {
        if (!this.passengerRepository.existsById(id) && id != 0) {
            throw new IllegalArgumentException("Passenger does not exist");
        } else {
            this.passengerRepository.deleteById(id);
        }
    }
}
