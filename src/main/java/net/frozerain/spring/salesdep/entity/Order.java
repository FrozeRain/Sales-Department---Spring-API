package net.frozerain.spring.salesdep.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "ORDERS")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(targetEntity = net.frozerain.spring.salesdep.entity.Client.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "CLIENT")
    private Client client;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATE")
    private Date date;
    
    @Column(name = "VALUE")
    private double price;

    public Order() {
    }

    public Order(Client client, Date date, double price) {
        this.client = client;
        this.date = date;
        this.price = price;
    }

    public String getClientFullName(){
        return this.client.getName();
    }

    public Long getClientFullId(){
        return this.client.getId();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", client=" + client +
                ", date=" + date +
                ", price=" + price +
                '}';
    }
}
