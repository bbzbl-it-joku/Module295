package ch.kunz.joshua.flugbuchungsapi.data;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@Data
@Entity
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, unique = true)
    private Long id;
    @Column(nullable = false)
    private String seatNumber;
    @ManyToOne
    @JsonIgnore
    private Flight flight;
    @ManyToOne
    private Passenger passenger;

    public Seat() {
    }

    public Seat(String seatNumber, Flight flight) {
        this.seatNumber = seatNumber;
        this.flight = flight;
    }

    public Seat(Long id, String seatNumber, Flight flight) {
        this.id = id;
        this.seatNumber = seatNumber;
        this.flight = flight;
    }
}
