package ch.kunz.joshua.flugbuchungsapi.repository;

import ch.kunz.joshua.flugbuchungsapi.data.Aircraft;
import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

@DataJpaTest()
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(false)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class AircraftRepositoryTests {
    @Autowired
    private AircraftRepository aircraftRepository;

    private Aircraft aircraft;
    private Airline airline;


    @Test
    @Order(1)
    public void testSave() {
        this.airline = new Airline("Swiss International Air Lines Ltd.", "Switzerland");
        this.aircraft = new Aircraft(this.airline, "Airbus A320", 200);
        aircraftRepository.save(this.aircraft);
        Assertions.assertEquals(1, aircraftRepository.count());
        Assertions.assertEquals(this.aircraft, aircraftRepository.findById(this.aircraft.getId()).get());
    }

    @Test
    @Order(2)
    public void testUpdate() {
        this.aircraft.setCapacity(250);
        aircraftRepository.save(this.aircraft);
        Assertions.assertEquals(1, aircraftRepository.count());
        Assertions.assertEquals(this.aircraft, aircraftRepository.findById(this.aircraft.getId()).get());
    }

    @Test
    @Order(3)
    public void testDelete() {
        aircraftRepository.deleteById(this.aircraft.getId());
        Assertions.assertEquals(0, aircraftRepository.count());
        Assertions.assertFalse(aircraftRepository.findById(this.aircraft.getId()).isPresent());
    }
}
