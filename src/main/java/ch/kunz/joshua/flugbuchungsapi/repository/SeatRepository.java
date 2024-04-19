package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Seat;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SeatRepository extends JpaRepository<Seat, Long> {
    public Optional<Seat> findBySeatNumber(String seatNumber);
    public List<Seat> findByFlightId(Long flightId);
    public List<Seat> findByPassengerId(Long passengerId);
    public List<Seat> findByFlightIdAndPassengerId(Long flightId, Long passengerId);
    public List<Seat> findByFlightIdAndSeatNumber(Long flightId, String seatNumber);
    public List<Seat> findByPassengerIdAndSeatNumber(Long passengerId, String seatNumber);
    public List<Seat> findByFlightIdAndPassengerIdAndSeatNumber(Long flightId, Long passengerId, String seatNumber);

}
