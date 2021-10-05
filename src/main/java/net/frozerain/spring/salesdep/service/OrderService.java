package net.frozerain.spring.salesdep.service;

import net.frozerain.spring.salesdep.entity.Client;
import net.frozerain.spring.salesdep.entity.Order;
import net.frozerain.spring.salesdep.repository.ClientRepos;
import net.frozerain.spring.salesdep.repository.OrderRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class OrderService {
    @Autowired
    private ClientRepos clientRepos;

    @Autowired
    private OrderRepos orderRepos;

    public void findAllRepos(Model model){
        Iterable<Client> clients = clientRepos.findAll();
        Iterable<Order> orders = orderRepos.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("clientSel", clients);
        model.addAttribute("orders", orders);
    }

    public void saveOrder(Order order){
        orderRepos.saveAndFlush(order);
    }

    public void saveClient(Client client){
        clientRepos.saveAndFlush(client);
    }
}
