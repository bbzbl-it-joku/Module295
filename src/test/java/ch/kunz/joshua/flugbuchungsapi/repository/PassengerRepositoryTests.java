package ch.kunz.joshua.flugbuchungsapi.repository;
import ch.kunz.joshua.flugbuchungsapi.data.Passenger;
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
public class PassengerRepositoryTests {

        @Autowired
        private PassengerRepository passengerRepository;

        private Passenger passenger;

        @Test
        @Order(1)
        public void testSave() {
                this.passenger = new Passenger("Max", "Musterman", "Musterstrasse 1, 8000 Zürich");
                passengerRepository.save(this.passenger);
                Assertions.assertEquals(1, passengerRepository.count());
                Assertions.assertEquals(this.passenger, passengerRepository.findById(this.passenger.getId()).get());
        }

        @Test
        @Order(2)
        public void testUpdate() {
                this.passenger.setFirstName("Hans");
                passengerRepository.save(this.passenger);
                Assertions.assertEquals(1, passengerRepository.count());
                Assertions.assertEquals(this.passenger, passengerRepository.findById(this.passenger.getId()).get());
        }

        @Test
        @Order(3)
        public void testDelete() {
                passengerRepository.deleteById(this.passenger.getId());
                Assertions.assertEquals(0, passengerRepository.count());
                Assertions.assertFalse(passengerRepository.findById(this.passenger.getId()).isPresent());
        }
}
