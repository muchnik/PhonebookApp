package ru.alidi.muchnik.phonebook.app.service;

import ru.alidi.muchnik.phonebook.app.model.Contact;
import ru.alidi.muchnik.phonebook.app.model.Number;

import java.util.List;

public interface ContactService {

    void addContact(Contact contact, Number number);

    List<Contact> getAllContacts();

    void deleteContact(long contactId);

    Contact getContact(long contactId);

    Contact updateContact(Contact contact);

    Contact updateContact(Contact contact, Number number);

    List<Contact> searchContact(String searchData);

    void deleteNumber(long id);
}
