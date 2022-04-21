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
$ rails test
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
$ rails server
```

# How to Access Website

The site is hosted on Heroku via [this link](https://dogyou.herokuapp.com/).

You can choose to run the app in a local server:

```
$ rails server
```

# How to use DOGYOU

When you go to the root page, you will be greeted with the following home page:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164287045-8c854202-87d7-4c5c-8560-35f03c1e5ec4.png">

Click the sign up page to make a new account. You will be greeted with the sign up page:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164287143-2a8ca5d2-91aa-4d8c-ab03-b6cc0d7778c9.png">
Enter your information and check "Admin" to make the account an admin account.

After logging in, you are greeted with your profile:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164287335-32359bfe-b772-42bc-8d72-fac003375fb2.png">

The admin page contains useful tools to manage and view students, teams, sections, projects, comments and scores:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164287492-175ad22b-239a-4800-9873-2c882e7e524a.png">
On the left panel you can view students by team and quickly see students not in a team and add them to a team.

On the middle panel you can view students by section and quickly see students not assigned to a section and add them to a section.

On the right panel, you can view comments organized by what projects they are for and quickly view the comment by clicking on it and then assign a score to the recipient of the comment. You can also create projects and scores from this panel.

The Courses, Teams and Projects sections on the navigation bar allow you to manage all of the courses, teams and projects.

As a non-admin (student), a different view is shown upon logging in:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164287959-62d46cc1-1e7c-4c82-ba04-b76fbb2f3ab1.png">

My Sections allows you to quickly view and join sections:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164288023-b8bc7b2d-448a-40db-9ff7-87f54ab32f8e.png">

My Projects allows you to quickly view projects you are assigned and view all of the comments and your score for that project:
<img width="1792" alt="image" src="https://user-images.githubusercontent.com/16624272/164288326-752aacbf-e326-4030-96d5-a6bcd94e57e5.png">

# Presentation Slides

[Google Slides Link](https://docs.google.com/presentation/d/1cLoRKpmcc8A0HlRXBsrhNhvsSANv7twcw-r_2CjdGtg/edit?usp=sharing)

# Contributions

Michael Gulasy - Added to the user controller has_projects? and reworked the add_user_to_section. Added in params for relations to users, teams, and projects.

Landon Holland - Authorization for all controllers, parameter filtering for comments, and autofill for scores based on parameters.

Hunter Mills - Created Sessions and Admin Controllers. Worked on User Controller's add_user_to_section.

Cathyna Tong - Course, Project, Admin and User Controllers

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
