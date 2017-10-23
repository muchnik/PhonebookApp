### Readme ###

This is a web-application that implements simple CRUD interface, allowing user to
create, read, update, delete and search over contacts from database. With ability to add multiple numbers to single contact. 

It is realization of test assignment for ALIDI company.

### Task

Create a web-application using spring-boot, hibernate, postgres
which references phone book containing fields: name, phone type and phone number.
Also app should have ability to delete, edit, read and search over this contacts.

### Install and run

1. Install postgresql (im using PostgreSQL 10).
2. Create empty database named 'phonebook'
3. Restore database from backup (which you cat get from /db/phonebook.backup)

In pgadmin right click on phonebook database -> restore, then choose phonebook.backup

4. OR you can restore database from plaintext (which you can get from /db/phonebook_plaintext.sql)

Run CMD, go to your postgres folder bin (like C:\Programs\PostgreSQL\bin)

Restore database with command:
    
    > psql -p 4444 -U postgres phonebook < C:/phonebook_plaintext.sql
    >> Where -p 4444 is a port, -h yourhost, -U postgres is a user
5. Fill the actual database settings in /resources/application.properties

    > Pay attention im using not a standart port!
    * spring.datasource.url = jdbc:postgresql://localhost:4444/phonebook
    * spring.datasource.username = postgres
    * spring.datasource.password = 1234
6. Run the application with maven command: «mvn spring-boot:run»
It will deploy project on tomcat embedded server right from your IDE.
7. Go to http://localhost.8080

##### Contacts

muchnik.ak@gmail.com
