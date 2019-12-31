DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`
(
    `name`       VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_enabled` tinyint(1)                              NOT NULL DEFAULT '1',
    `created_at` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `id`         INT(11)                                 NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email`      VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `full_name`  VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password`   VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_enabled` tinyint(1)                              NOT NULL DEFAULT '1',
    `created_at` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

INSERT INTO version (name)
VALUES ('00.00.00');


DROP TABLE IF EXISTS `practice_tests`;
CREATE TABLE `practice_tests`
(
    `id`          INT(11)                                 NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name`        VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` TEXT,
    `created_at`  TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHAR SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts`
(
    `id`               INT(11)                                 NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `practice_test_id` INT(11)                                 NOT NULL,
    `name`             VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description`      TEXT,
    `created_at`       TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHAR SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`
(
    `id`               INT(11)                                 NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `practice_test_id` INT(11)                                 NOT NULL,
    `part_id`          INT(11)                                 NOT NULL,
    `description`      VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at`       TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHAR SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`
(
    `id`          INT                                     NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `question_id` INT                                     NOT NULL,
    `description` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `is_correct`  TINYINT(1)                              NOT NULL DEFAULT 0,
    `created_at`  TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  TIMESTAMP                               NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
  DEFAULT CHAR SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
