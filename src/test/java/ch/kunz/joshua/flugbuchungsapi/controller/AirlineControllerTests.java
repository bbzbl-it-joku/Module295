package ch.kunz.joshua.flugbuchungsapi.controller;

import ch.kunz.joshua.flugbuchungsapi.data.Airline;
import ch.kunz.joshua.flugbuchungsapi.repository.AirlineRepository;
import ch.kunz.joshua.flugbuchungsapi.utils.KeycloakUtils;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.AutoConfigureDataJpa;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.util.Assert.doesNotContain;


@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@AutoConfigureMockMvc
@AutoConfigureDataJpa
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(true)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class AirlineControllerTests {
    @Autowired
    private MockMvc api;
    @Autowired
    private AirlineRepository airlineRepository;
    private static String accessToken;

    @BeforeAll
    void setup() {
        accessToken = KeycloakUtils.getAccessToken();
        airlineRepository.save(new Airline("Swiss International Air Lines Ltd.", "Switzerland"));
        airlineRepository.save(new Airline("Deutsche Lufthansa AG", "Germany"));
        airlineRepository.save(new Airline("ANA", "Japan"));
    }

    @Test
    @Order(1)
    public void testGetAll() throws Exception {
        api.perform(get("/api/airline").header("Authorization", "Bearer " + accessToken))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Swiss International Air Lines Ltd.")))
                .andExpect(content().string(containsString("Deutsche Lufthansa AG")))
                .andExpect(content().string(containsString("ANA")));
    }

    @Test
    @Order(2)
    public void testGetByCountry() throws Exception {
        api.perform(get("/api/airline?country=Switzerland").header("Authorization", "Bearer " + accessToken))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Swiss International Air Lines Ltd.")));
    }

    @Test
    @Order(3)
    public void testGetByName() throws Exception {
        api.perform(get("/api/airline?name=ANA").header("Authorization", "Bearer " + accessToken))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("ANA")));
    }

    @Test
    @Order(4)
    public void testCreate() throws Exception {
        api.perform(post("/api/airline").header("Authorization", "Bearer " + accessToken).with(csrf())
                .contentType("application/json")
                .content("{\"name\":\"Air France\",\"country\":\"France\"}"))
                .andDo(print())
                .andExpect(status().isCreated())
                .andExpect(content().string(containsString("Air France")));

        api.perform(get("/api/airline").header("Authorization", "Bearer " + accessToken))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Air France")));

        Assertions.assertEquals(4, airlineRepository.count());
    }

    @Test
    @Order(5)
    public void testUpdate() throws Exception {
        if (airlineRepository.count() != 4) {
            airlineRepository.save(new Airline("Air France", "France"));
        }

        api.perform(put("/api/airline/4").header("Authorization", "Bearer " + accessToken).with(csrf())
                .contentType("application/json")
                .content("{\"name\":\"Air France\",\"country\":\"FranceIsShit\"}"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Air France")));

        api.perform(get("/api/airline").header("Authorization", "Bearer " + accessToken))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("FranceIsShit")));

        Assertions.assertEquals(4, airlineRepository.count());
    }

    @Test
    @Order(6)
    public void testDelete() throws Exception {
        api.perform(delete("/api/airline/4").header("Authorization", "Bearer " + accessToken).with(csrf()))
                .andDo(print())
                .andExpect(status().isOk());

        api.perform(get("/api/airline").header("Authorization", "Bearer " + accessToken))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Swiss International Air Lines Ltd.")))
                .andExpect(content().string(containsString("Deutsche Lufthansa AG")))
                .andExpect(content().string(containsString("ANA")))
                .andExpect(content().string(not(containsString("FranceIsShit"))));

        Assertions.assertEquals(3, airlineRepository.count());
        Assertions.assertTrue(airlineRepository.findById(4L).isEmpty());

    }

    @AfterAll
    void cleanup() {
        airlineRepository.deleteAll();
    }
}
