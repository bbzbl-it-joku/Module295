package ch.kunz.joshua.flugbuchungsapi.AirlineTests;

import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import ch.kunz.joshua.flugbuchungsapi.repository.AirlineRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class AirlineRepositoryTest {

    @Autowired
    private AirlineRepository airlineRepository;

    @Test
    void testFindByName() {
        String testName = "Test Airline";
        Optional<Airline> existingAirline = airlineRepository.findByName(testName);
        if (existingAirline.isPresent()) {
            airlineRepository.delete(existingAirline.get());
        }
        Airline airline = new Airline("Switzerland", testName);
        airlineRepository.save(airline); // Save the airline to the database

        Optional<Airline> foundAirline = airlineRepository.findByName(testName);

        assertThat(foundAirline).isPresent();
        assertThat(foundAirline.get().getName()).isEqualTo(testName);

        airlineRepository.delete(airline);
    }


    @Test
    void testFindByCountry() {
        String testName1 = "Test Airline 1";
        String testName2 = "Test Airline 2";

        // Check if airlines with these names already exist and delete them if they do
        Optional<Airline> existingAirline1 = airlineRepository.findByName(testName1);
        if (existingAirline1.isPresent()) {
            airlineRepository.delete(existingAirline1.get());
        }
        Optional<Airline> existingAirline2 = airlineRepository.findByName(testName2);
        if (existingAirline2.isPresent()) {
            airlineRepository.delete(existingAirline2.get());
        }

        Airline airline1 = new Airline("Switzerland", testName1);
        Airline airline2 = new Airline("Switzerland", testName2);
        airlineRepository.save(airline1); // Save the airlines to the database
        airlineRepository.save(airline2);

        List<Airline> airlines = airlineRepository.findByCountry("Switzerland");

        assertThat(airlines).hasSize(2);
        assertThat(airlines).extracting(Airline::getName).containsExactlyInAnyOrder(testName1, testName2);

        airlineRepository.delete(airline1);
        airlineRepository.delete(airline2);
    }

    @Test
    void testDeleteAirline() {
        String testName = "Test Airline";
        Optional<Airline> existingAirline = airlineRepository.findByName(testName);
        if (existingAirline.isPresent()) {
            airlineRepository.delete(existingAirline.get());
        }
        Airline airline = new Airline("Switzerland", testName);
        airlineRepository.save(airline); // Save the airline to the database

        Optional<Airline> foundAirline = airlineRepository.findByName(testName);

        assertThat(foundAirline).isPresent();
        assertThat(foundAirline.get().getName()).isEqualTo(testName);

        airlineRepository.delete(airline);

        Optional<Airline> deletedAirline = airlineRepository.findByName(testName);

        assertThat(deletedAirline).isEmpty();
    }

    @Test
    void testUpdateAirline() {
        String testName = "Test Airline";
        String updatedName = "Updated Airline";
        Optional<Airline> existingAirline = airlineRepository.findByName(testName);
        if (existingAirline.isPresent()) {
            airlineRepository.delete(existingAirline.get());
        }
        Airline airline = new Airline("Switzerland", testName);
        airlineRepository.save(airline); // Save the airline to the database

        Optional<Airline> foundAirline = airlineRepository.findByName(testName);

        assertThat(foundAirline).isPresent();
        assertThat(foundAirline.get().getName()).isEqualTo(testName);

        Airline updatedAirline = new Airline(foundAirline.get().getId(), updatedName, foundAirline.get().getCountry());
        airlineRepository.save(updatedAirline);

        Optional<Airline> updatedFoundAirline = airlineRepository.findByName(updatedName);

        assertThat(updatedFoundAirline).isPresent();
        assertThat(updatedFoundAirline.get().getName()).isEqualTo(updatedName);

        airlineRepository.delete(updatedAirline);
    }
}