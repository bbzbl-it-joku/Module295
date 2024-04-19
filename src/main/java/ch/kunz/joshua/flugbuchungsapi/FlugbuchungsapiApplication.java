package ch.kunz.joshua.flugbuchungsapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class FlugbuchungsapiApplication {

	public static void main(String[] args) {
		SpringApplication.run(FlugbuchungsapiApplication.class, args);
	}
}
