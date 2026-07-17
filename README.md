# l2interlude-sync — dados custom do L2 Ikarus Interlude (aCis)

Repo de SYNC da VPS (git pull automatico a cada 5 min, como o Essence).
Contem SO o que muda com frequencia e a VPS le no boot/reload:
- gameserver/data/xml/  (NPCs, spawns, multisells, skills...)
- gameserver/data/html/ (dialogos dos NPCs)
- sql/                  (scripts a rodar no MySQL da VPS)

NAO versionado (levar MANUAL, com o GS FECHADO):
- l2jserver.jar (troca com GS vivo = NoClassDefFoundError)
- geodata (588MB, muda raramente)

## Deploy na VPS
git pull puxa pra C:\L2Interlude. Reiniciar o GS (ou //reload) pra aplicar.
