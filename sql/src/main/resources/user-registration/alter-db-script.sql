-- change name column from name to display_name
ALTER TABLE podcast_db.users CHANGE name display_name VARCHAR(45);

-- add registration date column
ALTER TABLE podcast_db.users ADD registration_date DATETIME NULL;

-- add registration date column
ALTER TABLE podcast_db.users ADD registration_token VARCHAR(45) NULL;

-- add registration token column
ALTER TABLE `podcast_db`.`users` ADD COLUMN `registration_token` VARCHAR(45) NULL  AFTER `registration_date` ;


--creates votes table
CREATE TABLE podcast_db.votes
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    value INT NOT NULL,
    podcast_id INT NOT NULL,
    episode_id INT,
    created_on DATETIME NOT NULL
);

-- votes tables for podcasts
CREATE  TABLE `podcast_db`.`podcasts_votes` (
  `username` VARCHAR(100) NOT NULL ,
  `podcast_id` INT NOT NULL ,
  `vote` TINYINT NOT NULL ,
  `voted_on` DATETIME NOT NULL ,
  PRIMARY KEY (`username`, `podcast_id`) );

-- votes tables for episodes
CREATE  TABLE `podcast_db`.`episodes_votes` (
  `username` VARCHAR(100) NOT NULL ,
  `podcast_id` INT NOT NULL ,
  `episode_id` INT NOT NULL ,
  `vote` TINYINT NOT NULL ,
  `voted_on` DATETIME NOT NULL ,
  PRIMARY KEY (`username`, `podcast_id`,`episode_id`) );

CREATE TABLE subscriptions
(
    email VARCHAR(100) NOT NULL,
    podcast_id INT UNSIGNED NOT NULL,
    subscription_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (email, podcast_id)
);


-- make the "password" column longer to hold hashed passwords
ALTER TABLE `podcast_db`.`users` CHANGE COLUMN `password` `password` VARCHAR(100) CHARACTER SET 'utf8_unicode_ci' NOT NULL  ;
