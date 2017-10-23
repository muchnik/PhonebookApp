package ru.alidi.muchnik.phonebook.app.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.alidi.muchnik.phonebook.app.model.Contact;
import ru.alidi.muchnik.phonebook.app.model.Number;
import ru.alidi.muchnik.phonebook.app.model.NumberType;
import ru.alidi.muchnik.phonebook.app.service.ContactService;

import java.io.IOException;
import java.util.List;

@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @RequestMapping(value = "/")
    public ModelAndView listContact(ModelAndView model) throws IOException {
        List<Contact> listContact = contactService.getAllContacts();
        model.addObject("listContact", listContact);
        model.setViewName("index");
        return model;
    }

    @RequestMapping(value = "/newContact", method = RequestMethod.GET)
    public ModelAndView newContact(ModelAndView model,
                                   @ModelAttribute(name = "contact") Contact contact,
                                   @ModelAttribute(name = "number") Number number) {
        model.addObject("contact", contact);
        model.addObject("number", number);
        model.addObject("numberTypes", NumberType.values());
        model.setViewName("contactUpdate");
        return model;
    }

    @RequestMapping(value = "/saveContact", method = RequestMethod.POST)
    public ModelAndView saveContact(@ModelAttribute Contact contact,
                                    @ModelAttribute Number number) {
        boolean toHome = false;

        // Add new number to existing contact
        if (number.getPhoneNumber() != null && contact.getId() != 0) {
            contact = contactService.updateContact(contact, number);
        }

        //New contact
        else if (number.getId() == 0 && contact.getId() == 0) {
            contactService.addContact(contact, number);
            toHome = true;
        }

        // Else, updating existing data
        else {
            contactService.updateContact(contact);
        }
        ModelAndView model = new ModelAndView();
        model.addObject("contact", contact);
        model.addObject("numberTypes", NumberType.values());
        model.setViewName(toHome ? "redirect:/" : "contactUpdate");
        return model;
    }

    @RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
    public ModelAndView deleteContact(@RequestParam long id) {
        contactService.deleteContact(id);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/deleteNumber", method = RequestMethod.GET)
    public ModelAndView deleteNumber(@RequestParam long id,
                                     @RequestParam(name = "contactid") long contactId,
                                     Number number,
                                     ModelAndView model) {
        contactService.deleteNumber(id);
        Contact contact = contactService.getContact(contactId);

        model.addObject("contact", contact);
        model.addObject("number", number);
        model.addObject("numberTypes", NumberType.values());
        model.setViewName("contactUpdate");
        return model;
    }

    @RequestMapping(value = "/editContact", method = RequestMethod.GET)
    public ModelAndView editContact(@RequestParam long id,
                                    Number number) {
        Contact contact = contactService.getContact(id);

        ModelAndView model = new ModelAndView("contactUpdate");
        model.addObject("contact", contact);
        model.addObject("number", number);
        model.addObject("numberTypes", NumberType.values());
        return model;
    }

    @RequestMapping(value = "/findContact", method = RequestMethod.GET)
    public ModelAndView findContact(@RequestParam String search) {
        List<Contact> listContact = contactService.searchContact(search);
        ModelAndView model = new ModelAndView("searchResults");
        model.addObject("listContact", listContact);
        return model;
    }
}
