package net.frozerain.spring.salesdep.controller;

import net.frozerain.spring.salesdep.entity.Client;
import net.frozerain.spring.salesdep.entity.Order;
import net.frozerain.spring.salesdep.repository.ClientRepos;
import net.frozerain.spring.salesdep.repository.OrderRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.Map;

@Controller
public class FilterController {
    @Autowired
    ClientRepos clientRepos;

    @Autowired
    OrderRepos orderRepos;

    @GetMapping("/clientFilter")
    public String clientFilter(@RequestParam String key, Map<String, Object> model){
        Iterable<Client> clients;
        if (!key.isEmpty()) {
            clients = clientRepos.findAllByNameContaining(key);
        } else {
            clients = clientRepos.findAll();
        }

        model.put("clients", clients);
        return "clientFilter";
    }

    @GetMapping("/orderFilter")
    public String orderFilter(@RequestParam String key, Map<String, Object> model){
        Iterable<Order> orders;
        if (!key.isEmpty()){
            orders = orderRepos.findAllByClientNameContaining(key);
        } else {
            orders = orderRepos.findAll();
        }

        model.put("orders", orders);
        return "orderFilter";
    }

    @PostMapping("/orderDelete")
    public String deleteOrder(@RequestParam(name = "delete") int id) {
        Order order = orderRepos.findById(id);
        orderRepos.delete(order);

        return "redirect:/orderFilter?key=";
    }

    @PostMapping("/orderUpdate")
    public String updateOrder(@RequestParam(name = "update") int id, Map<String, Object> model){
        Order order = orderRepos.findById(id);
        Client client = order.getClient();
        Iterable<Client> iterable = clientRepos.findAllByIdIsNot(client.getId());
        model.put("clientSel", iterable);
        model.put("sel", order);
        return "orderUpdate";
    }

    @PostMapping("/orderUpdateSubmit")
    public String updateOrderSubmit(@RequestParam(name = "select") int id,
                                    @RequestParam(name = "date") String date,
                                    @RequestParam(name = "price") float price,
                                    @RequestParam(name = "link") int link_id) throws ParseException {
        Order order = orderRepos.findById(link_id);
        Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        order.setDate(date1);
        order.setPrice(price);
        order.setClient(clientRepos.findById(id));

        orderRepos.saveAndFlush(order);
        return "redirect:/orderFilter?key=";
    }
}
