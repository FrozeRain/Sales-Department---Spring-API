package net.frozerain.spring.salesdep.repository;

import net.frozerain.spring.salesdep.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepos extends JpaRepository<Order, Long> {
    void deleteById(int id);

    List<Order> findAllByClientNameContaining(String clientName);

    List<Order> findAllByIdIsNot(Long id);
}
