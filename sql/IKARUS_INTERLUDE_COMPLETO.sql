-- Interlude IKARUS - banco proprio (NAO tocar no l2jmobiusessence do Essence!)
CREATE DATABASE IF NOT EXISTS l2jacis DEFAULT CHARACTER SET utf8mb4;
-- aCis Interlude - instalacao completa das tabelas (gerado 2026-07-16)
USE l2jacis;

-- >>> accounts.sql
CREATE TABLE IF NOT EXISTS `accounts` (
 	`login` VARCHAR(45) NOT NULL DEFAULT '',
 	`password` VARCHAR(60) NOT NULL DEFAULT '',
 	`last_active` BIGINT NOT NULL DEFAULT 0,
 	`access_level` INT(3) NOT NULL DEFAULT 0,
 	`last_server` INT(4) NOT NULL DEFAULT 1,
 	PRIMARY KEY (`login`)
);

-- >>> auctions.sql
CREATE TABLE IF NOT EXISTS `auctions` (
	`clanhall_id` INT UNSIGNED NOT NULL DEFAULT 0,
	`bidder_name` VARCHAR(35) NOT NULL DEFAULT '',
	`clan_oid` INT UNSIGNED NOT NULL DEFAULT 0,
	`clan_name` VARCHAR(20) NOT NULL DEFAULT '',
	`max_bid` INT UNSIGNED NOT NULL DEFAULT 0,
	`time_bid` BIGINT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`clanhall_id`, `clan_oid`)
);

-- >>> augmentations.sql
CREATE TABLE IF NOT EXISTS `augmentations` (
	`item_oid` INT UNSIGNED NOT NULL DEFAULT 0,
	`attributes` INT NOT NULL DEFAULT -1,
	`skill_id` INT NOT NULL DEFAULT -1,
	`skill_level` INT NOT NULL DEFAULT -1,
	PRIMARY KEY (`item_oid`)
);

-- >>> bbs_favorite.sql
CREATE TABLE IF NOT EXISTS `bbs_favorite` (
  `id` INT UNSIGNED NOT NULL DEFAULT 0,
  `player_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `title` VARCHAR(35) DEFAULT NULL,
  `bypass` VARCHAR(128) DEFAULT NULL,
  `date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY  (`id`)
);

-- >>> bbs_forum.sql
CREATE TABLE IF NOT EXISTS `bbs_forum` (
  `id` int(8) NOT NULL default '0',
  `type` VARCHAR(10) NOT NULL default '0',
  `access` VARCHAR(12) NOT NULL default '0',
  `owner_id` int(8) NOT NULL default '0',
  UNIQUE KEY `id` (`id`)
);

-- >>> bbs_mail.sql
CREATE TABLE IF NOT EXISTS `bbs_mail` (
  `id` INT UNSIGNED NOT NULL DEFAULT 0,
  `receiver_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `sender_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `location` VARCHAR(15) NOT NULL,
  `recipients` VARCHAR(200) DEFAULT NULL,
  `subject` VARCHAR(128) DEFAULT NULL,
  `message` VARCHAR(3000) DEFAULT NULL,
  `sent_date` TIMESTAMP NULL DEFAULT NULL,
  `is_unread` SMALLINT(1) DEFAULT 1,
  PRIMARY KEY  (`id`)
);

-- >>> bbs_post.sql
CREATE TABLE IF NOT EXISTS `bbs_post` (
  `id` int(8) NOT NULL DEFAULT '0',
  `owner_name` varchar(255) NOT NULL DEFAULT '',
  `owner_id` int(8) NOT NULL DEFAULT '0',
  `date` decimal(20,0) NOT NULL DEFAULT '0',
  `topic_id` int(8) NOT NULL DEFAULT '0',
  `forum_id` int(8) NOT NULL DEFAULT '0',
  `txt` text NOT NULL
);

-- >>> bbs_topic.sql
CREATE TABLE IF NOT EXISTS `bbs_topic` (
  `id` int(8) NOT NULL DEFAULT '0',
  `forum_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `date` decimal(20,0) NOT NULL DEFAULT '0',
  `owner_name` varchar(255) NOT NULL DEFAULT '0',
  `owner_id` int(8) NOT NULL DEFAULT '0'
);

-- >>> bookmarks.sql
CREATE TABLE IF NOT EXISTS `bookmarks` (
  `name` VARCHAR(45) NOT NULL DEFAULT '',
  `obj_Id` INT UNSIGNED NOT NULL DEFAULT '0',
  `x` MEDIUMINT DEFAULT NULL,
  `y` MEDIUMINT DEFAULT NULL,
  `z` MEDIUMINT DEFAULT NULL,
  PRIMARY KEY (`name`, `obj_Id`)
);

-- >>> buffer_schemes.sql
CREATE TABLE IF NOT EXISTS `buffer_schemes` (
  `object_id` INT UNSIGNED NOT NULL DEFAULT '0',
  `scheme_name` VARCHAR(16) NOT NULL DEFAULT 'default',
  `skills` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`object_id`, `scheme_name`)
);

-- >>> buylists.sql
CREATE TABLE IF NOT EXISTS `buylists` (
	`buylist_id` INT UNSIGNED,
	`item_id` INT UNSIGNED,
	`count` INT UNSIGNED NOT NULL DEFAULT 0,
	`next_restock_time` BIGINT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`buylist_id`, `item_id`)
);

-- >>> castle.sql
CREATE TABLE IF NOT EXISTS `castle` (
  `id` INT NOT NULL DEFAULT '0',
  `currentTaxPercent` INT NOT NULL DEFAULT '0',
  `nextTaxPercent` INT NOT NULL DEFAULT '0',
  `treasury` BIGINT NOT NULL DEFAULT '0',
  `taxRevenue` BIGINT NOT NULL DEFAULT '0',
  `seedIncome` BIGINT NOT NULL DEFAULT '0',
  `siegeDate` DECIMAL(20,0) NOT NULL DEFAULT '0',
  `regTimeOver` ENUM('true','false') DEFAULT 'true' NOT NULL,
  `certificates` SMALLINT NOT NULL DEFAULT '300',
  PRIMARY KEY (`id`)
);

INSERT IGNORE INTO `castle` VALUES
(1,15,15,0,0,0,0,'true',300),
(2,15,15,0,0,0,0,'true',300),
(3,15,15,0,0,0,0,'true',300),
(4,15,15,0,0,0,0,'true',300),
(5,15,15,0,0,0,0,'true',300),
(6,15,15,0,0,0,0,'true',300),
(7,15,15,0,0,0,0,'true',300),
(8,15,15,0,0,0,0,'true',300),
(9,15,15,0,0,0,0,'true',300);

-- >>> castle_doorupgrade.sql
CREATE TABLE IF NOT EXISTS `castle_doorupgrade` (
  `doorId` INT NOT NULL DEFAULT 0,
  `hp` TINYINT NOT NULL DEFAULT 0,
  `castleId` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`doorId`)
);

-- >>> castle_manor_procure.sql
CREATE TABLE IF NOT EXISTS `castle_manor_procure` (
 `castle_id` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
 `crop_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `amount` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `start_amount` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `price` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `reward_type` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
 `next_period` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`castle_id`,`crop_id`,`next_period`)
);

-- >>> castle_manor_production.sql
CREATE TABLE IF NOT EXISTS `castle_manor_production` (
 `castle_id` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
 `seed_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `amount` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `start_amount` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `price` INT(11) UNSIGNED NOT NULL DEFAULT '0',
 `next_period` TINYINT(1) UNSIGNED NOT NULL DEFAULT '1',
 PRIMARY KEY (`castle_id`, `seed_id`, `next_period`)
);

-- >>> castle_trapupgrade.sql
CREATE TABLE IF NOT EXISTS `castle_trapupgrade` (
  `castleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `towerIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`towerIndex`,`castleId`)
);

-- >>> character_hennas.sql
CREATE TABLE IF NOT EXISTS `character_hennas` (
  `char_obj_id` INT NOT NULL DEFAULT 0,
  `symbol_id` INT,
  `slot` INT NOT NULL DEFAULT 0,
  `class_index` INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`,`slot`,`class_index`)
);

-- >>> character_macroses.sql
CREATE TABLE IF NOT EXISTS `character_macroses` (
  `char_obj_id` INT NOT NULL DEFAULT 0,
  `id` INT NOT NULL DEFAULT 0,
  `icon` INT,
  `name` VARCHAR(40) ,
  `descr` VARCHAR(80) ,
  `acronym` VARCHAR(4) ,
  `commands` VARCHAR(255) ,
  PRIMARY KEY (`char_obj_id`,`id`)
);

-- >>> character_memo.sql
CREATE TABLE IF NOT EXISTS `character_memo` (
  `charId` INT(10) UNSIGNED NOT NULL,
  `var` VARCHAR(255) NOT NULL,
  `val` TEXT NOT NULL,
  PRIMARY KEY (`charId`, `var`)
);

-- >>> character_quests.sql
CREATE TABLE IF NOT EXISTS `character_quests` (
  `charId` INT UNSIGNED NOT NULL DEFAULT 0,
  `name` VARCHAR(40) NOT NULL DEFAULT '',
  `var` VARCHAR(20) NOT NULL DEFAULT '',
  `value` VARCHAR(255),
  PRIMARY KEY  (`charId`,`name`,`var`)
);

-- >>> character_raid_points.sql
CREATE TABLE IF NOT EXISTS `character_raid_points` (
  `char_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `boss_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `points` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`,`boss_id`)
);

-- >>> character_recipebook.sql
CREATE TABLE IF NOT EXISTS `character_recipebook` (
  `charId` INT UNSIGNED NOT NULL DEFAULT 0,
  `recipeId` SMALLINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`charId`,`recipeId`)
);

-- >>> character_recommends.sql
CREATE TABLE IF NOT EXISTS character_recommends ( 
 char_id INT NOT NULL default 0, 
 target_id INT(11) NOT NULL DEFAULT 0, 
 PRIMARY KEY (char_id,target_id) 
);

-- >>> character_relations.sql
CREATE TABLE IF NOT EXISTS `character_relations` (
  `char_id` INT UNSIGNED NOT NULL default 0,
  `friend_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `relation` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`,`friend_id`)
);

-- >>> character_shortcuts.sql
CREATE TABLE IF NOT EXISTS character_shortcuts (
  `char_obj_id` INT UNSIGNED NOT NULL DEFAULT 0,
  `slot` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `page` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `type` VARCHAR(6) NOT NULL DEFAULT 'NONE',
  `id` INT UNSIGNED NOT NULL DEFAULT 0,
  `level` SMALLINT SIGNED NOT NULL DEFAULT 0,
  `class_index` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`,`slot`,`page`,`class_index`),
  KEY `id` (`id`)
);

-- >>> character_skills.sql
CREATE TABLE IF NOT EXISTS `character_skills` (
  `char_obj_id` INT UNSIGNED NOT NULL default 0,
  `skill_id` INT NOT NULL default 0,
  `skill_level` INT(3) NOT NULL default 1,
  `class_index` INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_obj_id`,`skill_id`,`class_index`)
);

-- >>> character_skills_save.sql
CREATE TABLE IF NOT EXISTS `character_skills_save` (
  `char_obj_id` INT NOT NULL default 0,
  `skill_id` INT NOT NULL default 0,
  `skill_level` INT(3) NOT NULL default 1,
  `effect_count` INT NOT NULL default 0,
  `effect_cur_time` INT NOT NULL default 0,
  `reuse_delay` INT(8) NOT NULL DEFAULT 0,
  `systime` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `restore_type` INT(1) NOT NULL DEFAULT 0,
  `class_index` INT(1) NOT NULL DEFAULT 0,
  `buff_index` INT(2) NOT NULL default 0,
  PRIMARY KEY (`char_obj_id`,`skill_id`,`skill_level`,`class_index`)
);

-- >>> character_subclasses.sql
CREATE TABLE IF NOT EXISTS `character_subclasses` (
`char_obj_id` decimal(11,0) NOT NULL default '0',
`class_id` int(2) NOT NULL default '0',
`exp` decimal(20,0) NOT NULL default '0',
`sp` decimal(11,0) NOT NULL default '0',
`level` int(2) NOT NULL default '40',
`class_index` int(1) NOT NULL default '0',
PRIMARY KEY  (`char_obj_id`,`class_id`)
);

-- >>> characters.sql
CREATE TABLE IF NOT EXISTS characters (
  `account_name` VARCHAR(45) DEFAULT NULL,
  `obj_Id` INT UNSIGNED NOT NULL DEFAULT 0,
  `char_name` VARCHAR(35) NOT NULL,
  `level` TINYINT UNSIGNED DEFAULT NULL,
  `maxHp` MEDIUMINT UNSIGNED DEFAULT NULL,
  `curHp` MEDIUMINT UNSIGNED DEFAULT NULL,
  `maxCp` MEDIUMINT UNSIGNED DEFAULT NULL,
  `curCp` MEDIUMINT UNSIGNED DEFAULT NULL,
  `maxMp` MEDIUMINT UNSIGNED DEFAULT NULL,
  `curMp` MEDIUMINT UNSIGNED DEFAULT NULL,
  `face` TINYINT UNSIGNED DEFAULT NULL,
  `hairStyle` TINYINT UNSIGNED DEFAULT NULL,
  `hairColor` TINYINT UNSIGNED DEFAULT NULL,
  `sex` TINYINT UNSIGNED DEFAULT NULL,
  `heading` MEDIUMINT DEFAULT NULL,
  `x` MEDIUMINT DEFAULT NULL,
  `y` MEDIUMINT DEFAULT NULL,
  `z` MEDIUMINT DEFAULT NULL,
  `exp` BIGINT UNSIGNED DEFAULT 0,
  `expBeforeDeath` BIGINT UNSIGNED DEFAULT 0,
  `sp` INT UNSIGNED NOT NULL DEFAULT 0,
  `karma` INT UNSIGNED DEFAULT NULL,
  `pvpkills` SMALLINT UNSIGNED DEFAULT NULL,
  `pkkills` SMALLINT UNSIGNED DEFAULT NULL,
  `clanid` INT UNSIGNED DEFAULT NULL,
  `race` TINYINT UNSIGNED DEFAULT NULL,
  `classid` TINYINT UNSIGNED DEFAULT NULL,
  `base_class` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `deletetime` BIGINT DEFAULT NULL,
  `title` VARCHAR(16) DEFAULT NULL,
  `rec_have` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `rec_left` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `accesslevel` MEDIUMINT DEFAULT 0,
  `online` TINYINT UNSIGNED DEFAULT NULL,
  `onlinetime` INT DEFAULT NULL,
  `lastAccess` BIGINT UNSIGNED DEFAULT NULL,
  `wantspeace` TINYINT UNSIGNED DEFAULT 0,
  `isin7sdungeon` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `punish_level` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `punish_timer` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `power_grade` TINYINT UNSIGNED DEFAULT NULL,
  `nobless` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `hero` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `subpledge` SMALLINT NOT NULL DEFAULT 0,
  `lvl_joined_academy` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `apprentice` INT UNSIGNED NOT NULL DEFAULT 0,
  `sponsor` INT UNSIGNED NOT NULL DEFAULT 0,
  `varka_ketra_ally` TINYINT NOT NULL DEFAULT 0,
  `clan_join_expiry_time` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `clan_create_expiry_time` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `death_penalty_level` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (obj_Id),
  KEY `clanid` (`clanid`)
);

-- >>> clan_data.sql
CREATE TABLE IF NOT EXISTS `clan_data` (
  `clan_id` INT NOT NULL DEFAULT 0,
  `clan_name` VARCHAR(20),
  `clan_level` INT NOT NULL DEFAULT 0,
  `reputation_score` INT NOT NULL DEFAULT 0,
  `hasCastle` TINYINT NOT NULL DEFAULT 0,
  `ally_id` INT NOT NULL DEFAULT 0,
  `ally_name` VARCHAR(20),
  `leader_id` INT NOT NULL DEFAULT 0,
  `new_leader_id` INT NOT NULL DEFAULT 0,
  `crest_id` INT NOT NULL DEFAULT 0,
  `crest_large_id` INT NOT NULL DEFAULT 0,
  `ally_crest_id` INT NOT NULL DEFAULT 0,
  `auction_bid_at` INT NOT NULL DEFAULT 0,
  `ally_penalty_expiry_time` BIGINT NOT NULL DEFAULT 0,
  `ally_penalty_type` INT NOT NULL DEFAULT 0,
  `char_penalty_expiry_time` BIGINT NOT NULL DEFAULT 0,
  `dissolving_expiry_time` BIGINT NOT NULL DEFAULT 0,
  `enabled` TINYINT NOT NULL DEFAULT 0,
  `notice` TEXT,
  `introduction` TEXT,
  PRIMARY KEY (`clan_id`),
  KEY `leader_id` (`leader_id`),
  KEY `ally_id` (`ally_id`)
);

-- >>> clan_privs.sql
DROP TABLE IF EXISTS `clan_privs`;
CREATE TABLE `clan_privs` (
  `clan_id` INT NOT NULL DEFAULT'0',
  `ranking` INT NOT NULL DEFAULT '0',
  `privs` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan_id`,`ranking`)
);

-- >>> clan_skills.sql
CREATE TABLE IF NOT EXISTS clan_skills (
  clan_id INT NOT NULL DEFAULT 0,
  skill_id INT NOT NULL DEFAULT 0,
  skill_level INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`clan_id`,`skill_id`)
);

-- >>> clan_subpledges.sql
CREATE TABLE IF NOT EXISTS `clan_subpledges` (
  `clan_id` INT NOT NULL default '0',
  `sub_pledge_id` INT NOT NULL default '0',
  `name` varchar(45),
  `leader_id` INT NOT NULL default '0',
  PRIMARY KEY (`clan_id`,`sub_pledge_id`)
);

-- >>> clan_wars.sql
DROP TABLE IF EXISTS `clan_wars`;
CREATE TABLE `clan_wars` (
  `clan1` varchar(35) NOT NULL DEFAULT '',
  `clan2` varchar(35) NOT NULL DEFAULT '',
  `expiry_time` decimal(20,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan1`,`clan2`)
);

-- >>> clanhall.sql
CREATE TABLE IF NOT EXISTS `clanhall` (
  `id` TINYINT NOT NULL DEFAULT '0',
  `ownerId` INT UNSIGNED NOT NULL DEFAULT '0',
  `paidUntil` BIGINT NOT NULL DEFAULT '0',
  `paid` TINYINT NOT NULL DEFAULT '0',
  `sellerBid` INT UNSIGNED NOT NULL DEFAULT '0',
  `sellerName` VARCHAR(20) NOT NULL DEFAULT '',
  `sellerClanName` VARCHAR(20) NOT NULL DEFAULT '',
  `endDate` BIGINT NOT NULL DEFAULT '0',
  PRIMARY KEY `id` (`id`)
);

INSERT IGNORE INTO `clanhall` VALUES
('21', '0', '0', '0', '0', '', '', '0'),
('22', '0', '0', '0', '0', '', '', '0'),
('23', '0', '0', '0', '0', '', '', '0'),
('24', '0', '0', '0', '0', '', '', '0'),
('25', '0', '0', '0', '0', '', '', '0'),
('26', '0', '0', '0', '0', '', '', '0'),
('27', '0', '0', '0', '0', '', '', '0'),
('28', '0', '0', '0', '0', '', '', '0'),
('29', '0', '0', '0', '0', '', '', '0'),
('30', '0', '0', '0', '0', '', '', '0'),
('31', '0', '0', '0', '0', '', '', '0'),
('32', '0', '0', '0', '0', '', '', '0'),
('33', '0', '0', '0', '0', '', '', '0'),
('34', '0', '0', '0', '0', '', '', '0'),
('35', '0', '0', '0', '0', '', '', '0'),
('36', '0', '0', '0', '0', '', '', '0'),
('37', '0', '0', '0', '0', '', '', '0'),
('38', '0', '0', '0', '0', '', '', '0'),
('39', '0', '0', '0', '0', '', '', '0'),
('40', '0', '0', '0', '0', '', '', '0'),
('41', '0', '0', '0', '0', '', '', '0'),
('42', '0', '0', '0', '0', '', '', '0'),
('43', '0', '0', '0', '0', '', '', '0'),
('44', '0', '0', '0', '0', '', '', '0'),
('45', '0', '0', '0', '0', '', '', '0'),
('46', '0', '0', '0', '0', '', '', '0'),
('47', '0', '0', '0', '0', '', '', '0'),
('48', '0', '0', '0', '0', '', '', '0'),
('49', '0', '0', '0', '0', '', '', '0'),
('50', '0', '0', '0', '0', '', '', '0'),
('51', '0', '0', '0', '0', '', '', '0'),
('52', '0', '0', '0', '0', '', '', '0'),
('53', '0', '0', '0', '0', '', '', '0'),
('54', '0', '0', '0', '0', '', '', '0'),
('55', '0', '0', '0', '0', '', '', '0'),
('56', '0', '0', '0', '0', '', '', '0'),
('57', '0', '0', '0', '0', '', '', '0'),
('58', '0', '0', '0', '0', '', '', '0'),
('59', '0', '0', '0', '0', '', '', '0'),
('60', '0', '0', '0', '0', '', '', '0'),
('61', '0', '0', '0', '0', '', '', '0'),
('62', '0', '0', '0', '0', '', '', '0'),
('63', '0', '0', '0', '0', '', '', '0'),
('64', '0', '0', '0', '0', '', '', '0');

-- >>> clanhall_flagwar_attackers.sql
CREATE TABLE IF NOT EXISTS `clanhall_flagwar_attackers` (
  `clanhall_id` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `flag` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `npc` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `clan_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`flag`),
  KEY `hall_id` (`clanhall_id`),
  KEY `clan_id` (`clan_id`)
);

-- >>> clanhall_flagwar_members.sql
CREATE TABLE IF NOT EXISTS `clanhall_flagwar_members` (
  `clanhall_id` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `clan_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `object_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  KEY `clanhall_id` (`clanhall_id`),
  KEY `clan_id` (`clan_id`),
  KEY `object_id` (`object_id`)
);

-- >>> clanhall_flagwar_owner_npcs.sql
CREATE TABLE IF NOT EXISTS `clanhall_flagwar_owner_npcs` (
  `clanhall_id` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0',
  `npc_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `clan_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`clanhall_id`),
  KEY `npc_id` (`npc_id`),
  KEY `clan_id` (`clan_id`)
);

-- >>> clanhall_functions.sql
CREATE TABLE IF NOT EXISTS `clanhall_functions` (
  `hall_id` int(2) NOT NULL default '0',
  `type` int(1) NOT NULL default '0',
  `lvl` int(3) NOT NULL default '0',
  `lease` int(10) NOT NULL default '0',
  `rate` decimal(20,0) NOT NULL default '0',
  `endTime` decimal(20,0) NOT NULL default '0',
  PRIMARY KEY (`hall_id`,`type`)
);

-- >>> clanhall_siege_attackers.sql
CREATE TABLE IF NOT EXISTS `clanhall_siege_attackers` (
  `clanhall_id` TINYINT(2) NOT NULL DEFAULT '0',
  `attacker_id` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`clanhall_id`, `attacker_id`)
);

-- >>> cursed_weapons.sql
CREATE TABLE IF NOT EXISTS `cursed_weapons` (
  `itemId` INT,
  `playerId` INT DEFAULT 0,
  `playerKarma` INT DEFAULT 0,
  `playerPkKills` INT DEFAULT 0,
  `nbKills` INT DEFAULT 0,
  `currentStage` INT DEFAULT 0,
  `numberBeforeNextStage` INT DEFAULT 0,
  `hungryTime` INT DEFAULT 0,
  `endTime` DECIMAL(20,0) DEFAULT 0,
  PRIMARY KEY (`itemId`)
);

-- >>> custom_spawns.sql
CREATE TABLE IF NOT EXISTS `custom_spawns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `npc_id` INT NOT NULL,
  `x` INT NOT NULL,
  `y` INT NOT NULL,
  `z` INT NOT NULL,
  `heading` INT NOT NULL DEFAULT 0,
  `respawn` INT NOT NULL DEFAULT 60,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- >>> fishing_championship.sql
CREATE TABLE IF NOT EXISTS `fishing_championship` (
  `player_name` VARCHAR(35) NOT NULL,
  `fish_length` DOUBLE(10,3) NOT NULL,
  `rewarded` INT(1) NOT NULL
);

-- >>> games.sql
CREATE TABLE IF NOT EXISTS games (
  id INT NOT NULL default 0,
  idnr INT NOT NULL default 0,
  number1 INT NOT NULL default 0,
  number2 INT NOT NULL default 0,
  prize  INT NOT NULL default 0,
  newprize  INT NOT NULL default 0,
  prize1  INT NOT NULL default 0,
  prize2  INT NOT NULL default 0,
  prize3  INT NOT NULL default 0,
  enddate decimal(20,0) NOT NULL default 0,
  finished INT NOT NULL default 0,
  PRIMARY KEY (`id`,`idnr`)
);

-- >>> gameservers.sql
CREATE TABLE IF NOT EXISTS `gameservers` (
  `server_id` int(11) NOT NULL default '0',
  `hexid` varchar(50) NOT NULL default '',
  `host` varchar(50) NOT NULL default '',
  PRIMARY KEY (`server_id`)
);

-- >>> grandboss_list.sql
CREATE TABLE IF NOT EXISTS `grandboss_list` (
  `player_id` decimal(11,0) NOT NULL,
  `zone` decimal(11,0) NOT NULL,
  PRIMARY KEY (`player_id`,`zone`)
);

-- >>> heroes.sql
CREATE TABLE IF NOT EXISTS `heroes` (
  `char_id` decimal(11,0) NOT NULL default '0',
  `class_id` decimal(3,0) NOT NULL default '0',
  `count` decimal(3,0) NOT NULL default '0',
  `played` decimal(1,0) NOT NULL default '0',
  `active` tinyint NOT NULL default 0,
  `message` varchar(300) NOT NULL default '',
  PRIMARY KEY  (`char_id`)
);

-- >>> heroes_diary.sql
CREATE TABLE IF NOT EXISTS `heroes_diary` (
  `char_id` int(10) unsigned NOT NULL,
  `time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(2) unsigned NOT NULL default '0',
  `param` int(11) unsigned NOT NULL default '0',
  KEY `char_id` (`char_id`)
);

-- >>> items.sql
CREATE TABLE IF NOT EXISTS `items` (
  `owner_id` INT,
  `object_id` INT NOT NULL DEFAULT 0,
  `item_id` SMALLINT UNSIGNED NOT NULL,
  `count` INT UNSIGNED NOT NULL DEFAULT 0,
  `enchant_level` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `loc` VARCHAR(10),
  `loc_data` INT,
  `custom_type1` INT NOT NULL DEFAULT 0,
  `custom_type2` INT NOT NULL DEFAULT 0,
  `mana_left` INT NOT NULL DEFAULT -1,
  `time` BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`)
);

-- >>> items_on_ground.sql
CREATE TABLE IF NOT EXISTS `items_on_ground` (
  `object_id` int(11) NOT NULL default '0',
  `item_id` int(11) default NULL,
  `count` int(11) default NULL,
  `enchant_level` int(11) default NULL,
  `x` int(11) default NULL,
  `y` int(11) default NULL,
  `z` int(11) default NULL,
  `time` decimal(20,0) default NULL,
  PRIMARY KEY  (`object_id`)
);

-- >>> mdt_bets.sql
CREATE TABLE IF NOT EXISTS `mdt_bets` (
  `lane_id` INT(1) DEFAULT 0,
  `bet` INT DEFAULT 0,
  PRIMARY KEY (`lane_id`)
);

INSERT INTO `mdt_bets` VALUES
('1','0'),
('2','0'),
('3','0'),
('4','0'),
('5','0'),
('6','0'),
('7','0'),
('8','0');

-- >>> mdt_history.sql
CREATE TABLE IF NOT EXISTS `mdt_history` (
  `race_id` MEDIUMINT DEFAULT 0,
  `first` INT(1) DEFAULT 0,
  `second` INT(1) DEFAULT 0,
  `odd_rate` DOUBLE(10,2) DEFAULT 0,
  PRIMARY KEY (`race_id`)
);

-- >>> mods_wedding.sql
CREATE TABLE IF NOT EXISTS `mods_wedding` (
  `id` INT UNSIGNED NOT NULL DEFAULT 0,
  `requesterId` INT UNSIGNED NOT NULL DEFAULT 0,
  `partnerId` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);

-- >>> olympiad_fights.sql
CREATE TABLE IF NOT EXISTS `olympiad_fights` (
  `charOneId` int(10) unsigned NOT NULL,
  `charTwoId` int(10) unsigned NOT NULL,
  `charOneClass` tinyint(3) unsigned NOT NULL default '0',
  `charTwoClass` tinyint(3) unsigned NOT NULL default '0',
  `winner` tinyint(1) unsigned NOT NULL default '0',
  `start` bigint(13) unsigned NOT NULL DEFAULT '0',
  `time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `classed` tinyint(1) unsigned NOT NULL default '0',
  KEY `charOneId` (`charOneId`),
  KEY `charTwoId` (`charTwoId`)
);

-- >>> olympiad_nobles.sql
CREATE TABLE IF NOT EXISTS `olympiad_nobles` (
  `char_id` INT UNSIGNED NOT NULL default 0,
  `class_id` tinyint(3) unsigned NOT NULL default 0,
  `olympiad_points` int(10) NOT NULL default 0,
  `competitions_done` smallint(3) NOT NULL default 0,
  `competitions_won` smallint(3) NOT NULL default 0,
  `competitions_lost` smallint(3) NOT NULL default 0,
  `competitions_drawn` smallint(3) NOT NULL default 0,
  `rewarded` smallint(1) NOT NULL default 0,
  PRIMARY KEY (`char_id`)
);

-- >>> olympiad_nobles_eom.sql
CREATE TABLE IF NOT EXISTS `olympiad_nobles_eom` (
  `char_id` INT UNSIGNED NOT NULL default 0,
  `class_id` tinyint(3) unsigned NOT NULL default 0,
  `olympiad_points` int(10) NOT NULL default 0,
  `competitions_done` smallint(3) NOT NULL default 0,
  `competitions_won` smallint(3) NOT NULL default 0,
  `competitions_lost` smallint(3) NOT NULL default 0,
  `competitions_drawn` smallint(3) NOT NULL default 0,
  PRIMARY KEY (`char_id`)
);

-- >>> petition.sql
CREATE TABLE IF NOT EXISTS `petition` (
  `oid` INT UNSIGNED NOT NULL DEFAULT 0,
  `type` VARCHAR(20) NOT NULL,
  `petitioner_oid` INT UNSIGNED NOT NULL DEFAULT 0,
  `submit_date` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  `content` VARCHAR(256) NOT NULL,
  `is_unread` SMALLINT(1) NOT NULL DEFAULT 1,
  `state` VARCHAR(20) NOT NULL,
  `rate` VARCHAR(10) NOT NULL,
  `feedback` VARCHAR(512) NOT NULL,
  `responders` VARCHAR(150) NOT NULL,
  PRIMARY KEY  (`oid`)
);

-- >>> petition_message.sql
CREATE TABLE IF NOT EXISTS `petition_message` (
  `id` INT UNSIGNED NOT NULL DEFAULT 0,
  `petition_oid` INT UNSIGNED NOT NULL DEFAULT 0,
  `player_oid` INT UNSIGNED NOT NULL DEFAULT 0,
  `type` VARCHAR(20) NOT NULL,
  `player_name` VARCHAR(20) NOT NULL,
  `content` VARCHAR(120) NOT NULL,
  PRIMARY KEY  (`id`, `petition_oid`)
);

-- >>> pets.sql
CREATE TABLE IF NOT EXISTS `pets` (
  `item_obj_id` decimal(11) NOT NULL default 0,
  `name` varchar(16),
  `level` decimal(11),
  `curHp` decimal(18,0),
  `curMp` decimal(18,0),
  `exp` decimal(20, 0),
  `sp` decimal(11),
  `fed` decimal(11),
  PRIMARY KEY (`item_obj_id`)
);

-- >>> rainbowsprings_attacker_list.sql
CREATE TABLE IF NOT EXISTS `rainbowsprings_attacker_list` (
  `clanId` INT NOT NULL DEFAULT 0,
  `war_decrees_count`INT NOT NULL DEFAULT 0,
  PRIMARY KEY `clanId` (`clanId`)
);

-- >>> server_memo.sql
CREATE TABLE IF NOT EXISTS `server_memo` (
  `var` VARCHAR(20) NOT NULL DEFAULT '',
  `value` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`var`)
);

-- >>> seven_signs.sql
CREATE TABLE IF NOT EXISTS `seven_signs` (
  `char_obj_id` INT NOT NULL DEFAULT '0',
  `cabal` VARCHAR(8) NOT NULL DEFAULT 'NORMAL',
  `seal` VARCHAR(8) NOT NULL DEFAULT 'NONE',
  `red_stones` INT NOT NULL DEFAULT '0',
  `green_stones` INT NOT NULL DEFAULT '0',
  `blue_stones` INT NOT NULL DEFAULT '0',
  `ancient_adena_amount` DECIMAL(20,0) NOT NULL DEFAULT '0',
  `contribution_score` DECIMAL(20,0) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`char_obj_id`)
);

-- >>> seven_signs_festival.sql
CREATE TABLE IF NOT EXISTS `seven_signs_festival` (
`festivalId` int(1) NOT NULL DEFAULT '0',
`cabal` varchar(4) NOT NULL DEFAULT '',
`cycle` int(4) NOT NULL DEFAULT '0',
`date` bigint(50) DEFAULT '0',
`score` int(5) NOT NULL DEFAULT '0',
`members` varchar(255) NOT NULL DEFAULT '',
PRIMARY KEY (`festivalId`,`cabal`,`cycle`)
);

INSERT IGNORE INTO `seven_signs_festival` VALUES 
(0, "DAWN", 1, 0, 0, ""),
(1, "DAWN", 1, 0, 0, ""),
(2, "DAWN", 1, 0, 0, ""),
(3, "DAWN", 1, 0, 0, ""),
(4, "DAWN", 1, 0, 0, ""),
(0, "DUSK", 1, 0, 0, ""),
(1, "DUSK", 1, 0, 0, ""),
(2, "DUSK", 1, 0, 0, ""),
(3, "DUSK", 1, 0, 0, ""),
(4, "DUSK", 1, 0, 0, "");

-- >>> seven_signs_status.sql
CREATE TABLE IF NOT EXISTS `seven_signs_status` (
  `id` int(3) NOT NULL default '0',
  `current_cycle` int(10) NOT NULL DEFAULT '1',
  `festival_cycle` int(10) NOT NULL DEFAULT '1',
  `active_period` VARCHAR(16) NOT NULL DEFAULT 'COMPETITION',
  `date` bigint(13) unsigned NOT NULL DEFAULT '0',
  `previous_winner` VARCHAR(8) NOT NULL DEFAULT 'NORMAL',
  `dawn_stone_score` DECIMAL(20,0) NOT NULL DEFAULT '0',
  `dawn_festival_score` int(10) NOT NULL DEFAULT '0',
  `dusk_stone_score` DECIMAL(20,0) NOT NULL DEFAULT '0',
  `dusk_festival_score` int(10) NOT NULL DEFAULT '0',
  `avarice_owner` VARCHAR(8) NOT NULL DEFAULT 'NORMAL',
  `gnosis_owner` VARCHAR(8) NOT NULL DEFAULT 'NORMAL',
  `strife_owner` VARCHAR(8) NOT NULL DEFAULT 'NORMAL',
  `avarice_dawn_score` int(10) NOT NULL DEFAULT '0',
  `gnosis_dawn_score` int(10) NOT NULL DEFAULT '0',
  `strife_dawn_score` int(10) NOT NULL DEFAULT '0',
  `avarice_dusk_score` int(10) NOT NULL DEFAULT '0',
  `gnosis_dusk_score` int(10) NOT NULL DEFAULT '0',
  `strife_dusk_score` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus0` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus1` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus2` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus3` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus4` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`id`)
);

INSERT IGNORE INTO `seven_signs_status` VALUES
(0,1,1,'COMPETITION',0,'NORMAL',0,0,0,0,'NORMAL','NORMAL','NORMAL',0,0,0,0,0,0,0,0,0,0,0);

-- >>> siege_clans.sql
CREATE TABLE IF NOT EXISTS `siege_clans` (
   `castle_id` TINYINT NOT NULL DEFAULT '0',
   `clan_id` INT(11) NOT NULL DEFAULT '0',
   `type` VARCHAR(8) DEFAULT 'PENDING',
   PRIMARY KEY (`castle_id`, `clan_id`)
);

-- >>> spawn_data.sql
DROP TABLE IF EXISTS `spawn_data`;
CREATE TABLE `spawn_data` (
  `name` VARCHAR(80) NOT NULL,
  `status` SMALLINT NOT NULL,
  `current_hp` INT unsigned NOT NULL,
  `current_mp` INT unsigned NOT NULL,
  `loc_x` INT NOT NULL DEFAULT 0,
  `loc_y` INT NOT NULL DEFAULT 0,
  `loc_z` INT NOT NULL DEFAULT 0,
  `heading` MEDIUMINT NOT NULL DEFAULT 0,
  `db_value` SMALLINT NOT NULL DEFAULT 0,
  `respawn_time` BIGINT unsigned NOT NULL default 0,
  PRIMARY KEY (`name`)
);
USE l2jacis;
-- Registro do gameserver (hexid do PC local - mesmo do config/hexid.txt)
INSERT IGNORE INTO gameservers (server_id, hexid, host) VALUES (1, '644c77c92db93ebfffb692c4ad9ee61c', '*');

-- Espelha TODAS as contas ja criadas no site (Essence = conta-mae; mesma senha vale nos 2)
INSERT IGNORE INTO l2jacis.accounts (login, password)
  SELECT login, password FROM l2jmobiusessence.accounts;

-- GM: troque SEU_LOGIN pelo login da sua conta e rode
-- UPDATE l2jacis.accounts SET access_level = 8 WHERE login = 'SEU_LOGIN';
-- Tabelas do SITE no banco PROPRIO do Interlude (l2jacis) - 2026-07-16
-- Regra da rede: ofertas e codigos sao POR JOGO (banco de cada servidor);
-- Ikoin e contas do site continuam no banco do Essence (compartilhados).
USE l2jacis;

-- Ofertas do Community Board (2 slots, iguais ao painel do Essence + coluna enchant)
CREATE TABLE IF NOT EXISTS game_offer (
  id INT NOT NULL,
  item_id INT NOT NULL,
  count INT NOT NULL DEFAULT 1,
  price_ikoin INT NOT NULL DEFAULT 100,
  title VARCHAR(80) NOT NULL DEFAULT 'Oferta Limitada',
  icon VARCHAR(120) DEFAULT NULL,
  enchant INT NOT NULL DEFAULT 0,
  active TINYINT NOT NULL DEFAULT 0,
  updated_at BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

-- Codigos promocionais do Interlude (mesmo formato do Essence)
CREATE TABLE IF NOT EXISTS promo_codes (
  code VARCHAR(32) NOT NULL,
  items TEXT DEFAULT NULL,
  ikoin INT NOT NULL DEFAULT 0,
  description VARCHAR(200) DEFAULT NULL,
  active TINYINT NOT NULL DEFAULT 1,
  max_uses INT NOT NULL DEFAULT 0,
  uses INT NOT NULL DEFAULT 0,
  created_by VARCHAR(80) DEFAULT NULL,
  created_at BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS promo_redeemed (
  code VARCHAR(32) NOT NULL,
  account_name VARCHAR(45) NOT NULL,
  redeemed_at BIGINT NOT NULL DEFAULT 0,
  PRIMARY KEY (code, account_name)
);

-- MIGRACAO (opcional): se voce ja tinha criado ofertas do Interlude no banco do
-- Essence (modelo antigo com coluna server), descomente e rode UMA vez:
-- INSERT IGNORE INTO l2jacis.game_offer (id, item_id, count, price_ikoin, title, icon, enchant, active, updated_at)
--   SELECT id, item_id, count, price_ikoin, title, icon, 0, active, updated_at
--   FROM l2jmobiusessence.game_offer WHERE server = 'interlude';
