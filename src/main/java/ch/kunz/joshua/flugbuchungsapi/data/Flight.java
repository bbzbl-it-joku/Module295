package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;

import java.util.List;

@Data
@Entity
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Aircraft aircraft;
    @Column(nullable = false)
    private Timestamp departureTime;
    @Column(nullable = false)
    private String destination;
    @Column(nullable = false)
    private String origin;
    @OneToMany(mappedBy = "flight")
    private List<Seat> seats;

    public Flight() {
    }

    public Flight(Aircraft aircraft, Timestamp departureTime, String destination, String origin) {
        this.aircraft = aircraft;
        this.departureTime = departureTime;
        this.destination = destination;
        this.origin = origin;
    }

    public Flight(Long id, Aircraft aircraft, Timestamp departureTime, String destination, String origin) {
        this.id = id;
        this.aircraft = aircraft;
        this.departureTime = departureTime;
        this.destination = destination;
        this.origin = origin;
    }
}
