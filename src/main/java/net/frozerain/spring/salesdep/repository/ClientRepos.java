package net.frozerain.spring.salesdep.repository;

import net.frozerain.spring.salesdep.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ClientRepos extends JpaRepository<Client, Long> {
    Client findByName(String name);

    Optional<Client> findById(Long id);

    List<Client> findAllByNameContaining(String name);

    List<Client> findAllByIdIsNot(Long id);
}
