package ch.kunz.joshua.flugbuchungsapi.repository;

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
public class AirlineRepositoryTests {
    @Autowired
    private AirlineRepository airlineRepository;

    private Airline airline;

    @Test
    @Order(1)
    public void testSave() {
        this.airline = new Airline("Swiss International Air Lines Ltd.", "Switzerland");
        airlineRepository.save(this.airline);
        Assertions.assertEquals(1, airlineRepository.count());
        Assertions.assertEquals(this.airline, airlineRepository.findById(this.airline.getId()).get());
    }

    @Test
    @Order(2)
    public void testUpdate() {
        this.airline.setName("Swiss International Air Lines");
        airlineRepository.save(this.airline);
        Assertions.assertEquals(1, airlineRepository.count());
        Assertions.assertEquals(this.airline, airlineRepository.findById(this.airline.getId()).get());
    }

    @Test
    @Order(3)
    public void testDelete() {
        airlineRepository.deleteById(this.airline.getId());
        Assertions.assertEquals(0, airlineRepository.count());
        Assertions.assertFalse(airlineRepository.findById(this.airline.getId()).isPresent());
    }
}
