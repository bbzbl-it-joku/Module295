package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Aircraft {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;
    @ManyToOne
    private Airline airline;
    @Column(nullable = false)
    private String type;
    @Column(nullable = false)
    private int capacity;

    public Aircraft() {
    }

    public Aircraft(Airline airline, String type, int capacity) {
        this.airline = airline;
        this.type = type;
        this.capacity = capacity;
    }

    public Aircraft(Long id, Airline airline, String type, int capacity) {
        this.id = id;
        this.airline = airline;
        this.type = type;
        this.capacity = capacity;
    }
}
