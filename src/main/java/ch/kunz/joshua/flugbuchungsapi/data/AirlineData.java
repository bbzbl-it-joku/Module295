package ch.kunz.joshua.flugbuchungsapi.data;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Entity
public class AirlineData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, nullable = false)
    @Size(max = 255)
    @NotNull
    private long id;
    @Column(unique = true, nullable = false)
    @NotNull
    private String name;
    @Column(nullable = false)
    @NotNull
    private String country;
}
