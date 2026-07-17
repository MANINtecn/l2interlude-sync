-- Tabela de Premium do Interlude — banco CENTRAL (l2jmobiusessence, onde vive o Ikoin).
-- Rodar no HeidiSQL. Ikoin/premium sao COMPARTILHADOS pela rede; a tabela e por jogo.
USE l2jmobiusessence;

CREATE TABLE IF NOT EXISTS `account_premium_interlude` (
  `account_name` VARCHAR(45) NOT NULL,
  `premium_expiry` BIGINT NOT NULL DEFAULT 0,
  `updated_at` BIGINT DEFAULT NULL,
  PRIMARY KEY (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
