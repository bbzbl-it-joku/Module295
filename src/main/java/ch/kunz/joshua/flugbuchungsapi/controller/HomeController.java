package ch.kunz.joshua.flugbuchungsapi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SuppressWarnings("SameReturnValue")
@Controller
public class HomeController {
    @RequestMapping("/")
    public String home() {
        return "redirect:/swagger-ui.html";
    }
}