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
