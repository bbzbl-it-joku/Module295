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
    @JoinColumn(nullable = false)
    private Airline airline;
    @Column(nullable = false)
    private String type;
    @Column(nullable = false)
    private int capacity;
}
