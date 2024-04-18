package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
@Entity
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Airline airline;
    @ManyToOne
    private Aircraft aircraft;
    @Column(nullable = false)
    private Timestamp departureTime;
    @Column(nullable = false)
    private String destination;
    @Column(nullable = false)
    private String origin;

}
