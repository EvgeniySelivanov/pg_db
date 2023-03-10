--отримати id усіх юзерів , які робили замовлення

SELECT "userId" from "orders"
INTERSECT
SELECT "id" from "users";
--отримати id усіх юзерів , які не робили  замовлення
SELECT "id" from "users"
EXCEPT
SELECT "userId" from "orders";
------отримати усі замовлення юзера з id=33
SELECT  "u"."id","u"."email","o"."id" AS "orderId"
FROM "users" AS "u"
JOIN  "orders" AS "o" ON "u"."id"="o"."userId"
WHERE "u"."id"=23;
