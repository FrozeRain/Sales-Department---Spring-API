package net.frozerain.spring.salesdep.repository;

import net.frozerain.spring.salesdep.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ClientRepos extends JpaRepository<Client, Long> {
    Client findByName(String name);

    Client findById(int id);

    List<Client> findAllByNameContaining(String name);

    List<Client> findAllByIdIsNot(int id);
}
