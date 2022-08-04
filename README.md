# MakersBnB

## Instructions for using the app

1. Start by cloning this repo
2. Run bundler to install dependencies. Follow the instructions to install any that are missing and not automatically installed. 
3. set up your tables as follows:
4. enter ```# psql postgres``` in the terminal:
5. once in postgresql, enter the info found in db/migrations/01_create_databases.sql (as individual entries). This will create the databases.
6. navigate to the database with ```# \c makersbnb``` and enter all the info found in db/migrations/02_create_tables.sql. This will create the tables for the user experience.
7. navigate to the test database with ```# \c makersbnb_test``` and again enter all the info found in db/migrations/02_create_tables.sql. This will create the tables for testing. 
8. start up the server with ```$ rackup```
9. navigate to the relevant localhost address, which should be visible in the CLI. 
10. Use the website.
11. to view the info in the databases, navigate to the database you wish to view, then enter ```# \dt``` to view all tables.
12. to view a specific table, e.g. spaces, enter ```SELECT * FROM``` spaces
13. to run tests, run rspec

## Specification

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

## Minimum Viable Product

The items below were agreed to be the minimum viable product by the team:
```
So that
I can use MakersBnB
I want to be able to sign_up with a username

As a host
So that I can list a space
I want to be able to add a new space

As a host
So that I can list multiple spaces
I want to be able to add another space

As a guest
So that I can see plan my holiday
I want to see a list of properties available

As a guest
So that I can book a night at a space
I want to be able to make a booking request to the host

As a host
So that I can manage booking requests
I want to be able to see my booking requests

As a host
So that I can confirm a booking
I want to be able to approve or reject booking requests

As a host
So I know which spaces I have added
I want to see a list of the spaces I've added

As a user
So that I can see information specific to me,
I want to be able to login
```
-----

=======

***MVP***


![image_title](/images/domain_modelling.png)
