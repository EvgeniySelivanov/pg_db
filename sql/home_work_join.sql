

--отримати пошту користувачів, які купляли айфони
SELECT "users"."email" , "phones"."brand"
FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
JOIN "phones_to_orders" ON "orders"."id"="phones_to_orders"."orderId" 
JOIN "phones" ON "phones_to_orders"."orderId"="phones"."id"
WHERE "phones"."brand"='Iphone'
GROUP BY "users"."email","phones"."brand";


--отримати користувачів, які зробили більше 3 замовлень
SELECT "users"."firstName", "users"."lastName",count("orders"."id") AS "quantity orders"
FROM "users"
JOIN "orders" ON "users"."id"="orders"."userId"
GROUP BY "users"."firstName", "users"."lastName"
HAVING count("orders"."id")>3;

--отримати усі замовлення з телефоном з id=13 і пошту юзерів
SELECT "phones"."brand" , "phones"."model","phones"."id","users"."email"
FROM "phones"
JOIN "phones_to_orders" ON "phones"."id"="phones_to_orders"."phoneId"
JOIN "orders" ON "phones_to_orders"."orderId"="orders"."id"
JOIN "users" ON "orders"."userId"="users"."id"
WHERE "phones"."id"=13
GROUP BY "phones"."brand" , "phones"."model","phones"."id","users"."email";

--отримати модель найпопулярнішого телефону(продана найбільшу кількість)
SELECT "phones"."model", sum("phones_to_orders"."quantity") as "sum quantity"
FROM "phones"
JOIN "phones_to_orders" ON "phones"."id"="phones_to_orders"."phoneId"
GROUP BY "phones"."model" 
ORDER BY "sum quantity"  DESC
LIMIT 1;

--отримати сумму чеку кожного замовлення

SELECT sum("list"."price"),"list"."order_id"
FROM
(SELECT ("phones"."price")*("phones_to_orders"."quantity") as "price","phones_to_orders"."orderId" as "order_id"
FROM "phones"
JOIN "phones_to_orders" ON "phones"."id"="phones_to_orders"."phoneId"
) AS "list"
GROUP BY "list"."order_id";



