package ch.kunz.joshua.flugbuchungsapi.service;

import ch.kunz.joshua.flugbuchungsapi.data.Flight;
import ch.kunz.joshua.flugbuchungsapi.repository.FlightRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FlightService {
    private FlightRepository flightRepository;

    public FlightService(FlightRepository flightRepository) {
        this.flightRepository = flightRepository;
    }

    public List<Flight> findAll() {
        return flightRepository.findAll();
    }

    public Optional<Flight> findById(Long id) {
        return flightRepository.findById(id);
    }

    public List<Flight> findByDestination(String destination) {
        return flightRepository.findByDestination(destination);
    }

    public List<Flight> findByOrigin(String origin) {
        return flightRepository.findByOrigin(origin);
    }

    public List<Flight> findByOriginAndDestination(String origin, String destination) {
        return flightRepository.findByOriginAndDestination(origin, destination);
    }

    public List<Flight> findByAirlineId(Long airlineId) {
        return flightRepository.findByAircraft_Airline_Id(airlineId);
    }

    public List<Flight> findByAircraftId(Long aircraftId) {
        return flightRepository.findByAircraftId(aircraftId);
    }

    public Flight update(Flight flight) {
        if (!flightRepository.existsById(flight.getId()) && flight.getId() != 0) {
            throw new IllegalArgumentException("Flight does not exist");
        }
        return flightRepository.save(flight);
    }

    public Flight save(Flight flight) {
        return flightRepository.save(flight);
    }

    public void deleteById(Long id) {
        if (!flightRepository.existsById(id) && id != 0) {
            throw new IllegalArgumentException("Flight does not exist");
        } else {
            flightRepository.deleteById(id);
        }
    }
}
