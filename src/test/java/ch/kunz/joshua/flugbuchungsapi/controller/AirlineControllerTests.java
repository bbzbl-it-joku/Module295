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
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;



@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@AutoConfigureMockMvc
@AutoConfigureDataJpa
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(false)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class AirlineControllerTests {
    @Autowired
    private MockMvc api;
    @Autowired
    private AirlineRepository airlineRepository;
    private String accessToken;

    @BeforeAll
    void setup() {
        if (accessToken == null) {
            accessToken = KeycloakUtils.getAccessToken();
        }

        airlineRepository.deleteAll();
        airlineRepository.save(new Airline("Swiss International Air Lines Ltd.", "Switzerland"));
        airlineRepository.save(new Airline("Deutsche Lufthansa AG", "Germany"));
        airlineRepository.save(new Airline("ANA", "Japan"));
    }

    @Test
    @Order(1)
    public void testGetAll() throws Exception {
        api.perform(get("/api/airline").header("Authorization", "Bearer " + accessToken)
                .with(csrf()))
        .andDo(print()).andExpect(status().isOk())
        .andExpect(content().string(containsString("Swiss International Air Lines Ltd.")));
    }

    @Test
    @Order(2)
    public void testGetById() throws Exception {
        api.perform(get("/api/airline/1").header("Authorization", "Bearer " + accessToken)
                .with(csrf()))
        .andDo(print()).andExpect(status().isOk())
        .andExpect(content().string(containsString("Swiss International Air Lines Ltd.")));
    }

    @Test
    @Order(3)
    public void testGetByName() throws Exception {
        api.perform(get("/api/airline?name=ANA").header("Authorization", "Bearer " + accessToken)
                .with(csrf()))
        .andDo(print()).andExpect(status().isOk())
        .andExpect(content().string(containsString("Japan")));
    }

    @Test
    @Order(4)
    public void testGetByCountry() throws Exception {
        api.perform(get("/api/airline?country=Switzerland").header("Authorization", "Bearer " + accessToken)
                .with(csrf()))
        .andDo(print()).andExpect(status().isOk())
        .andExpect(content().string(containsString("Swiss International Air Lines Ltd.")));
    }

    @Test
    @Order(5)
    public void testGetByNameAndCountry() throws Exception {
        api.perform(get("/api/airline?name=ANA&country=Japan").header("Authorization", "Bearer " + accessToken)
                .with(csrf()))
        .andDo(print()).andExpect(status().isOk())
        .andExpect(content().string(containsString("ANA")));
    }

    @Test
    @Order(6)
    public void testUpdateEntry() throws Exception {
        api.perform(put("/api/airline/1").header("Authorization", "Bearer " + accessToken)
                        .with(csrf())
                        .contentType("application/json")
                        .content("{\"name\":\"Swiss International Air Lines\",\"country\":\"TEST\"}"))
                .andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("TEST")));

        api.perform(get("/api/airline/1").header("Authorization", "Bearer " + accessToken)
                        .with(csrf()))
                .andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("TEST")));
    }

    @Test
    @Order(7)
    public void testCreateEntry() throws Exception {
        api.perform(post("/api/airline").header("Authorization", "Bearer " + accessToken)
                        .with(csrf())
                        .contentType("application/json")
                        .content("{\"name\":\"TEST\",\"country\":\"TEST\"}"))
                .andDo(print()).andExpect(status().isCreated())
                .andExpect(content().string(containsString("TEST")));

        api.perform(get("/api/airline?name=TEST").header("Authorization", "Bearer " + accessToken)
                        .with(csrf()))
                .andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("TEST")));
    }

    @Test
    @Order(8)
    public void testDeleteEntry() throws Exception {
        api.perform(delete("/api/airline/1").header("Authorization", "Bearer " + accessToken)
                        .with(csrf()))
                .andDo(print()).andExpect(status().isOk());

        api.perform(get("/api/airline/1").header("Authorization", "Bearer " + accessToken)
                        .with(csrf()))
                .andDo(print()).andExpect(status().isNotFound());

    }
}
