package ru.alidi.muchnik.phonebook.app.dao.impl;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.alidi.muchnik.phonebook.app.dao.ContactDao;
import ru.alidi.muchnik.phonebook.app.model.Contact;
import ru.alidi.muchnik.phonebook.app.model.Number;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ContactDaoImpl implements ContactDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addContact(Contact contact) {
        sessionFactory.getCurrentSession().persist(contact);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Contact> getAllContacts() {
        return sessionFactory.getCurrentSession().createCriteria(Contact.class).list();
    }

    @Override
    public void deleteContact(long contactId) {
        Contact contact = sessionFactory.getCurrentSession().load(Contact.class, contactId);
        this.sessionFactory.getCurrentSession().delete(contact);
    }

    @Override
    public Contact updateContact(Contact contact) {
        contact = (Contact) sessionFactory.getCurrentSession().merge(contact);
        return contact;
    }

    @Override
    public Contact getContact(long contactId) {
        return sessionFactory.getCurrentSession().get(Contact.class, contactId);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Contact> searchContact(String searchquery) {
        //Searching in firstname and lastname
        String hql = "from Contact where lower (firstname) like (:searchkey) or lower (lastname) like (:searchkey)";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("searchkey", "%" + searchquery.toLowerCase() + "%");
        return query.list();
    }

    @Override
    public void deleteNumber(long id) {
        Number number = sessionFactory.getCurrentSession().load(Number.class, id);
        this.sessionFactory.getCurrentSession().delete(number);
    }
}
