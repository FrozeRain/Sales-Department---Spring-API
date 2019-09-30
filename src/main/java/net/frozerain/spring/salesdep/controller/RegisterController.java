package net.frozerain.spring.salesdep.controller;

import net.frozerain.spring.salesdep.entity.Role;
import net.frozerain.spring.salesdep.entity.User;
import net.frozerain.spring.salesdep.repository.UserRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;

@Controller
public class RegisterController {
    @Autowired
    private UserRepos userRepos;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("message", "");
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model) {
        User user1 = userRepos.findByUsername(user.getUsername());

        if (user.getUsername().isEmpty() || user.getPassword().isEmpty()) {
            model.addAttribute("message", "Fields cannot be EMPTY!");
            return "registration";
        }

        if (user1 != null) {
            model.addAttribute("message", "User exists!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepos.saveAndFlush(user);
        return "redirect:/login";
    }
}
