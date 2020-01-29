-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SD_ELP
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SD_ELP` ;

-- -----------------------------------------------------
-- Schema SD_ELP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SD_ELP` DEFAULT CHARACTER SET utf8 ;
USE `SD_ELP` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic` ;

CREATE TABLE IF NOT EXISTS `topic` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `log` ;

CREATE TABLE IF NOT EXISTS `log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time_stamp` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `topic_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_user_idx` (`user_id` ASC),
  INDEX `fk_log_content_index1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_log_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_content_index1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `image` ;

CREATE TABLE IF NOT EXISTS `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content_img_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `resource_url` VARCHAR(5000) NOT NULL,
  `topic_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `image_id` INT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_resource_images1_idx` (`image_id` ASC),
  INDEX `fk_resource_content_index1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_resource_images1`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resource_content_index1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `topic_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_content_topic1_idx` (`topic_id` ASC),
  CONSTRAINT `fk_content_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `image_id` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `job_title` VARCHAR(100) NULL,
  `about` VARCHAR(2500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_image1_idx` (`image_id` ASC),
  INDEX `fk_profile_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_profile_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic_comment` ;

CREATE TABLE IF NOT EXISTS `topic_comment` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `topic_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_topic1_idx` (`topic_id` ASC),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `topic_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `topic_image` ;

CREATE TABLE IF NOT EXISTS `topic_image` (
  `topic_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  PRIMARY KEY (`topic_id`, `image_id`),
  INDEX `fk_topic_image_image1_idx` (`image_id` ASC),
  CONSTRAINT `fk_topic_image_topic1`
    FOREIGN KEY (`topic_id`)
    REFERENCES `topic` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_topic_image_image1`
    FOREIGN KEY (`image_id`)
    REFERENCES `image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS sdelpuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'sdelpuser'@'localhost' IDENTIFIED BY '694881fCmJ';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'sdelpuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `user` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`, `active`) VALUES (1, 'admin', 'admin', 'ADMIN', '2020-01-23', '2020-01-23', 1);
INSERT INTO `user` (`id`, `username`, `password`, `role`, `created_at`, `updated_at`, `active`) VALUES (2, 'JohnSmitty', 'user', 'USER', '2020-01-24', '2020-01-24', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (1, 'C# vs Java', '2020-01-28', '2020-01-28', NULL);
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (2, '47 Questions I’ve Been Asked In Junior Software Developer Interviews', '2020-01-28', '2020-01-28', NULL);
INSERT INTO `topic` (`id`, `title`, `created_at`, `updated_at`, `active`) VALUES (3, 'Why I learned React', '2020-01-28', '2020-01-28', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `log`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `log` (`id`, `time_stamp`, `user_id`, `topic_id`) VALUES (1, '2020-01-23', 1, 1);
INSERT INTO `log` (`id`, `time_stamp`, `user_id`, `topic_id`) VALUES (2, '2020-01-24', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `image`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `image` (`id`, `content_img_url`) VALUES (1, 'https://i.imgur.com/dhMTDTz.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (2, 'https://i.imgur.com/TBN3q4j.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (3, 'https://i.imgur.com/r8lFFTl.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (4, 'https://reactjs.org/logo-og.png');
INSERT INTO `image` (`id`, `content_img_url`) VALUES (DEFAULT, '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `resource` (`id`, `title`, `resource_url`, `topic_id`, `created_at`, `updated_at`, `image_id`, `active`) VALUES (1, 'C# vs Java', 'https://www.geeksforgeeks.org/java-vs-c-sharp/', 1, '2020-01-28', '2020-01-28', 1, NULL);
INSERT INTO `resource` (`id`, `title`, `resource_url`, `topic_id`, `created_at`, `updated_at`, `image_id`, `active`) VALUES (2, 'React Homepage', 'https://reactjs.org/', 3, '2020-01-28', '2020-01-28', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (1, 'C# vs Java are two of the leading programming languages in the world to learn and earn. Both of them are high-level programming languages sharing several similarities, including an object-oriented approach to programming and having a being highly influenced by C++.\n\nWhile Java is a language considered to be among the best options for client-side web applications, C# leads the application development for the Microsoft ecosystem from the front.\n\nThere is a galore of differences between the two general-purpose programming languages that we will explore shortly. But before that, let’s get a brief introduction to C# and Java.\n\nJava – The Popular Programming Language of the Web\nDeveloped by James Gosling at Sun Microsystems, Java made its debut appearance in May of 1995. The general-purpose programming language is concurrent, class-based, and object-oriented. It is specifically designed to have fewer implementation dependencies.\n\nJava works on the mantra of WORA (Write Once, Run Anywhere). This simply means that the compiled Java code (bytecode) is able to run on different platforms that provide support for Java without the need for recompilation.\n\nJava is heavily inspired by C++. As a result, much of its syntax is derived from C++. The latest version of Java, which is Java 11 and also an LTS (Long-Term Support) version, was released on 25th September 2018.\n\nC# - The Programming Language of the Microsoft Ecosystem\nDesigned by Anders Hejlsberg, C# saw the light of the day sometime in 2000. C# is an imperative, multi-paradigm, object-oriented, general-purpose programming language. It is one of the programming languages designed for the Common Language Infrastructure.\n\nThe high-level programming language was developed by Microsoft within its .NET initiative. Later, it was approved as a standard by ECMA and ISO. The latest version of C# is 7.3, released in 2018.\n\n\nC# vs Java: The Battle Begins\nApplication Development\nThe Java programming language is typically used for developing complex web-based, highly concurrent applications in an open-source ecosystem. C#, on the other hand, is used for game, mobile, and web application development specifically for Microsoft platforms.\n\nWhile Java is a great choice for building messaging applications, C# has a better ability for developing virtual reality projects. The programming language is specifically powerful for building Windows-based desktop applications and games.\n\nThere are a number of tools available for allowing applications written in C# to be used over mobile and desktop belonging to different non-Microsoft-based operating systems.\n\nArrays\nBoth C# and Java support arrays. However, the way each of the programming languages uses them is different. While arrays in Java are a direct specialization of the object, arrays in C# are a specialization of the system.\n\nAlso, Java provides support for only jagged arrays (also known as an array of arrays). C#, on the other hand, supports jagged arrays as well as multi-dimensional arrays.\n\nClass Properties\nUnlike Java, C# has something called class properties. In order to offer a flexible mechanism for some class to expose private fields, the class property is used. It is a member of the class.\n\nThough Java doesn’t provide support for properties, it can be implemented by defining a pair of accessor and mutator methods.\n\nClosure Functionality\nThough both C# and Java offer anonymous methods, only the former offers anonymous methods providing closure functionality.\n\nCode Execution\nThe Java programming language is designed to run on any Java platform with the assistance of JRE (Java Runtime Environment). In Java, the written source code is first compiled into bytecode. It is then converted into machine code that is ready to be executed on any JRE.\n\nThe C# programming language, on the other side, is designed to execute on CLR (Common Language Runtime).\n\nThe source code in C# is interpreted into bytecode, known as MSIL (Microsoft Intermediate Language), which is then compiled by CLR. The JIT compiler converts the MSIL into native machine code thereafter.\n\nCommunity, Resources, and Standardization\nCompared to Java, C# resources are very limited. The C# libraries work only within the Microsoft ecosystem. On the other hand, the Java library and resource ecosystem are humongous in addition to being well-documented.\n\nJava is backed by a huge community that provides not only free-to-use libraries but ones that are open-source too. Hence, they can be modified and tweaked as per the requirements. Contrarily, free libraries from the Microsoft community is a downer for C#.\n\nEven though Java is a proprietary product of Oracle, the Java API is primarily controlled and managed via an open community process. On the other hand, the C# API is completely controlled by Microsoft and the C# is defined by ECMA and ISO standards.\n\nConditional Compilation\nC# allows using conditional compilation by means of preprocessor directives. However, there is no conditional compilation possible in Java. The feature allows defining methods that are compiled when specific symbols are defined.\n\nTypically, conditional compilation is used with methods that are used solely for debug builds of a software or application. Conditional compilation can be used for automatically removing the code for release builds if the code is useful only during the debugging process.\n\nDelegates\nJava doesn’t have delegates while C# has them. Delegates are type-safe method pointers that are used for implementing event handling.\n\nThe debate about delegates being good or bad is open. Some argue that the use of delegates complicates the method invocation model. This is because they are handled via something called reflection, which is a slow process.\n\nThose in favor of delegates stress that using delegates can simplify the code by means of eliminating the need to declare new classes, which are solely created to hook to events.\n\nEnumerations\nThe C# programming languages provide support for enumerations, which are type-safe value types. These are limited to a defined set of constant variables and structures that are user-defined value types.\n\nThough Java doesn’t have support for enumerations, it is possible to specify a class for emulating them.\n\nNote: - C# supports much more fundamental data types as well as allows more extension to the value types than Java.\n\nException Handling\nAlthough exception handling is available in both the programming languages, the treatment the feature receives is different. Java offers a clear distinction between checked and unchecked exceptions, hence supports both.\n\nIn C#, on the contrary, there is no provision for checked exceptions and only unchecked exceptions are available. However, unlike Java, C# supports the functionality to catch arithmetic exceptions.\n\nCheck out best books for learning Java!\n\nExplicit Member Implementation\nC# has something called explicit member implementation, while Java doesn’t. The feature allows a class to implement methods of an interface other than the class methods. It also allows for implementing two distinct interfaces that have a method of the same name.\n\nGenerics\nIn Java, the generics feature is compiler-assisted and implemented by using erasures. Upon the Java code successfully compiled to bytecode, information about generic types is lost. C#, alternatively, has a better provision for the generics feature.\n\nIn C#, generics are integrated into the CLI. Hence, the information about generics is preserved even after compilation. Moreover, the programming language allows the type information to be available at runtime.\n\nGoto Statement\nIn order to transfer the program control directly to a labeled statement, the goto statement is used. While Java doesn’t have any provision for using the goto statement, C# provides support for the same.\n\nAlthough the typical use of a goto statement is for transferring control to a specific switch-case label (or the default label in a switch statement), it can also be used in some scenarios for exiting from deeply nested loops.\n\nIDEs and Text Editors\nCompared to C#, Java has a gigantic arsenal of tools. #develop, MonoDevelop, and Visual Studio are the most-preferred IDEs for C#. Eclipse, IntelliJ IDEA, and NetBeans are the big three of Java IDEs along with several other great IDEs and numerous text editors to choose from.\n\nInbuilt Data Types Passed by Value\nIn the Java programming language, the built-in data types that are passed by value are named primitive types. On the other hand, simple types are the label given to inbuilt data types that are passed by value in C#.\n\nIterator\nWhile C# has the IEnumerator, Java has Iterator for the same purpose. However, there are several dissimilarities between the two, described as follows:\n\nIterator has the remove method for removing elements from the underlying collection. IEnumerator has no equivalent of it\nIterator has the hasNext method, while IEnumerator has MoveNext method for verifying the result\nThe function of Iterator’s next method is replicated by IEnumerator’s MoveNext method\nWhile Iterator’s next method returns the next element in the collection, IEnumerator necessitates for using the Current property after calling the MoveNext method\nManaged and Unmanaged Code\nThere are several errors that are exclusive to the C# programming language. This is due to its support for both managed and unmanaged code. Java only supports pure managed code. However, C#’s support of both types of code allows it to interface the same with existing code.\n\nMethods by Default\nA virtual method guarantees that the most overridden method of an object is called. All methods in Java are virtual by default, while C# has methods that are non-virtual by default.\n\nNamespaces\nThough both C# and Java have namespaces, the namespace in C# doesn’t specify the location of the source file. Also, the C# programming language features creating aliases for long namespaces.\n\nThe feature also offers a workaround for preventing namespace clashes in the code when identical types are imported into the code base. In order to use aliases for a namespace, the using keyword is used.\n\nAn alias namespace belongs to the scope of the namespace it is declared in. Upon code compilation, the alias is put in effect by the generation of a token for the fully qualified name.\n\nOperator Overloading\nOperator overloading is a feature that allows redefining the operation of an operator for user-defined data types. Java’s design philosophy stresses that the abuse of operator overloading can result in code that is harder to understand as well as difficult to debug.\n\nTherefore, operator overloading is absent in the Java programming language. The lack of feature somewhat makes Java unsuitable for developing mathematics-based programs.\n\nNonetheless, operator overloading is available in C# because its design philosophy supports the idea that when used prudently, the feature can make the code more readable and succinct.\n\nOutput Parameters\nJava doesn’t have support for output parameters. C#, contrarily, supports the feature. It assists in returning multiple values.\n\nParadigm\nJava is a class-based, object-oriented language derived from C++. The high-level, robust, secured, general-purpose programming language is developed by Oracle.\n\nC# is an object-oriented, component-oriented, functional, programming language that runs on the .Net Framework. The high-level, strongly-typed, general purpose programming language is developed and maintained by Microsoft.\n\nPointers\nA pointer is a variable that explicitly stores memory addresses. It can be modified to point to any random address. Although pointers exist in both Java and C#, it is not a first-class language concept in the former.\n\nPortability\nC# is specifically designed by Microsoft to run and develop applications for its various platforms. Java, on the contrary, offers a great deal of multi-platform support thanks to its machine-independent bytecode.\n\nIn any Java program, the code is converted into bytecode by the Java compiler. Then, this compiled bytecode can be executed on any OS having a compatible JRE installed. Source code once written in Java can run on any platform, which is one of its best benefits.\n\nPolymorphism\nPolymorphism is available by default in the Java programming language. In C#, however, polymorphism can be used only after invoking the virtual keyword in the base class and then invoking the override keyword in the derived class.\n\nCheck out important features of Java programming language\n\nShipping and Installation\nA vast number of C# libraries are shipped with a .NET framework installer along with an IDE, typically Visual Studio.\n\nJava, on the other hand, requires the JDK (Java Development Kit) to be installed on a system. It comes with the Java compiler and the JRE (Java Runtime Environment). No pre-packaged IDE is available. Hence, you need to download and install one manually.\n\nSource File\nIt is mandatory for a Java source file to match the name of the only public class inside it. On the contrary, no such rule exists for C#, which also allows for having multiple public classes inside the same source file.\n\nStructures and Unions\nC# provides support for structures and unions. On the other hand, Java doesn’t provide support for either structures or unions.\n\nThe strictfp Keyword\nFloating point calculations are platform-dependent. There is no way in C# to guarantee that the result of some floating point operation remains identical across platforms. However, Java has the strictfp keyword for serving the same purpose.\n\nSome important points to remember regarding the strictfp keyword are:\n\nAll methods and nested types declared in any class or interface that is declared using the keyword will implicitly gain the strictfp property\nBecause methods belonging to an interface are abstract implicitly, the keyword can’t be used with a method inside an interface\nIt can be used only with classes, interfaces, and methods\nThough not usable with abstract methods, it can be used with abstract classes and interfaces\nUnsigned Primitive Numeric Types\nJava has no provision for unsigned primitive numeric types, while C# has. Java’s inability of the feature makes it somewhat unsuitable for low-level programming.\n\nHowever, it is widely believed in the programming community that mixing signed and unsigned variables can result in bad code quality.\n\nUser-defined Casts\nA cast in programming is simply an explicit conversion. It requires a cast operator. Casting is required when there is a chance of either the information being lost or failure of implicit (automatic) conversion.\n\nThe C# programming language provides support for user-defined casts while Java doesn’t.\n\nConclusion\nThough there are several differences between Java and C#, there aren’t any significant speed or performance boosts that one can get from going for either language over the other.\n\nHence, all about choosing between the two high-level, general-purpose programming languages boils down to the platform of choice for application development as well as the preference of the developer or development team.\n\nCheck out top-rated C# tutorials for improving your skills or go for these best Java tutorials to step up your coding prowess.', 1, '2020-01-28', '2020-01-28', NULL);
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (2, 'Interviewing can be difficult, especially if you are the new kid.\nGetting that first job is the hardest and you’ll probably have a lot of competition. One of the best things you can do to stick out is prepare yourself! Get an idea of what you may be asked and have an answer prepared.\nAs a newbie, the majority of your questions will likely be cultural/behavioral. These questions are rarely of the “yes/no” variety, so you’ll have to have some stories ready to go. These are a little difficult to pull out of your back pocket when you’re in a stressful situation. Know what you’re going to tell your interviewer when they ask about a time you dealt with coworker conflicts, code breaking, group programming experiences, etc.\nTo help you get started, here are questions that I have been asked throughout my “first job search” journey!\nCultural Questions\n1. Tell me about yourself/elevator pitch\n2. Why do you want to work at (company you are interviewing for)?\n3. Why should we consider you over another candidate that has similar educational background?\n4. Why should we consider you over a candidate who has a CS degree?\nConversely, if you have a CS degree, you may be asked why you should be considered over a candidate who has bootcamp experience\n5. Tell me about your experience at (bootcamp or university)\n6. Tell me about a time you experienced a problem with (specific project on resume) and how you solved it/overcame it\n7. Tell me about a challenge with (specific project on resume)\n8. Tell me about your favorite part of working on (specific project)\n9. Tell me about an issue you encountered with a teammate/classmate (personal or code related) and how you resolved it\n10. In a group setting, do you pin yourself as more of a leader or a follower? Why?\n11. If you take on a leader role, what is your philosophy on leading others?\n12. If you take on a follower role, what is your philosophy on being a quality team contributor? Do you see yourself as a leader eventually? What makes you not take on leadership qualities now?\n13. Which of our specific company values do you identify with the most and why?\n14. What makes you want to change careers from (current/most recent career) to software development?\n15. What skills from (your previous career/job) can you adapt to software development? How will they help you be a better developer?\n16. You invested time and money into your most recent career as a (past career/job title)… how do you feel about this? Do you feel like it was a wasted investment?\n17. What have you been doing between graduation and now to keep up with technology? What have you been practicing? Have you been working on any personal projects?\n18. Tell me about your personal projects and why you chose to work on it. Which one is your favorite and why?\n19. In the past 6 months, what have you done outside of work or school to learn more in the field? (book references, classes, etc)\n20. You mentioned liking (specific book or podcast or news source), I like it too. Tell me about what you enjoy about this thing and how you would use that knowledge in your work. (great opportunity to connect and geek out with your interviewer OR get caught in a lie! Be careful.)\n21. When you were doing that additional learning, what motivated your decisions about what to learn and why? What are three things you found valuable in that learning?\n22. What is your view on continuing education and being a lifelong learner?\n23. Let’s say you are on the job and come across a problem in your code/whatever. Tell me about your process to figure it out.\n24. What does company culture mean to you?\n25. Rate from least important to most important to you: company culture, salary, educational experiences, benefits, location\n26. Professionally, what are you good at?\n27. Professionally, what are you not so good at? Is there anything that you refuse to do?\n28. How do you feel taking direction from a superior?\n29. What drove you to choose a front-end or back-end focus?\n30. What direction would you like to go in moving forward with your developer career?\nTechnical Questions\n31. What kind of language is (language that is on your resume or in their stack)?\n32. Why (database on your resume) and not (another database)? What are the benefits? What are the drawbacks?\n33. Tell me about (cloud platform, like Heroku) and your experience with it\n34. Tell me about (framework on your resume). Describe it to me like I am a new developer and I am interested in learning more about the technology.\n35. Describe to me an MVC framework. What is each component responsible for?\n36. How would you set up this data (set of data, probably two models/tables) in a relational database? What relationships would you establish?\n37. Can you code “hello world” in (language) for me on the board?\n38. What do you like most about (framework/language)? Why?\n39. What do you dislike most about (framework/language)? Why?\n40. Write a function that gives me the sum of this array of numbers (ex. numbers = [1, 2, 3])\n41. Great. That worked. Now do it another way. How can we refactor this? How can we make it more efficient and optimize it? Are you repeating yourself in any ways here with this function?\n42. Tell me about how you implemented OAuth in (project)\n43. Tell me about the HTTP request methods\n44. Describe to me a RESTful API\n45. What is the importance of testing your code? Why do you value testing your code?\n46. If you were to write acceptance tests for the functionality of a vending machine, how would you write them?\n47. Tell me about JSON format\nInterviewing gets easier the more you do it. Rejections happen, but you’ll be a better interviewer for your next opportunity. Good luck!', 2, '2020-01-28', '2020-01-28', NULL);
INSERT INTO `content` (`id`, `content`, `topic_id`, `created_at`, `updated_at`, `active`) VALUES (3, 'React has an awesome community.\nThe one reason React has gained so much popularity so fast is its origin. Initially React was created by Facebook to maintain and develop its front-end app.\nWhen Facebook decided to open source React, it was already battle proven in a large application and ready to use. So the decision makers thought like this: „If they run the whole Facebook on React, then I’m using it to my next startup” … and it started. Additionally React proved to be very developer friendly and extensible. Everyone can create and publish his/her own component or contribute to the main projects like React or Redux. Today React code repository is about 3 times as popular as Angular. So React is a clear winner when it comes to community support.\n\n2. React is scalable.\n\nThe first and main evidence of React scalability is Facebook. It’s made entirely on React, has over 50000 different components and still grows without performance problems. In general, the growth can be sustainable due to modular nature of React. Different part of application could be written independently and reuse within the project or outside. The community has provided thousands of component ready to include in any application. It shorten development time. Instead of writing on you own, you can use a complete, well tested and community opinionated solutions.\n\n3. React is preferred by developers.\n\nReact established a whole new patterns of creating front-end web apps and changed the way developers think of a user interfaces. Simple idea of components and states fruited in great growth of programmer interest. Unclear situation in Angular environment (Angular stuck between version 1 and 2 for a long time) only increased the popularity expansion.\n\n4. React is just cool.\n\nMigration to React become an industry standard. Top brands are rewriting their front-end to React. To name a few: BBC, Imgur, Netflix, Pinterest, Reddit, Yahoo. Statistics confirms that trends. The survey State Of JavaScript Survey Results: Front-end Frameworks carried out in 2017 confirms React’s highest satisfaction. Both developers and entrepreneurs agree that React is a future oriented framework, worth investing money and time.', 3, '2020-01-28', '2020-01-28', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `image_id`, `email`, `user_id`, `job_title`, `about`) VALUES (1, 'Admin', 'Admin', 1, 'admin@sdelp.com', 1, NULL, NULL);
INSERT INTO `profile` (`id`, `first_name`, `last_name`, `image_id`, `email`, `user_id`, `job_title`, `about`) VALUES (2, 'John', 'Smith', 4, 'reactlover@ygmail.com', 2, 'React Developer', 'Been programming since yesterday');

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic_comment` (`id`, `title`, `content`, `created_at`, `updated_at`, `topic_id`, `user_id`, `active`) VALUES (1, 'test', 'test', '2020-01-23', '2020-01-23', 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `topic_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `SD_ELP`;
INSERT INTO `topic_image` (`topic_id`, `image_id`) VALUES (1, 1);

COMMIT;

