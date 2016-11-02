CREATE DATABASE baza;
USE baza;

CREATE TABLE APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   username VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   email VARCHAR(30) NOT NULL,  
   PRIMARY KEY (id),
   UNIQUE (username)
);
   
CREATE TABLE USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);

CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);
 
/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');
 
/* Add one Admin user - username: admin , password: admin */
INSERT INTO APP_USER(username, password, email)
VALUES ('admin','$2a$10$Hkbi.BqQEA5SyfVIqawqUeRTtkA6eyFYBvIAjUrH/9Z59h8ez81f6','admin@gmail.com');
 /* Add one User - username: user , password: user */
INSERT INTO APP_USER(username, password, email)
VALUES ('user','$2a$10$ZrtC093F4L3P4X7kHRFIEuN.pv0PmfqRqIfWvdyoDU0JxO.NV9RYC','user@gmail.com');

/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  WHERE user.username='admin' and profile.type='ADMIN';

 
CREATE TABLE `books` (
  `id` int(8) NOT NULL auto_increment,
  `author` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `available` ENUM('TRUE', 'FALSE') NOT NULL DEFAULT 'TRUE',
  PRIMARY KEY (`id`)
);

INSERT INTO `books` (`author`,`title`,`available`) VALUES ("Harrison Camacho","nec, imperdiet nec,","FALSE"),("Paul Mitchell","lorem ipsum sodales","TRUE"),("Rajah Marsh","neque. In","FALSE"),("Carol Terrell","in consectetuer","TRUE"),("Naomi Wynn","sollicitudin orci","FALSE"),("Madison Bolton","nibh sit","TRUE"),("Iola Navarro","odio, auctor","FALSE"),("Adena Graham","Aenean eget","TRUE"),("Jocelyn Rivers","justo nec","FALSE"),("Tarik Simmons","sed pede. Cum","TRUE");
INSERT INTO `books` (`author`,`title`,`available`) VALUES ("Gary Huffman","elit, pellentesque","FALSE"),("Jaquelyn Randolph","felis. Donec","TRUE"),("Aiko Moreno","enim. Mauris","FALSE"),("Jin Hodge","massa lobortis ultrices.","TRUE"),("Allegra Aguirre","nibh vulputate","FALSE"),("Brett Wong","sollicitudin adipiscing","TRUE"),("Sigourney Ramirez","fringilla purus mauris","TRUE"),("Camden Beasley","justo. Proin","FALSE"),("Damon Kline","fermentum metus. Aenean","TRUE"),("Arsenio Trujillo","Mauris vestibulum,","FALSE");
