package ch.kunz.joshua.flugbuchungsapi.data;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

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


    @OneToMany(mappedBy = "airline", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Aircraft> aircrafts;

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
