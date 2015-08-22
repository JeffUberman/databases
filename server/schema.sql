-- CREATE DATABASE chat;

USE chat;
/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/
-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Users'
--
-- ---

DROP TABLE IF EXISTS Users;

CREATE TABLE users (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  username VARCHAR(30) NULL DEFAULT NULL,
  password VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'messages'
--
-- ---

DROP TABLE IF EXISTS messages;

CREATE TABLE messages (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  message TEXT(500) NULL DEFAULT NULL,
  timestamp DATETIME(6) NULL DEFAULT NULL,
  user_id INTEGER NULL DEFAULT NULL,
  room_id INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'rooms'
--
-- ---

DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms (
  id INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  roomname VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE messages ADD FOREIGN KEY (user_id) REFERENCES Users (id);
ALTER TABLE messages ADD FOREIGN KEY (room_id) REFERENCES rooms (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Users` (`id`,`username`,`password`) VALUES
-- ('','','');
-- INSERT INTO `messages` (`id`,`message`,`timestamp`,`user_id`,`room_id`) VALUES
-- ('','','','','');
-- INSERT INTO `rooms` (`id`,`roomname`) VALUES
-- ('','');
