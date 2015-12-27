CREATE TABLE `bookmark`.`FOLDER` (
	`FOLDER_ID` int(10) NOT NULL AUTO_INCREMENT,
    `NAME` varchar(45) NOT NULL,
	PRIMARY KEY(`FOLDER_ID`)
) Engine=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookmark`.`BOOKMARK` (
	`BOOKMARK_ID` int(10) NOT NULL AUTO_INCREMENT,
    `DESCRIPTION` varchar(200) NOT NULL,
    `URL` varchar(1024) NOT NULL,
    `FOLDER_ID` int(10) NOT NULL,
    PRIMARY KEY(`BOOKMARK_ID`),
    CONSTRAINT fk_folder_id FOREIGN KEY(`FOLDER_ID`) REFERENCES `FOLDER`(`FOLDER_ID`)
)Engine=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookmark`.`USERS` (
	`USERNAME` varchar(45) NOT NULL,
    `PASSWORD` varchar(45) NOT NULL,
    `ENABLED` TINYINT(1) NOT NULL,
    PRIMARY KEY(`USERNAME`)
)Engine=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookmark`.`USER_ROLES` (
	`USER_ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
    `USERNAME` varchar(45) NOT NULL,
    `ROLE` varchar(45) NOT NULL,
    PRIMARY KEY(`USER_ROLE_ID`),
    UNIQUE KEY uni_username_role (`ROLE`, `USERNAME`),
    KEY fk_username_idx(`USERNAME`),
    CONSTRAINT fk_username FOREIGN KEY (`USERNAME`) REFERENCES `bookmark`.`USERS`(`USERNAME`)
)Engine=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bookmark`.`PERSISTENT_LOGINS` (
	`USERNAME` varchar(64) not null,
    `SERIES` varchar(64) not null,
    `TOKEN` varchar(64) not null,
    `LAST_USED` timestamp not null,
    PRIMARY KEY (`SERIES`)
)Engine=InnoDB DEFAULT CHARSET=utf8;