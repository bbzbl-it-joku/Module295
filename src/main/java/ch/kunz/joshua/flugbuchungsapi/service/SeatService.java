package ch.kunz.joshua.flugbuchungsapi.service;

import ch.kunz.joshua.flugbuchungsapi.data.Seat;
import ch.kunz.joshua.flugbuchungsapi.repository.SeatRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SeatService {

    private SeatRepository seatRepository;

    public SeatService(SeatRepository seatRepository) {
        this.seatRepository = seatRepository;
    }

    public List<Seat> findAll() {
        return seatRepository.findAll();
    }

    public Optional<Seat> findById(Long id) {
        return seatRepository.findById(id);
    }

    public Optional<Seat> findBySeatNumber(String seatNumber) {
        return seatRepository.findBySeatNumber(seatNumber);
    }

    public List<Seat> findByFlightId(Long flightId) {
        return seatRepository.findByFlightId(flightId);
    }

    public List<Seat> findByPassengerId(Long passengerId) {
        return seatRepository.findByPassengerId(passengerId);
    }

    public List<Seat> findByFlightIdAndPassengerId(Long flightId, Long passengerId) {
        return seatRepository.findByFlightIdAndPassengerId(flightId, passengerId);
    }

    public List<Seat> findByFlightIdAndSeatNumber(Long flightId, String seatNumber) {
        return seatRepository.findByFlightIdAndSeatNumber(flightId, seatNumber);
    }

    public List<Seat> findByPassengerIdAndSeatNumber(Long passengerId, String seatNumber) {
        return seatRepository.findByPassengerIdAndSeatNumber(passengerId, seatNumber);
    }

    public List<Seat> findByFlightIdAndPassengerIdAndSeatNumber(Long flightId, Long passengerId, String seatNumber) {
        return seatRepository.findByFlightIdAndPassengerIdAndSeatNumber(flightId, passengerId, seatNumber);
    }

    public Seat update(Seat seat) {
        if (!seatRepository.existsById(seat.getId()) && seat.getId() != 0) {
            throw new IllegalArgumentException("Seat does not exist");
        }
        return seatRepository.save(seat);
    }

    public Seat save(Seat seat) {
        return seatRepository.save(seat);
    }

    public void deleteById(Long id) {
        if (!seatRepository.existsById(id) && id != 0) {
            throw new IllegalArgumentException("Seat does not exist");
        } else {
            seatRepository.deleteById(id);
        }
    }
}
