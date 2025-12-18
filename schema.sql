create TABLE `red_item`
(
    `item_id`          varchar(80) NOT NULL,
    `item_label`       varchar(60) NOT NULL,
    `item_description` text        NOT NULL,
    `item_weight`      double      NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into `red_item` (`item_id`, `item_label`, `item_description`, `item_weight`)
VALUES ('pain', 'Pain', 'Pain', 0.2),
       ('water', 'Eau', 'Eau', 0.2);

CREATE TABLE `red_players`
(
    `redId`        int(11) NOT NULL,
    `identifier`     varchar(80) NOT NULL,
    `identity`       text        NOT NULL,
    `cash`           int(11) NOT NULL,
    `skin`           text        NOT NULL,
    `outfits`        text        NOT NULL,
    `selectedOutfit` varchar(80) NOT NULL DEFAULT 'default',
    `accessories`    text        NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `red_players_identifiers`
(
    `redId`  int(11) NOT NULL,
    `license`  varchar(150) NOT NULL,
    `steam`    varchar(150) NOT NULL,
    `live`     varchar(150) NOT NULL,
    `xbl`      varchar(150) NOT NULL,
    `discord`  varchar(150) NOT NULL,
    `endpoint` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `red_players_positions`
(
    `redId`  int(11) NOT NULL,
    `position` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `red_item`
    ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_id` (`item_id`);


ALTER TABLE `red_players`
    ADD PRIMARY KEY (`redId`),
  ADD UNIQUE KEY `redId` (`redId`);

ALTER TABLE `red_players_identifiers`
    ADD PRIMARY KEY (`redId`),
  ADD UNIQUE KEY `redId` (`redId`);

ALTER TABLE `red_players_positions`
    ADD PRIMARY KEY (`redId`),
  ADD UNIQUE KEY `redId` (`redId`);

ALTER TABLE `red_players`
    MODIFY `redId` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `red_players_positions`
    MODIFY `redId` int (11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
