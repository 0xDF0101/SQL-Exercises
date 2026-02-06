# SQL 조회(SELECT) 실습 문제 (문제편)

본 실습 문제 (문제편)은 MySQL 환경을 기준으로 작성되었습니다. 제공된 `../resources/ddl/schema.sql`과 데이터 파일들을 임포트한 후 실습을 진행해 주세요.

**[제출 안내]**
정답을 제출할 때는 `feature/${학번}` 브랜치를 생성하여 제출해 주시기 바랍니다. (예: `feature/20240101`)

---

## 1. 기초 조회 및 필터링 (SELECT, WHERE, ORDER BY, LIMIT)

**문제 1:** `products` 테이블에서 모든 상품의 이름(`title`)과 가격(`price`) 컬럼을 조회하세요.

```sql
select title, price from products;
```

**문제 2:** `products` 테이블에서 상품 카테고리(`category`) 목록을 중복 없이 조회하세요.

```sql
select distinct category from products;
```

**문제 3:** `products` 테이블에서 가격(`price`)이 50달러 이상인 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

```sql
select title, price
from products
where price >= 50;
```

**문제 4:** `products` 테이블에서 'Gizmo' 카테고리에 속하면서 평점(`rating`)이 4.5 이상인 상품의 모든 정보를 조회하세요.

```sql
select *
from products
where category = 'Gizmo' AND rating >= 4.5;
```

**문제 5:** `users` 테이블에서 이메일 주소(`email`)가 'yahoo.com'으로 끝나는 사용자의 이름(`name`)과 이메일(`email`)을 조회하세요.

```sql
select name, email
from users
where email like'%@yahoo.com';
```

**문제 6:** `orders` 테이블에서 2018년에 생성된(`created_at` 컬럼 기준) 주문 건의 모든 정보를 조회하세요.

```sql
select *
from orders
where created_at
between '2018-01-01' and '2018-12-31 23:59:59';
```

**문제 7:** `products` 테이블에서 상품을 가격(`price`)이 높은 순서대로 정렬하여 상위 5개 상품의 모든 정보를 조회하세요.

```sql
select *
from products
order by price DESC
limit 5;
```

**문제 8:** `users` 테이블에서 주(`state`)가 'CA', 'NY', 'TX'인 사용자들의 이름(`name`)과 주(`state`)를 조회하세요.

```sql
select name, state
from users
where state = 'CA' or state = 'NY' or state = 'TX';
```

**문제 9:** `products` 테이블에서 평점(`rating`)이 0인 상품의 이름(`title`)과 카테고리(`category`)를 조회하세요.

```sql
SELECT title, category
FROM products
WHERE rating = 0
```

**문제 10:** `products` 테이블에서 상품 이름(`title`)에 'Small'이 포함된 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

```sql
SELECT title, price
FROM products
WHERE title LIKE '%Small%';
```

**문제 11:** `products` 테이블에서 벤더(`vendor`)가 'Senger-Stamm'인 상품의 모든 정보를 조회하세요.

```sql
SELECT *
FROM products
WHERE vendor = 'Senger-Stamm';
```

**문제 12:** `products` 테이블에서 상품 가격(`price`)이 20달러에서 40달러 사이인 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

```sql
SELECT title, price
FROM products
WHERE price >= 20 AND price <= 40;
```

**문제 13:** `products` 테이블에서 'Gadget' 카테고리가 아닌 상품들 중 가격(`price`)이 100달러 이상인 상품의 모든 정보를 조회하세요.

```sql
SELECT *
FROM products
WHERE category != 'Gadget' AND price >= 100;
```

**문제 14:** `users` 테이블에서 도시(`city`)가 'Portland'인 사용자의 이름(`name`)과 주소(`address`)를 조회하세요.

```sql
SELECT name, address
FROM users
WHERE city = 'Portland';
```

**문제 15:** `users` 테이블에서 '2019-01-01' 이후에 생성된(`created_at` 컬럼 기준) 사용자들 중 가입 경로(`source`)가 'Google'인 사용자의 모든 정보를 조회하세요.

```sql
SELECT *
FROM users
WHERE created_at >= '2019-01-01' AND source = 'Google';
```

**문제 16:** `products` 테이블에서 상품 이름(`title`)이 'Aerodynamic'으로 시작하는 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

```sql
SELECT title, price
FROM products
WHERE title LIKE 'Aerodynamic%';
```

**문제 17:** `reviews` 테이블에서 평점(`rating`)이 1점인 리뷰의 본문(`body`)을 조회하세요.

```sql
SELECT body
FROM reviews
WHERE rating = 1;
```

**문제 18:** `orders` 테이블에서 할인(`discount`)이 0보다 큰(적용된) 주문의 총 건수를 조회하세요.

```sql
SELECT count(*)
FROM orders
WHERE discount > 0
```

**문제 19:** `users` 테이블에서 우편번호(`zip`)가 '9'로 시작하는 사용자들의 이름(`name`)과 우편번호(`zip`)를 조회하세요.

```sql
SELECT name, zip
FROM users
WHERE zip LIKE '9%';
```

**문제 20:** `products` 테이블에서 상품을 카테고리(`category`)별로 오름차순 정렬하고, 같은 카테고리 내에서는 가격(`price`)이 낮은 순(오름차순)으로 정렬하여 모든 정보를 조회하세요.

```sql
SELECT *
FROM products
ORDER BY Category ASC, price ASC;
```

**문제 21:** `products` 테이블에서 평점(`rating`)이 4.0 이상 4.8 이하인 상품의 이름(`title`)과 평점(`rating`)을 조회하세요.

```sql
SELECT title, rating
FROM products
WHERE rating BETWEEN 4.0 AND 4.8;
```

**문제 22:** `users` 테이블에서 가입 경로(`source`)가 'Twitter' 또는 'Facebook'인 사용자의 이름(`name`)과 가입 경로(`source`)를 조회하세요.

```sql
SELECT name, source
FROM users
WHERE source = 'Twitter' OR source = 'Facebook';
WHERE source IN ('Twitter', 'Facebook'); # 이렇게 써도 됨
```

**문제 23:** `products` 테이블에서 수량(`quantity`)이 5000개가 아닌 상품의 모든 정보를 조회하세요.

```sql
SELECT *
FROM products
WHERE quantity != 5000;
```

**문제 24:** `users` 테이블에서 주(`state`) 컬럼 값이 비어있지 않은(NULL이 아니고 빈 문자열이 아닌) 사용자의 모든 정보를 조회하세요.

```sql
SELECT *
FROM users
WHERE state IS NOT NULL AND state != '';
```

**문제 25:** `orders` 테이블에서 세금(`tax`)이 10달러를 초과하는 주문의 ID(`id`)와 세금(`tax`)을 조회하세요.

```sql
SELECT id, tax
FROM orders
WHERE tax > 10;
```

## 2. 집계 및 그룹화 (Aggregate Functions, GROUP BY, HAVING)

**문제 26:** `products` 테이블에 등록된 전체 상품의 개수는 몇 개입니까?

```sql
SELECT COUNT(*)
FROM products;
(200개)
```

**문제 27:** `products` 테이블에서 각 카테고리(`category`)별 상품 개수를 조회하세요.

```sql
SELECT category, COUNT(*)
FROM products
GROUP BY category;
```

**문제 28:** `products` 테이블에서 카테고리(`category`)별 평균 상품 가격(`price`)을 조회하되, 평균 가격이 높은 순으로 정렬하세요.

```sql
SELECT category, AVG(price)
FROM products
GROUP BY category
ORDER BY AVG(price) DESC ;
```

**문제 29:** `orders` 테이블에서 모든 주문의 총 매출액(`total`의 합계)을 구하세요.

```sql
SELECT SUM(total)
FROM orders
```

**문제 30:** `orders` 테이블에서 각 사용자(`user_id`)별로 주문한 총 횟수를 조회하세요.

```sql
SELECT user_id, COUNT(*)
FROM orders
GROUP BY user_id;
```

**문제 31:** `reviews` 테이블을 사용하여 각 상품(`product_id`)별 평균 평점(`rating`)을 조회하세요.

```sql
SELECT product_id, AVG(rating)
FROM reviews
GROUP BY product_id;
```

**문제 32:** `users` 테이블에서 각 주(`state`)별 사용자 수를 조회하되, 사용자 수가 50명 이상인 주만 출력하세요.

```sql
SELECT state, count(*)
FROM users
GROUP BY state
HAVING COUNT(*) >= 50;
```

**문제 33:** `orders` 테이블에서 2019년 1월 한 달 동안 발생한 총 주문 금액(`total`의 합계)을 구하세요.

```sql
SELECT SUM(total)
FROM orders
WHERE created_at BETWEEN '2019-01-01' AND '2019-01-31';
# 이렇게 하면 31일 00시 이후의 주문은 집계가 안됨

SELECT SUM(total)
FROM orders
WHERE created_at >= '2019-01-01' AND create_at < '2019-02-01'
```

**문제 34:** `products` 테이블에서 가장 비싼 상품의 가격(`price`)과 가장 저렴한 상품의 가격(`price`)을 조회하세요.

```sql
SELECT MAX(price), MIN(price)
FROM products;
```

**문제 35:** `users` 테이블에서 가입 경로(`source`)별 사용자 수를 조회하세요.

```sql
SELECT source, COUNT(*)
FROM users
GROUP BY source;
```

**문제 36:** `products` 테이블에서 각 카테고리(`category`)별로 가장 높은 평점(`rating`)을 조회하세요.

```sql
SELECT category, MAX(rating)
FROM products
GROUP BY category;

```

>>>>>>> 이거
**문제 37:** `products` 테이블에서 벤더(`vendor`)별로 공급하는 상품의 총 개수를 조회하세요.

```sql
SELECT vendor, COUNT(*)
FROM products
GROUP BY vendor;
```

**문제 38:** `orders` 테이블에서 각 상품(`product_id`)별 총 판매 수량(`quantity`)의 합계를 구하세요.

```sql
SELECT product_id, SUM(quantity)
FROM orders
GROUP BY product_id;
```

**문제 39:** `users` 테이블에서 각 년도별로 가입한 사용자 수를 조회하세요. (`created_at` 컬럼 활용)

```sql
SELECT YEAR(created_at), COUNT(*)
FROM users
GROUP BY YEAR(created_at);
```

**문제 40:** `products` 테이블에서 평균 가격(`price`)이 50달러 이상인 카테고리(`category`)와 그 평균 가격을 조회하세요.

```sql
SELECT category, AVG(price)
FROM products
GROUP BY category
HAVING AVG(price) >= 50;
```

**문제 41:** `reviews` 테이블에서 각 평점(`rating`, 1~5)별 리뷰 개수를 조회하세요.

```sql
SELECT rating, count(*)
FROM reviews
GROUP BY rating;
```

**문제 42:** `users` 테이블에서 각 도시(`city`)별 사용자 수를 조회하되, 사용자 수가 많은 도시부터 내림차순으로 정렬하세요.

```sql
SELECT city, count(*)
FROM users
GROUP BY city
ORDER BY count(*) DESC;
```

**문제 43:** `orders` 테이블에서 주문 금액(`total`)의 평균보다 높은 주문들의 총 개수를 조회하세요. (서브쿼리 활용)

```sql
SELECT COUNT(*)
FROM orders
WHERE total > (SELECT AVG(total) FROM orders);
```

**문제 44:** `products` 테이블에서 각 카테고리(`category`)별 상품 가격(`price`)의 표준편차를 구하세요. (MySQL의 `STDDEV` 함수 사용)

```sql
SELECT category, STDDEV(price)
FROM products
GROUP BY category;
```

**문제 45:** `orders` 테이블에서 중복을 제외한 주문 상품(`product_id`)의 총 개수를 조회하세요.

```sql
SELECT DISTINCT COUNT(product_id)
FROM orders;
# DISTINCT는 괄호 안에 있어야 중복을 제거한 후 개수를 셀 수 있음
# 애시당초에 COUNT의 결과가 하나인데 중복을 제거하는게 의미가 없음
SELECT COUNT(DISTINCT product_id)
FROM orders;
```

**문제 46:** `orders` 테이블에서 2018년에 주문을 한 번이라도 한 사용자(`user_id`)의 총 수를 구하세요.

```sql
SELECT COUNT(user_id)
FROM orders
WHERE '2018-01-01' <= created_at AND '2019-01-01' > created_at;
# 한명의 유저가 여러번 주문을 했을 수 있으므로 중복 제거를 해줘야 한다
SELECT COUNT(DISTINCT user_id)
FROM orders
WHERE '2018-01-01' <= created_at AND '2019-01-01' > created_at;
```

**문제 47:** `products` 테이블에서 벤더(`vendor`)별 평균 평점(`rating`)을 구하되, 평균 평점이 4.0 이상인 벤더만 조회하세요.

```sql
SELECT vendor, AVG(rating)
FROM products
GROUP BY vendor
HAVING AVG(rating) >= 4.0;
```

**문제 48:** `orders` 테이블에서 각 사용자(`user_id`)별 총 주문 금액(`total`)의 합계를 구하되, 합계 금액이 500달러 이상인 사용자만 조회하세요.

```sql
SELECT user_id, SUM(total)
FROM orders
GROUP BY user_id
HAVING SUM(total) > 500;
```

**문제 49:** `reviews` 테이블에서 2018년 이후에 작성된 리뷰들 중, 상품(`product_id`)별 리뷰 개수를 조회하세요.

```sql
SELECT product_id, COUNT(*)
FROM reviews
WHERE created_at >= '2018-01-01'
GROUP BY product_id;
```

**문제 50:** `products` 테이블에서 상품 카테고리(`category`)가 'Gizmo'인 상품들의 총 재고 수량(`quantity`) 합계를 구하세요.

```sql
SELECT SUM(quantity)
FROM products
WHERE category = 'Gizmo';
```

## 3. 조인 및 서브쿼리 (JOIN, Subqueries)

**문제 51:** `orders` 테이블과 `users` 테이블을 조인하여, 각 주문의 ID(`id`)와 주문한 사용자의 이름(`name`)을 조회하세요.

```sql
SELECT o.id, u.name
FROM orders o
JOIN users u ON o.user_id = u.id;
```

**문제 52:** `orders`, `users`, `products` 테이블을 조인하여, 'Gizmo' 카테고리 상품을 주문한 사용자들의 이메일(`email`)을 중복 없이 조회하세요.

```sql
SELECT DISTINCT u.email
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id;
```

**문제 53:** `products` 테이블과 `reviews` 테이블을 조인하여, 각 상품별 이름(`title`)과 해당 상품에 달린 리뷰 본문(`body`)을 조회하세요. (리뷰가 없는 상품은 제외)

```sql
SELECT p.title, r.body
FROM products p
         JOIN reviews r ON p.id = r.product_id;
```

**문제 54:** `products` 테이블과 `reviews` 테이블을 조인하여, 평균 평점(`rating`)이 4.0 이상인 상품들의 이름(`title`)과 평균 평점을 조회하세요.

```sql
SELECT p.title, AVG(r.rating)
FROM products p
JOIN reviews r ON p.id = r.product_id
GROUP BY p.title
HAVING AVG(r.rating) >= 4.0;
```

**문제 55:** `products` 테이블에서 `orders` 테이블에 존재하지 않는(한 번도 주문된 적이 없는) 상품의 이름(`title`)을 조회하세요.

```sql
SELECT p.title
FROM products p
         LEFT JOIN orders o ON p.id = o.product_id
WHERE o.product_id IS NULL;
```

**문제 56:** `products` 테이블과 `orders` 테이블을 조인하여, 가장 많이 주문된 상품 상위 3개의 이름(`title`)과 주문 횟수를 조회하세요.

```sql
SELECT p.title, COUNT(*)
FROM products p
         JOIN orders o ON p.id = o.product_id
GROUP BY p.title
ORDER BY COUNT(*) DESC
    LIMIT 3;
```

**문제 57:** `users` 테이블과 `orders` 테이블을 `LEFT JOIN`하여, 각 사용자의 이름(`name`)과 그 사용자가 마지막으로 주문한 날짜(`created_at`)를 조회하세요.

```sql
SELECT u.name, MAX(o.created_at)
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.name;
```

**문제 58:** `orders` 테이블에서 주문 금액(`total`)이 전체 평균 주문 금액보다 큰 주문들의 ID(`id`)와 금액(`total`)을 조회하세요.

```sql
SELECT id, total
FROM orders
WHERE (SELECT AVG(total) FROM orders) < total;
```

**문제 59:** `products` 테이블에서 각 카테고리(`category`)별로 가장 비싼 상품의 카테고리, 이름(`title`), 가격(`price`)을 조회하세요. (서브쿼리 활용)

```sql
SELECT category, title, price
FROM products
WHERE (category, price) IN (
    SELECT category, MAX(price)
    FROM products
    GROUP BY category
);
```

**문제 60:** `orders` 테이블과 `users` 테이블을 조인하여, 'TX' 주(`state`)에 거주하는 사용자들이 주문한 총 주문 금액(`total`)의 합계를 구하세요.

```sql
SELECT SUM(o.total)
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.state = 'TX';
```

**문제 61:** `reviews` 테이블과 `products` 테이블을 조인하여, 각 리뷰별로 리뷰 작성자(`reviewer`)의 이름과 해당 상품의 이름(`title`)을 함께 조회하세요.

```sql
SELECT r.reviewer, p.title
FROM reviews r
JOIN products p ON p.id = r.product_id;
```

**문제 62:** `orders` 테이블과 `products` 테이블을 조인하여, 주문한 상품의 가격(`price`)이 100달러 이상인 주문들의 주문 ID(`id`)와 상품 이름(`title`)을 조회하세요.

```sql
SELECT o.id, p.title
FROM products p
JOIN orders o ON o.product_id = p.id
WHERE p.price > 100;
```

**문제 63:** `products`, `orders`, `users` 테이블을 조인하여, 'Affiliate' 경로로 가입한 사용자(`source`)들이 주문한 상품들의 카테고리(`category`)를 중복 없이 조회하세요.
????

```sql
SELECT DISTINCT u.id , p.category
FROM products p
JOIN orders o ON o.product_id = p.id
JOIN users u ON u.id = o.user_id
WHERE u.source = 'Affiliate';
```

**문제 64:** `users`, `orders`, `products` 테이블을 조인하여, 각 주(`state`)별로 가장 많이 주문된 상품 카테고리(`category`)와 그 주문 건수를 조회하세요.

- [ ] 복습

```sql
SELECT state, category, order_count
FROM (
         SELECT u.state, p.category, COUNT(*) AS order_count,
                RANK() OVER (PARTITION BY u.state ORDER BY COUNT(*) DESC) AS rnk 
         FROM users u
                  JOIN orders o ON o.user_id = u.id
                  JOIN products p ON p.id = o.product_id
         GROUP BY u.state, p.category
     ) AS ranked_result
WHERE rnk = 1;

# 이렇게 그냥 서브쿼리로도 할 수 있음
SELECT u.state, p.category, COUNT(*) as cnt
FROM users u
         JOIN orders o ON u.id = o.user_id
         JOIN products p ON o.product_id = p.id
GROUP BY u.state, p.category
HAVING (u.state, cnt) IN (
    -- 주별 최대 주문 건수가 몇 개인지 찾아서 비교함
    SELECT state, MAX(order_count)
    FROM (
             SELECT u2.state, p2.category, COUNT(*) AS order_count
             FROM users u2
                      JOIN orders o2 ON u2.id = o2.user_id
                      JOIN products p2 ON o2.product_id = p2.id
             GROUP BY u2.state, p2.category
         ) t
    GROUP BY state
);
```

📌 **RANK() 사용방법**
```sql
RANK() OVER (PARTITION BY u.state ORDER BY COUNT(*) DESC) AS rnk 
# RANK() : 순위를 매겨라
# OVER(...) : 어떤 범위에서 순위를 매길지 명시
# PARTITION BY ... : 어떤 것 별로 순위를 매길지 명시 (GROUP BY와 유사)
# ORDER BY COUNT(*) DESC : 기준은 COUNT(*)의 값이 큰 순서대로
```

**문제 65:** `products` 테이블과 `reviews` 테이블을 조인하여, 리뷰가 5개 이상 달린 상품의 이름(`title`)과 리뷰 개수를 조회하세요.

```sql
SELECT p.title, COUNT(*) AS review_count
FROM products p
         JOIN reviews r ON p.id = r.product_id
GROUP BY p.title
HAVING COUNT(*) > 5;
```

**문제 66:** `orders` 테이블과 `users` 테이블을 조인하여, 2018년에 가입한 사용자들이 2019년에 주문한 총 금액(`total`)의 합계를 구하세요.

```sql
SELECT SUM(o.total)
FROM (
    SELECT *
    FROM users
    WHERE created_at >= '2018-01-01' AND created_at < '2019-01-01'
     ) AS u
JOIN orders o ON u.id = o.user_id
WHERE o.created_at >= '2019-01-01' AND o.created_at < '2020-01-01';
```

**문제 67:** `products` 테이블에서 상품 평점(`rating`)이 해당 카테고리(`category`)의 평균 평점보다 높은 상품들의 이름(`title`)과 평점(`rating`)을 조회하세요.
- [ ] 복습

```sql
SELECT title, rating
FROM products p1
WHERE rating > (SELECT AVG(rating) FROM products p2 where p1.category = p2.category);
```

**문제 68:** `users` 테이블에서 주문 내역(`orders`)이 없는 사용자들의 이메일(`email`)을 조회하세요. (`NOT EXISTS` 활용)
- [ ] 복습
```sql
SELECT u.email
FROM users u
WHERE NOT EXISTS(
    SELECT 1  -- 값의 유무만 따지기 때문에 그냥 가장 가벼운 1로 적음
    FROM orders o
    WHERE o.user_id = u.id
);
```

**문제 69:** `products` 테이블과 `orders` 테이블을 조인하여, 각 벤더(`vendor`)별로 가장 많이 판매된(주문 횟수 기준) 상품의 이름(`title`)을 조회하세요.
- [ ] 복습!!!
- 이해가 잘 안됨...
- 64번이랑 유사한 문제

```sql
SELECT vendor, title, sale_count
FROM (
    SELECT p.vendor, p.title, COUNT(*) AS sale_count,
           RANK() over (PARTITION BY p.vendor ORDER BY COUNT(*) DESC) AS rnk
    FROM products p
    JOIN orders o ON p.id = o.product_id
    GROUP BY p.vendor, p.title
     ) AS ranked_products
WHERE rnk = 1;
```

**문제 70:** `products` 테이블과 `reviews` 테이블을 조인하여, 사용자 'Hudson Borer'가 작성한 리뷰가 있는 상품의 이름(`title`)을 조회하세요.
- [ ] 복습
- 너무 어렵게 생각하지 말것

```sql
SELECT DISTINCT p.title
FROM products p
         JOIN reviews r ON r.product_id = p.id
WHERE r.reviewer = 'Hudson Borer';
```

**문제 71:** `users` 테이블에서 'Gizmo' 카테고리 상품을 주문하지 않은 사용자의 ID(`id`)와 이름(`name`)을 조회하세요.

```sql

```

**문제 72:** `products` 테이블과 `orders` 테이블을 조인하여, 상품 이름(`title`)과 해당 상품을 주문한 사용자 수를 조회하세요. (주문되지 않은 상품도 0으로 표시)

```sql

```

**문제 73:** `users`, `orders`, `products` 테이블을 조인하여, 각 상품 카테고리(`category`)별로 주문 합계(`total`)가 가장 큰 사용자의 이름을 조회하세요.

```sql

```

**문제 74:** `users` 테이블과 `orders` 테이블을 조인하여, 할인율(`discount`)이 0.5 이상인 주문을 한 사용자들이 거주하는 도시(`city`) 목록을 중복 없이 조회하세요.

```sql

```

**문제 75:** `products` 테이블과 `reviews` 테이블을 조인하여, 리뷰 본문(`body`)에 'love'라는 단어가 포함된 리뷰를 받은 상품의 이름(`title`)을 조회하세요.

```sql

```

## 4. 데이터 변환 및 조건문 (CASE, DATE_FORMAT 등)

**문제 76:** `products` 테이블에서 가격(`price`)이 100달러를 초과하면 '고가', 50달러에서 100달러 사이면 '중가', 50달러 미만이면 '저가'로 분류하여 상품 이름(`title`)과 가격, 분류(`price_range`)를 조회하세요.

```sql

```

**문제 77:** `users` 테이블에서 이메일 주소(`email`)의 도메인(예: gmail.com, yahoo.com)만 추출하여, 각 도메인별 사용자 수를 조회하세요.

```sql

```

**문제 78:** `orders` 테이블에서 주문 날짜(`created_at`)를 'YYYY-MM' 형식으로 변환하여, 월별 주문 건수를 조회하세요.

```sql

```

**문제 79:** `products` 테이블에서 수량(`quantity`)이 100개 이하이면 '재고 부족', 아니면 '정상'으로 표시하여 상품 이름(`title`)과 상태를 조회하세요.

```sql

```

**문제 80:** `users` 테이블의 각 사용자별로 `orders` 테이블에 주문 내역이 있으면 '구매 고객', 없으면 '일반 고객'으로 분류하여 이름(`name`)과 함께 조회하세요.

```sql

```

**문제 81:** `orders` 테이블에서 주문 합계(`total`)를 소수점 첫째 자리에서 반올림하여 주문 ID(`id`)와 함께 조회하세요.

```sql

```

**문제 82:** `users` 테이블에서 가입 날짜(`created_at`)의 요일별 가입자 수를 조회하세요. (MySQL의 `DAYNAME` 함수 사용)

```sql

```

**문제 83:** `reviews` 테이블에서 리뷰 본문(`body`)의 길이를 구하고, 본문 길이가 100자 이상인 리뷰만 조회하세요.

```sql

```

**문제 84:** `products` 테이블에서 상품 평점(`rating`)의 소수점 이하를 버리고 정수부만 추출하여 이름(`title`)과 함께 조회하세요. (MySQL의 `FLOOR` 함수 사용)

```sql

```

**문제 85:** `users` 테이블의 이름(`name`) 컬럼 값을 첫 번째 공백을 기준으로 성(`first_name`)과 이름(`last_name`)으로 분리하여 조회하세요.

```sql

```

## 5. 종합 실습 및 심화 쿼리 (Total 100 Questions)

**문제 86:** `users` 테이블과 `orders` 테이블을 조인하여, 2018년에 가장 많은 금액(`total`)을 주문한 상위 5명의 사용자 이름과 총 주문 금액을 조회하세요.

```sql

```

**문제 87:** `products` 테이블에서 각 카테고리(`category`)별로 상품 개수, 평균 가격, 최대 가격, 최소 가격을 한 번에 조회하세요.

```sql

```

**문제 88:** `products` 테이블에서 평점(`rating`)이 4.5 이상인 상품들 중, `reviews` 테이블에 리뷰가 하나도 등록되지 않은 상품의 모든 정보를 조회하세요.

```sql

```

**문제 89:** `orders`, `users`, `products` 테이블을 조인하여, 각 주문 건에 대해 '주문 ID, 사용자 이름, 상품 이름, 주문 합계 금액(`total`)을 조회하세요.

```sql

```

**문제 90:** `orders` 테이블에서 총 주문 금액(`total`의 합계)이 가장 컸던 날짜(연-월-일)와 그날의 매출액 합계를 구하세요.

```sql

```

**문제 91:** `orders` 테이블에서 각 사용자의 주문 건 중, 해당 사용자의 평균 주문 금액보다 더 큰 금액(`total`)의 주문 내역(ID, 사용자 ID, 금액)을 조회하세요.

```sql

```

**문제 92:** `users`, `orders`, `products`, `reviews` 테이블을 조인하여, 'CA' 주(`state`) 사용자들이 가장 높은 평균 평점(`rating`)을 준 상위 3개 벤더(`vendor`)의 이름과 평균 평점을 조회하세요.

```sql

```

**문제 93:** `orders` 테이블에서 2018년과 2019년의 연도별 총 매출액(`total`의 합계)을 비교하여 조회하세요.

```sql

```

**문제 94:** `orders` 테이블과 `products` 테이블을 조인하여, 각 상품 카테고리(`category`)별 매출 비중(해당 카테고리 매출 합계 / 전체 매출 합계 * 100)을 구하세요.

```sql

```

**문제 95:** `users` 테이블과 `orders` 테이블을 조인하여, 자신의 가입일(`created_at`)로부터 1년 이내에 주문을 한 이력이 있는 사용자의 총 수를 구하세요.

```sql

```

**문제 96:** `products` 테이블과 `reviews` 테이블을 사용하여, 리뷰가 하나라도 달린 상품 중 평균 평점(`rating`)이 3점 미만인 상품의 공급업체(`vendor`) 이름을 중복 없이 조회하세요.

```sql

```

**문제 97:** `users` 테이블과 `orders` 테이블을 조인하여, 사용자의 가입 경로(`source`)별 평균 주문 금액(`total`)을 구하고 평균 금액이 높은 순으로 정렬하세요.

```sql

```

**문제 98:** `orders` 테이블에서 동일한 사용자가 동일한 상품을 2번 이상 주문한 경우의 사용자 ID(`user_id`)와 상품 ID(`product_id`), 그리고 주문 횟수를 조회하세요.

```sql

```

**문제 99:** `products` 테이블에서 가격(`price`)이 가장 높은 상품의 이름(`title`)과, 해당 상품이 속한 카테고리의 평균 가격을 함께 조회하세요.

```sql

```

**문제 100:** `orders` 테이블에서 전체 기간 동안 매달 주문을 한 '충성 고객'의 ID(`user_id`)를 조회하세요.

```sql

```

## 6. 인덱스 및 검색 성능 최적화 (INDEX)

**문제 101:** `users` 테이블에서 이메일(`email`)을 통한 검색 성능을 높이기 위해 `email` 컬럼에 인덱스를 생성하세요.

```sql

```

**문제 102:** `products` 테이블에서 상품명(`title`) 컬럼에 `idx_products_title`이라는 이름으로 인덱스를 생성하세요.

```sql

```

**문제 103:** `orders` 테이블에서 사용자 ID(`user_id`)와 상품 ID(`product_id`)를 동시에 사용하는 조인 쿼리 성능을 높이기 위해 두 컬럼을 묶은 복합 인덱스(Composite Index)를 생성하세요.

```sql

```

**문제 104:** `users` 테이블에 생성된 모든 인덱스 정보를 확인하는 쿼리를 작성하세요.

```sql

```

**문제 105:** `products` 테이블에서 가격(`price`)과 평점(`rating`)을 조건으로 하는 검색이 잦을 때 성능을 높이기 위한 복합 인덱스를 생성하세요.

```sql

```

**문제 106:** `users` 테이블에서 특정 이메일(`email`)의 중복을 방지하고 검색 성능을 높이기 위해 유니크 인덱스(Unique Index)를 생성하세요.

```sql

```

**문제 107:** `products` 테이블에서 더 이상 필요하지 않은 `idx_products_title` 인덱스를 삭제하세요.

```sql

```

**문제 108:** `orders` 테이블에서 주문 날짜(`created_at`) 컬럼에 인덱스를 생성하여 특정 기간 검색 성능을 최적화하세요.

```sql

```

**문제 109:** `reviews` 테이블에서 상품 ID(`product_id`) 컬럼에 인덱스를 생성하여 상품별 리뷰 조회 성능을 높이세요.

```sql

```

**문제 110:** 특정 쿼리(예: `SELECT * FROM users WHERE city = 'New York'`)가 인덱스를 타는지 확인하기 위해 실행 계획(Execution Plan)을 확인하는 키워드를 포함하여 쿼리를 작성하세요.

```sql

```

## 7. 심화 조회 및 윈도우 함수 (Advanced SELECT & Window Functions)

**문제 111:** `products` 테이블에서 각 카테고리별로 가격이 가장 높은 상품 상위 3개를 조회하세요. (윈도우 함수 `DENSE_RANK` 활용)

```sql

```

**문제 112:** `orders` 테이블에서 각 사용자별로 주문 금액 합계의 누적 합계(Cumulative Sum)를 가입일 순으로 조회하세요.

```sql

```

**문제 113:** `products` 테이블에서 전체 평균 가격과 각 상품 가격의 차이를 계산하여 조회하세요.

```sql

```

**문제 114:** `orders` 테이블에서 각 달(Month)별로 전월 대비 매출 증감액을 계산하세요. (윈도우 함수 `LAG` 활용)

```sql

```

**문제 115:** `products` 테이블에서 각 카테고리 내에서 가격 순위를 매겨 조회하세요.

```sql

```

**문제 116:** `users` 테이블에서 각 주(state)별 사용자 수의 비율을 전체 사용자 수 대비 백분율로 조회하세요.

```sql

```

**문제 117:** `reviews` 테이블에서 각 상품별로 평점이 5점인 리뷰의 개수와 해당 상품의 전체 리뷰 개수 대비 비율을 조회하세요.

```sql

```

**문제 118:** `orders` 테이블에서 주문 금액이 전체 상위 10%에 해당하는 주문들만 조회하세요. (윈도우 함수 `NTILE` 활용)

```sql

```

**문제 119:** `products` 테이블에서 각 카테고리별 평균 가격보다 비싼 상품들의 정보를 조회하되, 윈도우 함수를 사용하여 서브쿼리 없이 작성해 보세요.

```sql

```

**문제 120:** `users` 테이블에서 가입일로부터 현재까지 며칠이 지났는지 계산하여 조회하세요.

```sql

```

**문제 121:** `orders` 테이블에서 사용자별 첫 주문일과 마지막 주문일을 조회하세요.

```sql

```

**문제 122:** `products` 테이블에서 상품명(`title`)의 글자 수가 가장 긴 상품 5개를 조회하세요.

```sql

```

**문제 123:** `orders` 테이블에서 각 요일별 평균 주문 금액을 구하고, 평균 금액이 가장 높은 요일을 찾으세요.

```sql

```

**문제 124:** `reviews` 테이블에서 본문(`body`)에 특수문자나 숫자를 제외한 순수 한글/영문 글자 수만 계산하여 조회하세요. (MySQL의 `REGEXP_REPLACE` 활용 가능 시)

```sql

```

**문제 125:** `users` 테이블에서 이메일 아이디 부분( @ 앞부분 )의 길이를 계산하여 조회하세요.

```sql

```

**문제 126:** `orders` 테이블에서 1회 주문 시 2개 이상의 서로 다른 상품을 주문한 주문 건수를 조회하세요.

```sql

```

**문제 127:** `products` 테이블에서 카테고리별로 상품 가격의 중앙값(Median)을 구하는 쿼리를 작성하세요. (MySQL에서는 함수가 없으므로 윈도우 함수 등을 활용)

```sql

```

**문제 128:** `orders` 테이블에서 주문한 적이 있는 사용자와 없는 사용자의 비율을 각각 구하세요.

```sql

```

**문제 129:** `products` 테이블에서 벤더(vendor)별 총 매출 기여도(해당 벤더 상품의 총 주문 금액 합계)를 조회하세요.

```sql

```

**문제 130:** `users` 테이블에서 이름이 같은 동명이인이 있는지 확인하고, 있다면 이름과 인원수를 조회하세요.

```sql

```

**문제 131:** `orders` 테이블에서 주문 취소 건을 시뮬레이션하기 위해, 주문 금액(`total`)이 100달러 미만이면서 할인(`discount`)이 없는 주문을 조회하세요.

```sql

```

**문제 132:** `products` 테이블에서 상품 평점(`rating`)이 0.5 단위로 몇 개씩 있는지 분포를 조회하세요. (예: 4.0~4.5 미만, 4.5~5.0 미만 등)

```sql

```

**문제 133:** `users` 테이블에서 주소(`address`)에 'Street'이나 'St'가 포함된 사용자의 수를 조회하세요.

```sql

```

**문제 134:** `orders` 테이블에서 주문 금액(`total`)을 10달러 단위로 그룹화하여 빈도수(히스토그램)를 조회하세요.

```sql

```

**문제 135:** `products` 테이블에서 각 카테고리별로 가장 최근에 등록된(created_at 기준) 상품의 이름과 날짜를 조회하세요.

```sql

```

**문제 136:** `reviews` 테이블에서 같은 사용자가 동일한 상품에 대해 여러 번 리뷰를 남긴 경우를 찾으세요.

```sql

```

**문제 137:** `orders` 테이블에서 특정 기간(예: 2019-06-01 ~ 2019-08-31) 동안의 주말(토, 일) 주문 건수만 조회하세요.

```sql

```

**문제 138:** `products` 테이블에서 상품 설명(`title`)에 카테고리 이름이 포함된 상품을 조회하세요.

```sql

```

**문제 139:** `users` 테이블에서 생년월일(`birth_date`) 컬럼을 활용해 연령대별(20대, 30대 등) 사용자 수를 조회하세요.

```sql

```

**문제 140:** `orders` 테이블에서 세금(`tax`)이 주문 금액(`subtotal`)의 몇 퍼센트인지 계산하여 평균적인 세율을 구하세요.

```sql

```

**문제 141:** `products` 테이블에서 가격이 두 번째로 높은 상품을 조회하세요. (OFFSET 활용)

```sql

```

**문제 142:** `users` 테이블에서 이메일 도메인이 'gmail.com'인 사용자들 중 가장 최근에 가입한 10명을 조회하세요.

```sql

```

**문제 143:** `reviews` 테이블에서 평점이 3점 이하인 리뷰들만 모아, 상품별로 불만족 리뷰의 비중을 계산하세요.

```sql

```

**문제 144:** `orders` 테이블에서 분기별(Q1, Q2, Q3, Q4) 총 매출액을 조회하세요.

```sql

```

**문제 145:** `products` 테이블에서 'Widget' 카테고리 상품 중 'Gizmo' 카테고리의 평균 가격보다 비싼 상품을 조회하세요.

```sql

```

**문제 146:** `users` 테이블에서 이름(`name`)의 성씨(첫 글자)별 인원수를 조회하세요.

```sql

```

**문제 147:** `orders` 테이블에서 결제 수단이 없으므로 가상으로 `total`이 200달러 이상이면 'VIP 결제', 아니면 '일반 결제'라고 표시하고 각각의 건수를 조회하세요.

```sql

```

**문제 148:** `products` 테이블에서 재고(`quantity`)가 가장 적은 카테고리 순으로 정렬하세요.

```sql

```

**문제 149:** `reviews` 테이블에서 작성일시(`created_at`)의 시간대별(0-23시) 리뷰 작성 건수를 조회하세요.

```sql

```

**문제 150:** `users` 테이블에서 위도(`latitude`)와 경도(`longitude`) 정보를 이용해 북반구에 위치한 사용자의 수를 조회하세요. (위도 > 0)

```sql

```

**문제 151:** `orders` 테이블에서 각 사용자별로 총 주문 횟수와 평균 주문 간격(첫 주문일과 마지막 주문일 사이의 기간 / 주문 횟수)을 구하세요.

```sql

```

**문제 152:** `products` 테이블에서 상품명에 'Refined'가 들어간 상품들의 평균 평점을 조회하세요.

```sql

```

**문제 153:** `users` 테이블에서 가입 경로별로 가장 많이 가입한 날짜를 조회하세요.

```sql

```

**문제 154:** `orders` 테이블에서 연도별, 월별 매출 합계를 구하되, `WITH ROLLUP`을 사용하여 소계와 총계를 함께 표시하세요.

```sql

```

**문제 155:** `products` 테이블에서 카테고리별로 가격이 100달러 이상인 상품의 비율을 구하세요.

```sql

```

**문제 156:** `reviews` 테이블에서 본문에 'good', 'excellent', 'great' 등 긍정적인 단어가 포함된 리뷰의 개수를 조회하세요.

```sql

```

**문제 157:** `users` 테이블에서 가입한 지 1년이 넘었지만 주문 내역이 없는 사용자를 조회하세요.

```sql

```

**문제 158:** `orders` 테이블에서 상품별로 판매된 총 수량의 순위를 매기되, 동일 순위가 있을 경우 다음 순위를 건너뛰는 방식으로 조회하세요. (`RANK` 함수 활용)

```sql

```

**문제 159:** `products` 테이블에서 카테고리 이름의 알파벳 순서대로 상품을 정렬하되, 각 카테고리 내에서는 평점이 높은 순으로 조회하세요.

```sql

```

**문제 160:** `users` 테이블에서 주(state) 이름이 두 글자인(예: CA, NY) 사용자만 조회하세요.

```sql

```

**문제 161:** `orders` 테이블에서 각 사용자별로 두 번째 주문을 한 날짜를 조회하세요.

```sql

```

**문제 162:** `products` 테이블에서 'EAN' 번호의 첫 3자리를 국가 코드로 가정하고, 국가 코드별 상품 개수를 조회하세요.

```sql

```

**문제 163:** `reviews` 테이블에서 평점이 5점인 리뷰가 가장 많은 상품 상위 5개를 조회하세요.

```sql

```

**문제 164:** `users` 테이블에서 이름에 'and'가 포함된 사용자의 수를 조회하세요.

```sql

```

**문제 165:** `orders` 테이블에서 평균적으로 한 주문당 몇 종류의 상품이 포함되는지 구하세요. (현재 스키마 구조상 1주문 1상품이므로 1이 나오겠지만 쿼리를 작성해 보세요)

```sql

```

**문제 166:** `products` 테이블에서 가격에서 소수점 부분을 제외한 금액이 짝수인 상품만 조회하세요.

```sql

```

**문제 167:** `users` 테이블에서 도시(city) 이름에 공백이 포함된 도시들을 조회하세요.

```sql

```

**문제 168:** `orders` 테이블에서 매출액 상위 5% 사용자들의 평균 주문 금액을 구하세요.

```sql

```

**문제 169:** `products` 테이블에서 각 벤더(vendor)가 취급하는 카테고리의 개수를 조회하세요.

```sql

```

**문제 170:** `reviews` 테이블에서 본문의 단어 개수를 대략적으로 추정하여 조회하세요. (공백의 개수 + 1)

```sql

```

**문제 171:** `users` 테이블에서 가장 북쪽에 있는 사용자와 가장 남쪽에 있는 사용자의 이름과 위도를 조회하세요.

```sql

```

**문제 172:** `orders` 테이블에서 할인 금액(`discount`)이 0원인 주문과 0원 초과인 주문의 매출 비중을 비교하세요.

```sql

```

**문제 173:** `products` 테이블에서 'Gizmo'와 'Gadget' 카테고리 상품들의 평균 가격 차이를 구하세요.

```sql

```

**문제 174:** `users` 테이블에서 가입일로부터 7일 이내에 리뷰를 작성한 사용자의 목록을 조회하세요.

```sql

```

**문제 175:** `orders` 테이블에서 월별로 가장 많이 팔린 상품 1위의 이름과 판매량을 조회하세요.

```sql

```
