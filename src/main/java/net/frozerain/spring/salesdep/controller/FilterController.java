package net.frozerain.spring.salesdep.controller;

import net.frozerain.spring.salesdep.entity.Client;
import net.frozerain.spring.salesdep.entity.Order;
import net.frozerain.spring.salesdep.repository.ClientRepos;
import net.frozerain.spring.salesdep.repository.OrderRepos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Controller
@RequestMapping("/edit")
public class FilterController {
    @Autowired
    ClientRepos clientRepos;

    @Autowired
    OrderRepos orderRepos;

    @GetMapping("/{eType}")
    public String filter(@PathVariable(required = true) String eType,
                         @RequestParam(required = false, defaultValue = "") String filter,
                         Model model) {
        if (eType.equals("order")) {
            Iterable<Order> orders = (filter.isEmpty() ? orderRepos.findAll() : orderRepos.findAllByClientNameContaining(filter));

            model.addAttribute("isOrder", Boolean.TRUE);
            model.addAttribute("orders", orders);

        } else {
            Iterable<Client> clients = (filter.isEmpty() ? clientRepos.findAll() : clientRepos.findAllByNameContaining(filter));

            model.addAttribute("isOrder", Boolean.FALSE);
            model.addAttribute("clients", clients);

        }

        model.addAttribute("filter", filter);
        return "edit";
    }

    @GetMapping("/order/delete")
    public String delete(@RequestParam(required = true, name = "id") Order order, Model model) {
        if (order != null) {
            orderRepos.delete(order);
        }
        return "redirect:/edit/order";
    }

    @GetMapping("/{eType}/update")
    public String update(@PathVariable String eType,
                         @RequestParam Long id,
                         Model model) {
        Order order = null;
        Iterable<Client> iterable = null;

        if (eType.equals("order")) {
            Optional<Order> op = orderRepos.findById(id);
            if (op.isPresent()){
                order = op.get();
                iterable = clientRepos.findAllByIdIsNot(order.getClient().getId());
            }

            model.addAttribute("clientSel", iterable);
            model.addAttribute("sel", order);
            model.addAttribute("isOrder", Boolean.TRUE);
        } else {
            Client client = clientRepos.findById(id).get();

            model.addAttribute("client", client);
            model.addAttribute("isOrder", Boolean.FALSE);
        }
        return "update";
    }

    @PostMapping("/{eType}/updateSubmit")
    public String updateOrderSubmit(@PathVariable String eType,
                                    @RequestParam(required = true) Long selId,
                                    @RequestParam(required = false) String name,
                                    @RequestParam String date,
                                    @RequestParam(required = false, defaultValue = "0.00") double price,
                                    @RequestParam(required = false, defaultValue = "0") Long linkId) throws ParseException {
        if (eType.equals("order")) {
            Order order = orderRepos.findById(linkId).get();
            Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            order.setDate(date1);
            order.setPrice(price);
            order.setClient(clientRepos.findById(selId).get());

            orderRepos.saveAndFlush(order);
        } else {
            Client client = clientRepos.findById(selId).get();
            client.setName(name);
            client.setNumber(date);

            clientRepos.saveAndFlush(client);
        }
        return "redirect:/edit/" + eType;
    }
}
