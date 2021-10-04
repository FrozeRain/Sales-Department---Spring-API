package net.frozerain.spring.salesdep.repository;

import net.frozerain.spring.salesdep.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepos extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
