package ch.kunz.joshua.flugbuchungsapi.service;

import ch.kunz.joshua.flugbuchungsapi.data.AirlineData;
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


    public List<AirlineData> findAll() {
        return airlineRepository.findAll();
    }

    public Optional<AirlineData> findById(Long id) {
        return airlineRepository.findById(id);
    }

    public Optional<AirlineData> findByName(String name) {
        return airlineRepository.findByName(name);
    }

    public List<AirlineData> findByCountry(String country) {
        return airlineRepository.findByCountry(country);
    }

    public AirlineData save(AirlineData airlineData) {
        return airlineRepository.save(airlineData);
    }

    public void deleteById(Long id) {
        airlineRepository.deleteById(id);
    }
}
