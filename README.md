## SKillDistillery Extended Learning Platform

### Midterm Team Project for Skill Distillery

* Neal Savant
* Frank Martin
* JP Sypniewski

### Overview

The Extended Learning Platform (ELP) is a blog-style site that provides quick information about programming topics.  The target audience is any person looking to learn and share more information about programming.

### Description

Upon landing on the site, users are presented a homepage with a greeting.  On the navigation bar, users can log in, create an account, or go directly to an index of topics.  Without logging in or creating an account, users can view specific topics, and the comments from other users on those topics.  Upon logging in or creating an account, the user can also update a topic, comment on a topic, and create a new topic.  The administrator of the site has additional privileges, including the ability to hide comments, and enable/disable other users.  Upon disabling of a user, any log-in attempt will fail, although that user's comments are not immediately hidden.

[Extended Learning Platform Site](http://3.137.38.238:8080/ExtendedLearning/)

Note that there is no security for password protection, so please do not use any private information.

### Implementation

The project is built with Spring Boot and JPA with a MySQL database deployed to AWS EC2.

*Database Schema*
![ELP Schema](/DB/midtermDB.png)

From the database, the JPA is designed to create entities for Spring Boot.  The main entities for usage are the Profile and Topic entities, which encompass other information as follows:
* Profile - incl. User (incl. Logs), Image
* Topic - incl. Resource (incl. Image), Content, Image, Logs, Comments

The database accessor objects in Spring Boot are called within controllers to provide the specific model for the Java Server Page views.  A database accessor object was created for nearly every table within the database, with the exception coming for Profile and User objects, as the Profile object includes a User object on a one-to-one relationship.  The controllers were limited to a Topic controller and a (somewhat misnamed) User controller, as these are the primary models needed when displaying a view to the user.

### Technologies and Methodologies Used

* Java 8 - programming language
* Spring Boot MVC
* Spring Tool Suite
* JPA
* JSTL
* MySQL
* MAMP - local MySQL hosting
* HTML/CSS
* Bootstrap
* Github/Git - version control
* AWS EC2
* Gradle
* Tomcat
* Trello
* Agile development

### Lessons Learned
* Define and document user stories with granularity during the planning phase of the project, follow these guidelines throughout project to ensure MVP
* Update entities within persistence.xml as they are created
* Follow Spring Boot setup instructions precisely to avoid later setup troubleshooting
