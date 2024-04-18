package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Passenger {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private Long id;
    @Column(nullable = false)
    private String firstName;
    @Column(nullable = false)
    private String lastName;
    @Column(nullable = false, columnDefinition = "TEXT")
    private String address;
}
