package ru.alidi.muchnik.phonebook.app.model;

public enum NumberType {
    MAIN("Main"), WORK("Work"), MOBILE("Mobile");

    private final String title;

    NumberType(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}
