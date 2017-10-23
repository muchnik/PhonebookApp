package ru.alidi.muchnik.phonebook.app.dao;

import ru.alidi.muchnik.phonebook.app.model.Contact;
import ru.alidi.muchnik.phonebook.app.model.Number;

import java.util.List;

public interface ContactDao {

    void addContact(Contact contact);

    List<Contact> getAllContacts();

    void deleteContact(long contactId);

    Contact updateContact(Contact contact);

    Contact getContact(long contactId);

    List<Contact> searchContact(String search);

    void deleteNumber(long id);
}
