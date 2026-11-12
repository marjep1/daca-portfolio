# Nädal 1 – Müügiandmete analüüs

**Roll:** A – Müügiandmete uurija (Sales Data Explorer)  
**Tabel:** `sales`  
**Andmebaas:** UrbanStyle Sales Analytics

## 1. Müügitabeli ülevaade

| Näitaja | Tulemus |
|---|---:|
| Müügikirjete arv | 15 234 |
| Veergude arv | 12 |
| Esimene müügikuupäev | 01.01.2023 |
| Viimane müügikuupäev | 28.06.2026 |
| Puuduva kliendi ID-ga kirjed | 1 487 |
| Puuduva kaupluse asukohaga kirjed | 5 204 |

## 2. Tehingute analüüs

| Näitaja | Tulemus |
|---|---:|
| Suurim tehing | 2 170,40 |
| Väikseim tehing | –1 405,32 |
| Nullkogusega kirjed | 0 |
| Negatiivse kogusega kirjed | 0 |
| Positiivse kogusega kirjed | 15 234 |

Tehingusummade hulgas esineb nii positiivseid kui ka negatiivseid väärtusi.


## 3. Peamised leiud

Müügitabel sisaldab 15 234 kirjet ja 12 veergu, mis kirjeldavad müügitehinguid, kuupäevi, koguseid, hindu, kliente ja müügikohti. Analüüs näitas, et 1 487 kirjel puudub kliendi ID ning 5 204 kirjel kaupluse asukoht. Kõikide kirjete kogused on positiivsed, kuid tehingusummade hulgas esineb ka negatiivseid väärtusi. 2024. aastal oli müügikirjete arv kõigis kuudes suurem kui 2023. aastal. 2025. aasta märtsist novembrini puuduvad andmed, mistõttu ei saa selle perioodi müügitulemusi hinnata.

## 4. Andmekvaliteedi tähelepanekud

- Puuduv kliendi ID: 1 487 kirjet.
- Puuduv kaupluse asukoht: 5 204 kirjet.
- Negatiivsed tehingusummad: esinevad.
- Null- või negatiivse kogusega kirjed: puuduvad.
- Müügikirjed puuduvad 2025. aasta märtsist novembrini.

**Märkus:** Negatiivsed tehingusummad võivad olla seotud tagasimaksete või kreeditarvetega, kuid nende tegelik põhjus vajab kontrollimist.