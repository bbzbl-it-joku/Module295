package ch.kunz.joshua.flugbuchungsapi.airlinetests;

import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class AirlineTest {

    @Test
    void testAirlineConstructor() {
        Airline airline = new Airline("Switzerland", "Test Airline");
        assertEquals("Switzerland", airline.getCountry());
        assertEquals("Test Airline", airline.getName());
    }

    @Test
    void testAirlineConstructorWithId() {
        Airline airline = new Airline(1L, "Test Airline", "Switzerland");
        assertEquals(1L, airline.getId());
        assertEquals("Switzerland", airline.getCountry());
        assertEquals("Test Airline", airline.getName());
    }
}