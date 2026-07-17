USE l2jacis;
-- Registro do gameserver (hexid do PC local - mesmo do config/hexid.txt)
INSERT IGNORE INTO gameservers (server_id, hexid, host) VALUES (1, '644c77c92db93ebfffb692c4ad9ee61c', '*');

-- Espelha TODAS as contas ja criadas no site (Essence = conta-mae; mesma senha vale nos 2)
INSERT IGNORE INTO l2jacis.accounts (login, password)
  SELECT login, password FROM l2jmobiusessence.accounts;

-- GM: troque SEU_LOGIN pelo login da sua conta e rode
-- UPDATE l2jacis.accounts SET access_level = 8 WHERE login = 'SEU_LOGIN';
