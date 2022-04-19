# Project 6: DOGYOU

This is a Ruby on Rails based peer evaluation tool, similar to the popular CATME tool.

# Dependencies

This project was built using:

- Ruby v3.0.1
- Rails v6.1
- Node v16

# How to Run Tests

Use command
```bash
rails test
```

# Usage

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Run the test development server by running:
```bash
rails s
```

# How to Access Website

The site is hosted on Heroku via [this link](https://frozen-cove-81747.herokuapp.com/).

You can choose to run the app in a local server:

```
$ rails server
```

# How to use DOGYOU

The tool works as follows...:
\< insert a lot of images here >

# Presentation Slides

[Google Slides Link](https://docs.google.com/presentation/d/1cLoRKpmcc8A0HlRXBsrhNhvsSANv7twcw-r_2CjdGtg/edit?usp=sharing)

# Contributions

Michael Gulasy - Added to the user controller has_projects? and reworked the add_user_to_section. Added in params for relations to users, teams, and projects.

Landon Holland - Authorization for all controllers, parameter filtering for comments, and autofill for scores based on parameters.

Hunter Mills - Created Sessions and Admin Controllers. Worked on User Controller's add_user_to_section.

Cathyna Tong - Course, Project, Admin and User Controllers

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
