package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Airline {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    private long id;
    @Column(unique = true, nullable = false)
    private String name;
    @Column(nullable = false)
    private String country;

    public Airline() {
    }

    public Airline(String name, String country) {
        this.name = name;
        this.country = country;
    }

    public Airline(long id, String name, String country) {
        this.id = id;
        this.name = name;
        this.country = country;
    }
}
