package ch.kunz.joshua.flugbuchungsapi.service;

import ch.kunz.joshua.flugbuchungsapi.data.Aircraft;
import ch.kunz.joshua.flugbuchungsapi.repository.AircraftRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AircraftService {
    private AircraftRepository aircraftRepository;

    public AircraftService(AircraftRepository aircraftRepository) {
        this.aircraftRepository = aircraftRepository;
    }


    public List<Aircraft> findAll() {
        return aircraftRepository.findAll();
    }

    public Optional<Aircraft> findById(Long id) {
        return aircraftRepository.findById(id);
    }

    public List<Aircraft> findByAirlineId(Long airlineId) {
        return aircraftRepository.findByAirlineId(airlineId);
    }

    public List<Aircraft> findByType(String type) {
        return aircraftRepository.findByType(type);
    }

    public Aircraft update(Aircraft aircraft) {
        if (!aircraftRepository.existsById(aircraft.getId()) && aircraft.getId() != 0) {
            throw new IllegalArgumentException("Aircraft does not exist");
        }
        return aircraftRepository.save(aircraft);
    }
    public Aircraft save(Aircraft aircraft) {
        return aircraftRepository.save(aircraft);
    }

    public void deleteById(Long id) {
        if (!aircraftRepository.existsById(id) && id != 0) {
            throw new IllegalArgumentException("Aircraft does not exist");
        } else {
            aircraftRepository.deleteById(id);
        }
    }
}
