package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
@Entity
public class Airline {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    @NotNull
    private long id;
    @Column(unique = true, nullable = false)
    @NotNull
    private String name;
    @Column(nullable = false)
    @NotNull
    private String country;


    public Airline() {
    }

    public Airline(String country, String name) {
        this.country = country;
        this.name = name;
    }

    public Airline(long id, String name, String country) {
        this.id = id;
        this.name = name;
        this.country = country;
    }
}
