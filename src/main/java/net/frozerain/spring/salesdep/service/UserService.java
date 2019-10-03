package net.frozerain.spring.salesdep.service;

import net.frozerain.spring.salesdep.entity.Role;
import net.frozerain.spring.salesdep.entity.User;
import net.frozerain.spring.salesdep.repository.UserRepos;
import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepos userRepos;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepos.findByUsername(username);

        if (user == null){
            System.out.println("EXCEPTION THROWED");
            throw new UsernameNotFoundException("User not found!");
        }
        return user;
    }

    public boolean addUser(User user) {
        User user1 = userRepos.findByUsername(user.getUsername());

        if (user1 != null){
            return false;
        }
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepos.saveAndFlush(user);
        return true;
    }

    public List<User> findAll() {
        return userRepos.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);
        user.setPassword2("confirm");
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::getAuthority)
                .collect(Collectors.toSet());
        user.getRoles().clear();

        for (String key: form.keySet()) {
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepos.saveAndFlush(user);
    }
}
