package net.frozerain.spring.salesdep.controller;

import net.frozerain.spring.salesdep.entity.Client;
import net.frozerain.spring.salesdep.entity.Order;
import net.frozerain.spring.salesdep.repository.ClientRepos;
import net.frozerain.spring.salesdep.repository.OrderRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Date;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
    public String addClient(@Valid Client client,
                            BindingResult bindingResult,
                            Model model) {
        if (bindingResult.hasErrors()){
            Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorMap);
            model.addAttribute("client", client);
        } else {
            clientRepos.saveAndFlush(client);
            model.addAttribute("client", null);
        }

        Iterable<Client> clients = clientRepos.findAll();
        Iterable<Order> orders = orderRepos.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("clientSel", clients);
        model.addAttribute("orders", orders);
        return "main";
    }

    @PostMapping("/add/order")
    public String addOrder(@RequestParam(name = "select") Client client,
                           @RequestParam(name = "cost") String price,
                           Model model) {
        double orderPrice = 0.0;
        if (!price.isEmpty()){
            orderPrice = Double.parseDouble(price);
        }
        Date date = new Date();
        Order order = new Order(client, date, orderPrice);
        orderRepos.saveAndFlush(order);

        Iterable<Client> clients = clientRepos.findAll();
        Iterable<Order> orders = orderRepos.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("clientSel", clients);
        model.addAttribute("orders", orders);
        return "redirect:/main";
    }


}
