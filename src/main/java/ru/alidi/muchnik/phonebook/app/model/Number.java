package ru.alidi.muchnik.phonebook.app.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "numbers")
public class Number implements Serializable {

    @Id
    @SequenceGenerator(name = "numbers_id_seq", sequenceName = "numbers_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "numbers_id_seq")
    private long id;

    @Column(name = "phonetype")
    @Enumerated(EnumType.STRING)
    private NumberType type;

    @Column(name = "phonenumber")
    private String phoneNumber;

    @ManyToOne
    @JoinColumn(name = "contactid")
    private Contact contact;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public NumberType getType() {
        return type;
    }

    public void setType(NumberType type) {
        this.type = type;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    @Override
    public String toString() {
        return "Number{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", contact=" + (contact == null ? "null" : contact.getId()) +
                '}';
    }
}
