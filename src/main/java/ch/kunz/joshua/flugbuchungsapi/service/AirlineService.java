package ch.kunz.joshua.flugbuchungsapi.service;

import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import ch.kunz.joshua.flugbuchungsapi.repository.AirlineRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AirlineService {

    private AirlineRepository airlineRepository;

    public AirlineService(AirlineRepository airlineRepository) {
        this.airlineRepository = airlineRepository;
    }


    public List<Airline> findAll() {
        return airlineRepository.findAll();
    }

    public Optional<Airline> findById(Long id) {
        return airlineRepository.findById(id);
    }

    public List<Airline> findByName(String name) {
        return airlineRepository.findByName(name);
    }

    public List<Airline> findByCountry(String country) {
        return airlineRepository.findByCountry(country);
    }

    public List<Airline> findByNameAndCountry(String name, String country) {
        return airlineRepository.findByNameAndCountry(name, country);
    }

    public Airline update(Airline airline) {
        if (!airlineRepository.existsById(airline.getId()) && airline.getId() != 0) {
            throw new IllegalArgumentException("Airline does not exist");
        }
        return airlineRepository.save(airline);
    }

    public Airline save(Airline airline) {
        return airlineRepository.save(airline);
    }

    public void deleteById(Long id) {
        if (!airlineRepository.existsById(id) && id != 0) {
            throw new IllegalArgumentException("Airline does not exist");
        } else {
            airlineRepository.deleteById(id);
        }
    }
}
