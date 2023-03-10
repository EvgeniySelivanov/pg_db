--порахувати кількість телефонів, які були продані
SELECT sum("quantity")
FROM "phones_to_orders";
--порахувати кількість телефонів, які є на складі
SELECT sum("quantity")
FROM "phones";
--порахувати середню ціну кожного бренда
SELECT avg("price"),
  "brand"
FROM "phones"
GROUP BY "brand";
--model 
SELECT count("model"),
  "brand"
FROM "phones"
GROUP BY "brand";
--средняя цена на Sony
SELECT avg("price"),
  "brand"
FROM "phones"
WHERE "brand" = 'Sony'
GROUP BY "brand";
--количество заказов каждого пользователя
SELECT count(*),
  "userId"
FROM "orders"
GROUP BY "userId";
------порахувати загальну вартість усіх телефонів в діапазоні цін від 10000 до 20000
SELECT sum("price" * "quantity")
FROM "phones"
WHERE "price" BETWEEN 10000 AND 20000;
SELECT "id",
  "height",
  "firstName",
  "birthday"
FROM "users"
ORDER BY "height" DESC,
  "firstName" ASC,
  "birthday" DESC;
SELECT "model",
  "id",
  "brand",
  "quantity"
FROM "phones"
ORDER BY "quantity" ASC
LIMIT 5;



SELECT *
FROM (SELECT "firstName","lastName",extract("years"FROM age("birthday")) AS "age"
    FROM "users"
  ) AS "AGE_USER"
WHERE "AGE_USER"."age" IN(22, 33, 44, 55, 66, 77)
ORDER BY "age" ASC,"firstName" ASC,"lastName" ASC;



SELECT *
FROM (
    SELECT count("id") AS "count", extract("years"FROM age("birthday")) AS "age"
    FROM "users"
    GROUP BY "age"
  ) AS "BLABLA"
WHERE "BLABLA"."age" BETWEEN 20 AND 30
ORDER BY "BLABLA"."count" DESC;

--порахувати кількість людей кожного віку (age, count) і вивести тільки той вік, де кількість = 4
    SELECT count(*) AS "count", extract("years"FROM age("birthday")) AS "age"
    FROM "users"
    GROUP BY "age"
    HAVING count(*)=4
    ORDER BY "age";
   
   
SELECT "id","firstName"
FROM "users"
WHERE "firstName" ILIKE '_b%';

--знайдiть юзерів з ініціалами MN
SELECT "id","firstName","lastName"
FROM "users"
WHERE "firstName" ILIKE 'A%' AND "lastName" ILIKE 's%';

--знайдiть юзерів з іменами на букву А
SELECT "id","firstName","lastName"
FROM "users"
WHERE "firstName" SIMILAR TO '(A|B)%';


--знайти кількість символів в пошті, яка починається з букви w, сгрупувати їх за кількістю, показати тількі ті групи, де кількість символів більше 25
SELECT length("email") AS "length"
FROM "users"
WHERE "email" ILIKE 'a%' AND length("email")>25
GROUP BY "length";
--відсіяти непопулярні групи
SELECT length("email") AS "length",count("id")
FROM "users"
WHERE "email" ILIKE 'a%'
GROUP BY "length"
HAVING count("id")>1;