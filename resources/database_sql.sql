DROP TABLE IF EXISTS `app_pref`;

CREATE TABLE `app_pref`
(
    `id`         INT AUTO_INCREMENT NOT NULL,
    `current_version` TEXT,
    `regular_size`    INTEGER,
    `big_size`        INTEGER,
    `font_color`      TEXT,
    `release_date`    TEXT,
    PRIMARY KEY (id)
);
create unique index app_pref_id_uindex
    on app_pref (id);


DROP TABLE IF EXISTS `category`;

CREATE TABLE `category`
(
    `id`         INT AUTO_INCREMENT,
    `cat_name`   TEXT    NOT NULL,
    `desc`       TEXT,
    `user_id`    INTEGER NOT NULL,
    `created_at` text,
    `updated_at` text,
    PRIMARY KEY (id)
);
create unique index category_id_uindex
    on category (id);


DROP TABLE IF EXISTS `docs`;

CREATE TABLE `docs`
(
    `id`         INT AUTO_INCREMENT,
    `doc_name`    TEXT,
    `details`     TEXT     NOT NULL,
    `doc_type`    TEXT     NOT NULL,
    `category_id` INTEGER  NOT NULL,
    `created_at`  DATETIME NOT NULL,
    `updated_at`  DATETIME,
    PRIMARY KEY (id)
);
create unique index docs_id_uindex
    on docs (id);


DROP TABLE IF EXISTS `remember_me`;

CREATE TABLE `remember_me`
(
    `id`         INT AUTO_INCREMENT,
    `user_name` varchar(255),
    `password` varchar(255),
    PRIMARY KEY (id)
);
create unique index remember_me_id_uindex
    on remember_me (id);


DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags`
(
    `id`         INT AUTO_INCREMENT,
    `tag_name` TEXT,
    `doc_id`   INTEGER,
    PRIMARY KEY (id)
);
create unique index tags_id_uindex
    on tags (id);


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`
(
    `id`         INT AUTO_INCREMENT,
    `firstname`  VARCHAR(255) NOT NULL,
    `lastname`   VARCHAR(255) NOT NULL,
    `email`      VARCHAR(255) NOT NULL UNIQUE,
    `phone`      TEXT,
    `password`   VARCHAR(255) NOT NULL,
    `created_at` TEXT,
    `status`     INTEGER,
    PRIMARY KEY (id)
);
create unique index users_id_uindex
    on users (id);

DROP TABLE IF EXISTS `sticky_notes`;

CREATE TABLE `sticky_notes`
(
    `id`         INT AUTO_INCREMENT,
    `note_date`  DATETIME,
    `details`    TEXT     NOT NULL,
    `x_pos`      INTEGER  NOT NULL DEFAULT 400,
    `y_pos`      INTEGER  NOT NULL DEFAULT 250,
    `the_width`  INTEGER  NOT NULL DEFAULT 200,
    `the_height` INTEGER  NOT NULL DEFAULT 300,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME,
    PRIMARY KEY (id)
);
create unique index sticky_notes_id_uindex
    on sticky_notes (id);

alter table category
    add constraint category_users_id_fk
        foreign key (user_id) references users (id);
alter table docs
    add constraint docs_category_id_fk
        foreign key (category_id) references category (id);
alter table tags
    add constraint tags_docs_id_fk
        foreign key (doc_id) references docs (id);