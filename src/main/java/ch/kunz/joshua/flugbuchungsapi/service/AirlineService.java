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

    public Optional<Airline> findByName(String name) {
        return airlineRepository.findByName(name);
    }

    public List<Airline> findByCountry(String country) {
        return airlineRepository.findByCountry(country);
    }

    public Airline save(Airline airlineData) {
        return airlineRepository.save(airlineData);
    }

    public void deleteById(Long id) {
        airlineRepository.deleteById(id);
    }
}
