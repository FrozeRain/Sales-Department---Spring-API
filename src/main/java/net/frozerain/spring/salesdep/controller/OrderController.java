package net.frozerain.spring.salesdep.controller;

import net.frozerain.spring.salesdep.entity.Client;
import net.frozerain.spring.salesdep.entity.Order;
import net.frozerain.spring.salesdep.repository.ClientRepos;
import net.frozerain.spring.salesdep.repository.OrderRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class OrderController {
    @Autowired
    private ClientRepos clientRepos;

    @Autowired
    private OrderRepos orderRepos;

    @GetMapping("/")
    public String welcome() {
        return "welcome";
    }

    @GetMapping("/main")
    public String main(Model model) {
        Iterable<Client> clients = clientRepos.findAll();
        Iterable<Order> orders = orderRepos.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("clientSel", clients);
        model.addAttribute("orders", orders);
        return "main";
    }

    @PostMapping("/main")
    public String addClient(@RequestParam(name = "name", required = true) String name,
                            @RequestParam(name = "number") String number,
                            Model model) {
        Client client = new Client(name, number);
        clientRepos.saveAndFlush(client);

        Iterable<Client> clients = clientRepos.findAll();
        Iterable<Order> orders = orderRepos.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("clientSel", clients);
        model.addAttribute("orders", orders);
        return "main";
    }

    @PostMapping("/add")
    public String addOrder(@RequestParam(name = "select", required = true) int id,
                           @RequestParam(name = "cost", required = true) float price,
                           Model model) {
        Client client1 = clientRepos.findById(id);
        Date date = new Date();
        Order order = new Order(client1, date, price);
        orderRepos.saveAndFlush(order);

        Iterable<Client> clients = clientRepos.findAll();
        Iterable<Order> orders = orderRepos.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("clientSel", clients);
        model.addAttribute("orders", orders);
        return "redirect:/main";
    }


}
