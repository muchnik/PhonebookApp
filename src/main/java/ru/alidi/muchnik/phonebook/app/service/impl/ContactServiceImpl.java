package ru.alidi.muchnik.phonebook.app.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.alidi.muchnik.phonebook.app.dao.ContactDao;
import ru.alidi.muchnik.phonebook.app.model.Contact;
import ru.alidi.muchnik.phonebook.app.model.Number;
import ru.alidi.muchnik.phonebook.app.service.ContactService;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactDao contactDao;

    public void setContactDao(ContactDao contactDao) {
        this.contactDao = contactDao;
    }

    @Override
    @Transactional
    public void addContact(Contact contact, Number number) {
        ArrayList<Number> numbersList = new ArrayList<>();
        number.setContact(contact);
        numbersList.add(number);
        contact.setNumbers(numbersList);
        contactDao.addContact(contact);
    }

    @Override
    @Transactional
    public List<Contact> getAllContacts() {
        return contactDao.getAllContacts();
    }

    @Override
    @Transactional
    public void deleteContact(long contactId) {
        contactDao.deleteContact(contactId);
    }

    @Override
    @Transactional
    public Contact getContact(long contactId) {
        return contactDao.getContact(contactId);
    }

    @Override
    @Transactional
    public Contact updateContact(Contact contact) {
        return contactDao.updateContact(contact);
    }

    @Override
    @Transactional
    public Contact updateContact(Contact contact, Number number) {
        number.setContact(contact);
        if (contact.getNumbers() == null){
            ArrayList<Number> numbersList = new ArrayList<>();
            numbersList.add(number);
            contact.setNumbers(numbersList);
        } else {
            contact.addNumbers(number);
        }
        number.setId(0); //todo fix the wrong number from jsp
        return contactDao.updateContact(contact);
    }

    @Override
    @Transactional
    public List<Contact> searchContact(String searchData) {
        return contactDao.searchContact(searchData);
    }

    @Override
    @Transactional
    public void deleteNumber(long id) {
        contactDao.deleteNumber(id);
    }

}
