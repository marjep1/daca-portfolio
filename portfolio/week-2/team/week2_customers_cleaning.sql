-- Loon klientide testkoopia
DROP TABLE IF EXISTS customers_test;

CREATE TABLE customers_test AS
SELECT * FROM customers;

SELECT COUNT(*) AS ridade_arv
FROM customers_test;

-- Leian korduvad e-posti aadressid
SELECT email, COUNT(*) AS koopiate_arv
FROM customers_test
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC
LIMIT 3000;

-- Leian puuduvad ees- ja perekonnanimed
SELECT
    COUNT(*) FILTER (WHERE first_name IS NULL OR first_name = '') AS null_eesnimi,
    COUNT(*) FILTER (WHERE last_name IS NULL OR last_name = '') AS null_perenimi
FROM customers_test;

-- Kontrollin linnanimede ühtlust
SELECT city, COUNT(*) AS arv
FROM customers_test
GROUP BY city
ORDER BY city;

-- Kontrollin puuduvaid kontaktandmeid
SELECT
    COUNT(*) FILTER (WHERE phone IS NULL OR phone = '') AS null_telefon,
    COUNT(*) FILTER (WHERE email IS NULL OR email = '') AS null_email
FROM customers_test;

-- Loen unikaalsete, tühjade ja NULL emailidega ridu ja arvutan duplikaatide arve
SELECT
    COUNT(*) AS kokku_ridu,
    COUNT(DISTINCT email) AS erinevaid_emaili_aadresse,
    COUNT(*) FILTER (WHERE email IS NULL) AS null_emailiga_ridu,
    COUNT(*) FILTER (WHERE email = '') AS tyhja_emailiga_ridu,
    COUNT(*)
        - COUNT(DISTINCT email)
        - COUNT(*) FILTER (WHERE email IS NULL)
        - COUNT(*) FILTER (WHERE email = '')
        AS duplikaatsete_emailidega_ridu
FROM customers_test;

-- NULL linnanime
SELECT
    COUNT(*) FILTER (WHERE city IS NULL) AS null_linnanimega_ridu
FROM customers_test;

-- Erinevad ühtlustatud linnanimed
SELECT
    INITCAP(TRIM(city)) AS uhtlustatud_linnanimi,
    COUNT(*) AS ridade_arv
FROM customers_test
WHERE city IS NOT NULL
  AND TRIM(city) <> ''
GROUP BY LOWER(TRIM(city)), INITCAP(TRIM(city))
ORDER BY uhtlustatud_linnanimi;

-- Ühtlustamata linnanimede archived_atSELECT
SELECT
    COUNT(DISTINCT city) AS uhtlustamata_linnanime_variante
FROM customers_test
WHERE city IS NOT NULL
  AND TRIM(city) <> '';

  -- Ühtlustatud linnanimede arv
  SELECT
    COUNT(DISTINCT LOWER(TRIM(city))) AS uhtlustatud_linnanimesid
FROM customers_test
WHERE city IS NOT NULL
  AND TRIM(city) <> '';

  -- Puuduvad registreerimiskuupäevad, lojaalsustasemed ja sünniaastad
  SELECT
    COUNT(*) FILTER (
        WHERE registration_date IS NULL
    ) AS null_registration_date,

    COUNT(*) FILTER (
        WHERE loyalty_tier IS NULL
    ) AS null_loyalty_tier,

    COUNT(*) FILTER (
        WHERE birth_year IS NULL
    ) AS null_birth_year

FROM customers_test;

-- Synniaastate kontroll
SELECT
    birth_year AS synniaasta,
    COUNT(*) AS klientide_arv
FROM customers_test
WHERE birth_year IS NOT NULL
GROUP BY birth_year
ORDER BY birth_year;

-- Synniaastate loogilisuse kontroll
SELECT
    customer_id,
    birth_year
FROM customers_test
WHERE birth_year > EXTRACT(YEAR FROM CURRENT_DATE)
   OR birth_year < EXTRACT(YEAR FROM CURRENT_DATE) - 110
ORDER BY birth_year;

-- Ühtlustamist vajavate linnanimede ridade arv
SELECT
    COUNT(*) AS parandamist_vajavaid_ridu
FROM customers_test
WHERE city IS NOT NULL
  AND TRIM(city) <> ''
  AND city <> INITCAP(TRIM(city));

  -- Standardiseerimist vajavate telefoninumbrite arv
SELECT
    COUNT(*) AS standardiseerimist_vajavaid_telefoninumbreid
FROM customers_test
WHERE phone IS NOT NULL
  AND TRIM(phone) <> ''
  AND (
      TRIM(phone) LIKE '372%'
      OR LENGTH(TRIM(phone)) = 7
  );
