# SQL 조회(SELECT) 실습 문제 (정답편)

본 실습 문제 (정답편)은 MySQL 환경을 기준으로 작성되었습니다. 제공된 `../resources/ddl/schema.sql`과 데이터 파일들을 임포트한 후 실습을 진행해 주세요.

---

## 1. 기초 조회 및 필터링 (SELECT, WHERE, ORDER BY, LIMIT)

**문제 1:** `products` 테이블에서 모든 상품의 이름(`title`)과 가격(`price`) 컬럼을 조회하세요.

**정답:**
```sql
SELECT title, price FROM products;
EXPLAIN SELECT title, price FROM products;
```

**문제 2:** `products` 테이블에서 상품 카테고리(`category`) 목록을 중복 없이 조회하세요.

**정답:**
```sql
SELECT DISTINCT category FROM products;
EXPLAIN SELECT DISTINCT category FROM products;
```

**문제 3:** `products` 테이블에서 가격(`price`)이 50달러 이상인 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

**정답:**
```sql
SELECT title, price FROM products WHERE price >= 50;
EXPLAIN SELECT title, price FROM products WHERE price >= 50;
```

**문제 4:** `products` 테이블에서 'Gizmo' 카테고리에 속하면서 평점(`rating`)이 4.5 이상인 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products WHERE category = 'Gizmo' AND rating >= 4.5;
EXPLAIN SELECT * FROM products WHERE category = 'Gizmo' AND rating >= 4.5;
```

**문제 5:** `users` 테이블에서 이메일 주소(`email`)가 'yahoo.com'으로 끝나는 사용자의 이름(`name`)과 이메일(`email`)을 조회하세요.

**정답:**
```sql
SELECT name, email FROM users WHERE email LIKE '%@yahoo.com';
EXPLAIN SELECT name, email FROM users WHERE email LIKE '%@yahoo.com';
```

**문제 6:** `orders` 테이블에서 2018년에 생성된(`created_at` 컬럼 기준) 주문 건의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM orders WHERE created_at BETWEEN '2018-01-01 00:00:00' AND '2018-12-31 23:59:59';
EXPLAIN SELECT * FROM orders WHERE created_at BETWEEN '2018-01-01 00:00:00' AND '2018-12-31 23:59:59';
-- 또는
SELECT * FROM orders WHERE created_at LIKE '2018%';
EXPLAIN SELECT * FROM orders WHERE created_at LIKE '2018%';
```

**문제 7:** `products` 테이블에서 상품을 가격(`price`)이 높은 순서대로 정렬하여 상위 5개 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products ORDER BY price DESC LIMIT 5;
EXPLAIN SELECT * FROM products ORDER BY price DESC LIMIT 5;
```

**문제 8:** `users` 테이블에서 주(`state`)가 'CA', 'NY', 'TX'인 사용자들의 이름(`name`)과 주(`state`)를 조회하세요.

**정답:**
```sql
SELECT name, state FROM users WHERE state IN ('CA', 'NY', 'TX');
EXPLAIN SELECT name, state FROM users WHERE state IN ('CA', 'NY', 'TX');
```

**문제 9:** `products` 테이블에서 평점(`rating`)이 0인 상품의 이름(`title`)과 카테고리(`category`)를 조회하세요.

**정답:**
```sql
SELECT title, category FROM products WHERE rating = 0;
EXPLAIN SELECT title, category FROM products WHERE rating = 0;
```

**문제 10:** `products` 테이블에서 상품 이름(`title`)에 'Small'이 포함된 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

**정답:**
```sql
SELECT title, price FROM products WHERE title LIKE '%Small%';
EXPLAIN SELECT title, price FROM products WHERE title LIKE '%Small%';
```

**문제 11:** `products` 테이블에서 벤더(`vendor`)가 'Senger-Stamm'인 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products WHERE vendor = 'Senger-Stamm';
EXPLAIN SELECT * FROM products WHERE vendor = 'Senger-Stamm';
```

**문제 12:** `products` 테이블에서 상품 가격(`price`)이 20달러에서 40달러 사이인 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

**정답:**
```sql
SELECT title, price FROM products WHERE price BETWEEN 20 AND 40;
EXPLAIN SELECT title, price FROM products WHERE price BETWEEN 20 AND 40;
```

**문제 13:** `products` 테이블에서 'Gadget' 카테고리가 아닌 상품들 중 가격(`price`)이 100달러 이상인 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products WHERE category <> 'Gadget' AND price >= 100;
EXPLAIN SELECT * FROM products WHERE category <> 'Gadget' AND price >= 100;
```

**문제 14:** `users` 테이블에서 도시(`city`)가 'Portland'인 사용자의 이름(`name`)과 주소(`address`)를 조회하세요.

**정답:**
```sql
SELECT name, address FROM users WHERE city = 'Portland';
EXPLAIN SELECT name, address FROM users WHERE city = 'Portland';
```

**문제 15:** `users` 테이블에서 '2019-01-01' 이후에 생성된(`created_at` 컬럼 기준) 사용자들 중 가입 경로(`source`)가 'Google'인 사용자의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM users WHERE created_at >= '2019-01-01 00:00:00' AND source = 'Google';
EXPLAIN SELECT * FROM users WHERE created_at >= '2019-01-01 00:00:00' AND source = 'Google';
```

**문제 16:** `products` 테이블에서 상품 이름(`title`)이 'Aerodynamic'으로 시작하는 상품의 이름(`title`)과 가격(`price`)을 조회하세요.

**정답:**
```sql
SELECT title, price FROM products WHERE title LIKE 'Aerodynamic%';
EXPLAIN SELECT title, price FROM products WHERE title LIKE 'Aerodynamic%';
```

**문제 17:** `reviews` 테이블에서 평점(`rating`)이 1점인 리뷰의 본문(`body`)을 조회하세요.

**정답:**
```sql
SELECT body FROM reviews WHERE rating = 1;
EXPLAIN SELECT body FROM reviews WHERE rating = 1;
```

**문제 18:** `orders` 테이블에서 할인(`discount`)이 0보다 큰(적용된) 주문의 총 건수를 조회하세요.

**정답:**
```sql
SELECT COUNT(*) FROM orders WHERE discount > 0;
EXPLAIN SELECT COUNT(*) FROM orders WHERE discount > 0;
```

**문제 19:** `users` 테이블에서 우편번호(`zip`)가 '9'로 시작하는 사용자들의 이름(`name`)과 우편번호(`zip`)를 조회하세요.

**정답:**
```sql
SELECT name, zip FROM users WHERE zip LIKE '9%';
EXPLAIN SELECT name, zip FROM users WHERE zip LIKE '9%';
```

**문제 20:** `products` 테이블에서 상품을 카테고리(`category`)별로 오름차순 정렬하고, 같은 카테고리 내에서는 가격(`price`)이 낮은 순(오름차순)으로 정렬하여 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products ORDER BY category ASC, price ASC;
EXPLAIN SELECT * FROM products ORDER BY category ASC, price ASC;
```

**문제 21:** `products` 테이블에서 평점(`rating`)이 4.0 이상 4.8 이하인 상품의 이름(`title`)과 평점(`rating`)을 조회하세요.

**정답:**
```sql
SELECT title, rating FROM products WHERE rating BETWEEN 4.0 AND 4.8;
EXPLAIN SELECT title, rating FROM products WHERE rating BETWEEN 4.0 AND 4.8;
```

**문제 22:** `users` 테이블에서 가입 경로(`source`)가 'Twitter' 또는 'Facebook'인 사용자의 이름(`name`)과 가입 경로(`source`)를 조회하세요.

**정답:**
```sql
SELECT name, source FROM users WHERE source IN ('Twitter', 'Facebook');
EXPLAIN SELECT name, source FROM users WHERE source IN ('Twitter', 'Facebook');
```

**문제 23:** `products` 테이블에서 수량(`quantity`)이 5000개가 아닌 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products WHERE quantity <> 5000;
EXPLAIN SELECT * FROM products WHERE quantity <> 5000;
```

**문제 24:** `users` 테이블에서 주(`state`) 컬럼 값이 비어있지 않은(NULL이 아니고 빈 문자열이 아닌) 사용자의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM users WHERE state IS NOT NULL AND state <> '';
EXPLAIN SELECT * FROM users WHERE state IS NOT NULL AND state <> '';
```

**문제 25:** `orders` 테이블에서 세금(`tax`)이 10달러를 초과하는 주문의 ID(`id`)와 세금(`tax`)을 조회하세요.

**정답:**
```sql
SELECT id, tax FROM orders WHERE tax > 10;
EXPLAIN SELECT id, tax FROM orders WHERE tax > 10;
```

## 2. 집계 및 그룹화 (Aggregate Functions, GROUP BY, HAVING)

**문제 26:** `products` 테이블에 등록된 전체 상품의 개수는 몇 개입니까?

**정답:**
```sql
SELECT COUNT(*) FROM products;
EXPLAIN SELECT COUNT(*) FROM products;
```

**문제 27:** `products` 테이블에서 각 카테고리(`category`)별 상품 개수를 조회하세요.

**정답:**
```sql
SELECT category, COUNT(*) FROM products GROUP BY category;
EXPLAIN SELECT category, COUNT(*) FROM products GROUP BY category;
```

**문제 28:** `products` 테이블에서 카테고리(`category`)별 평균 상품 가격(`price`)을 조회하되, 평균 가격이 높은 순으로 정렬하세요.

**정답:**
```sql
SELECT category, AVG(price) as avg_price 
FROM products 
GROUP BY category 
ORDER BY avg_price DESC;
EXPLAIN ORDER BY avg_price DESC;
```

**문제 29:** `orders` 테이블에서 모든 주문의 총 매출액(`total`의 합계)을 구하세요.

**정답:**
```sql
SELECT SUM(total) FROM orders;
EXPLAIN SELECT SUM(total) FROM orders;
```

**문제 30:** `orders` 테이블에서 각 사용자(`user_id`)별로 주문한 총 횟수를 조회하세요.

**정답:**
```sql
SELECT user_id, COUNT(*) as order_count FROM orders GROUP BY user_id;
EXPLAIN SELECT user_id, COUNT(*) as order_count FROM orders GROUP BY user_id;
```

**문제 31:** `reviews` 테이블을 사용하여 각 상품(`product_id`)별 평균 평점(`rating`)을 조회하세요.

**정답:**
```sql
SELECT product_id, AVG(rating) FROM reviews GROUP BY product_id;
EXPLAIN SELECT product_id, AVG(rating) FROM reviews GROUP BY product_id;
```

**문제 32:** `users` 테이블에서 각 주(`state`)별 사용자 수를 조회하되, 사용자 수가 50명 이상인 주만 출력하세요.

**정답:**
```sql
SELECT state, COUNT(*) as user_count 
FROM users 
GROUP BY state 
HAVING user_count >= 50;
EXPLAIN HAVING user_count >= 50;
```

**문제 33:** `orders` 테이블에서 2019년 1월 한 달 동안 발생한 총 주문 금액(`total`의 합계)을 구하세요.

**정답:**
```sql
SELECT SUM(total) 
FROM orders 
WHERE created_at >= '2019-01-01 00:00:00' AND created_at < '2019-02-01 00:00:00';
EXPLAIN WHERE created_at >= '2019-01-01 00:00:00' AND created_at < '2019-02-01 00:00:00';
```

**문제 34:** `products` 테이블에서 가장 비싼 상품의 가격(`price`)과 가장 저렴한 상품의 가격(`price`)을 조회하세요.

**정답:**
```sql
SELECT MAX(price), MIN(price) FROM products;
EXPLAIN SELECT MAX(price), MIN(price) FROM products;
```

**문제 35:** `users` 테이블에서 가입 경로(`source`)별 사용자 수를 조회하세요.

**정답:**
```sql
SELECT source, COUNT(*) FROM users GROUP BY source;
EXPLAIN SELECT source, COUNT(*) FROM users GROUP BY source;
```

**문제 36:** `products` 테이블에서 각 카테고리(`category`)별로 가장 높은 평점(`rating`)을 조회하세요.

**정답:**
```sql
SELECT category, MAX(rating) FROM products GROUP BY category;
EXPLAIN SELECT category, MAX(rating) FROM products GROUP BY category;
```

**문제 37:** `products` 테이블에서 벤더(`vendor`)별로 공급하는 상품의 총 개수를 조회하세요.

**정답:**
```sql
SELECT vendor, COUNT(*) FROM products GROUP BY vendor;
EXPLAIN SELECT vendor, COUNT(*) FROM products GROUP BY vendor;
```

**문제 38:** `orders` 테이블에서 각 상품(`product_id`)별 총 판매 수량(`quantity`)의 합계를 구하세요.

**정답:**
```sql
SELECT product_id, SUM(quantity) FROM orders GROUP BY product_id;
EXPLAIN SELECT product_id, SUM(quantity) FROM orders GROUP BY product_id;
```

**문제 39:** `users` 테이블에서 각 년도별로 가입한 사용자 수를 조회하세요. (`created_at` 컬럼 활용)

**정답:**
```sql
SELECT YEAR(created_at) as year, COUNT(*) FROM users GROUP BY year;
EXPLAIN SELECT YEAR(created_at) as year, COUNT(*) FROM users GROUP BY year;
```

**문제 40:** `products` 테이블에서 평균 가격(`price`)이 50달러 이상인 카테고리(`category`)와 그 평균 가격을 조회하세요.

**정답:**
```sql
SELECT category, AVG(price) as avg_price 
FROM products 
GROUP BY category 
HAVING avg_price >= 50;
EXPLAIN HAVING avg_price >= 50;
```

**문제 41:** `reviews` 테이블에서 각 평점(`rating`, 1~5)별 리뷰 개수를 조회하세요.

**정답:**
```sql
SELECT rating, COUNT(*) FROM reviews GROUP BY rating;
EXPLAIN SELECT rating, COUNT(*) FROM reviews GROUP BY rating;
```

**문제 42:** `users` 테이블에서 각 도시(`city`)별 사용자 수를 조회하되, 사용자 수가 많은 도시부터 내림차순으로 정렬하세요.

**정답:**
```sql
SELECT city, COUNT(*) as user_cnt FROM users GROUP BY city ORDER BY user_cnt DESC;
EXPLAIN SELECT city, COUNT(*) as user_cnt FROM users GROUP BY city ORDER BY user_cnt DESC;
```

**문제 43:** `orders` 테이블에서 주문 금액(`total`)의 평균보다 높은 주문들의 총 개수를 조회하세요. (서브쿼리 활용)

**정답:**
```sql
SELECT COUNT(*) FROM orders WHERE total > (SELECT AVG(total) FROM orders);
EXPLAIN SELECT COUNT(*) FROM orders WHERE total > (SELECT AVG(total) FROM orders);
```

**문제 44:** `products` 테이블에서 각 카테고리(`category`)별 상품 가격(`price`)의 표준편차를 구하세요. (MySQL의 `STDDEV` 함수 사용)

**정답:**
```sql
SELECT category, STDDEV(price) FROM products GROUP BY category;
EXPLAIN SELECT category, STDDEV(price) FROM products GROUP BY category;
```

**문제 45:** `orders` 테이블에서 중복을 제외한 주문 상품(`product_id`)의 총 개수를 조회하세요.

**정답:**
```sql
SELECT COUNT(DISTINCT product_id) FROM orders;
EXPLAIN SELECT COUNT(DISTINCT product_id) FROM orders;
```

**문제 46:** `orders` 테이블에서 2018년에 주문을 한 번이라도 한 사용자(`user_id`)의 총 수를 구하세요.

**정답:**
```sql
SELECT COUNT(DISTINCT user_id) FROM orders WHERE created_at LIKE '2018%';
EXPLAIN SELECT COUNT(DISTINCT user_id) FROM orders WHERE created_at LIKE '2018%';
```

**문제 47:** `products` 테이블에서 벤더(`vendor`)별 평균 평점(`rating`)을 구하되, 평균 평점이 4.0 이상인 벤더만 조회하세요.

**정답:**
```sql
SELECT vendor, AVG(rating) as avg_rating 
FROM products 
GROUP BY vendor 
HAVING avg_rating >= 4.0;
EXPLAIN HAVING avg_rating >= 4.0;
```

**문제 48:** `orders` 테이블에서 각 사용자(`user_id`)별 총 주문 금액(`total`)의 합계를 구하되, 합계 금액이 500달러 이상인 사용자만 조회하세요.

**정답:**
```sql
SELECT user_id, SUM(total) as total_sum 
FROM orders 
GROUP BY user_id 
HAVING total_sum >= 500;
EXPLAIN HAVING total_sum >= 500;
```

**문제 49:** `reviews` 테이블에서 2018년 이후에 작성된 리뷰들 중, 상품(`product_id`)별 리뷰 개수를 조회하세요.

**정답:**
```sql
SELECT product_id, COUNT(*) FROM reviews WHERE created_at >= '2018-01-01 00:00:00' GROUP BY product_id;
EXPLAIN SELECT product_id, COUNT(*) FROM reviews WHERE created_at >= '2018-01-01 00:00:00' GROUP BY product_id;
```

**문제 50:** `products` 테이블에서 상품 카테고리(`category`)가 'Gizmo'인 상품들의 총 재고 수량(`quantity`) 합계를 구하세요.

**정답:**
```sql
SELECT SUM(quantity) FROM products WHERE category = 'Gizmo';
EXPLAIN SELECT SUM(quantity) FROM products WHERE category = 'Gizmo';
```

## 3. 조인 및 서브쿼리 (JOIN, Subqueries)

**문제 51:** `orders` 테이블과 `users` 테이블을 조인하여, 각 주문의 ID(`id`)와 주문한 사용자의 이름(`name`)을 조회하세요.

**정답:**
```sql
SELECT o.id, u.name 
FROM orders o 
JOIN users u ON o.user_id = u.id;
EXPLAIN JOIN users u ON o.user_id = u.id;
```

**문제 52:** `orders`, `users`, `products` 테이블을 조인하여, 'Gizmo' 카테고리 상품을 주문한 사용자들의 이메일(`email`)을 중복 없이 조회하세요.

**정답:**
```sql
SELECT DISTINCT u.email 
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id
WHERE p.category = 'Gizmo';
EXPLAIN WHERE p.category = 'Gizmo';
```

**문제 53:** `products` 테이블과 `reviews` 테이블을 조인하여, 각 상품별 이름(`title`)과 해당 상품에 달린 리뷰 본문(`body`)을 조회하세요. (리뷰가 없는 상품은 제외)

**정답:**
```sql
SELECT p.title, r.body 
FROM products p
JOIN reviews r ON p.id = r.product_id;
EXPLAIN JOIN reviews r ON p.id = r.product_id;
```

**문제 54:** `products` 테이블과 `reviews` 테이블을 조인하여, 평균 평점(`rating`)이 4.0 이상인 상품들의 이름(`title`)과 평균 평점을 조회하세요.

**정답:**
```sql
SELECT p.title, AVG(r.rating) as avg_rating
FROM products p
JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.title
HAVING avg_rating >= 4.0;
EXPLAIN HAVING avg_rating >= 4.0;
```

**문제 55:** `products` 테이블에서 `orders` 테이블에 존재하지 않는(한 번도 주문된 적이 없는) 상품의 이름(`title`)을 조회하세요.

**정답:**
```sql
SELECT title 
FROM products 
WHERE id NOT IN (SELECT DISTINCT product_id FROM orders);
EXPLAIN WHERE id NOT IN (SELECT DISTINCT product_id FROM orders);
-- 또는
SELECT p.title
FROM products p
LEFT JOIN orders o ON p.id = o.product_id
WHERE o.id IS NULL;
EXPLAIN WHERE o.id IS NULL;
```

**문제 56:** `products` 테이블과 `orders` 테이블을 조인하여, 가장 많이 주문된 상품 상위 3개의 이름(`title`)과 주문 횟수를 조회하세요.

**정답:**
```sql
SELECT p.title, COUNT(o.id) as order_count
FROM products p
JOIN orders o ON p.id = o.product_id
GROUP BY p.id, p.title
ORDER BY order_count DESC
LIMIT 3;
EXPLAIN LIMIT 3;
```

**문제 57:** `users` 테이블과 `orders` 테이블을 `LEFT JOIN`하여, 각 사용자의 이름(`name`)과 그 사용자가 마지막으로 주문한 날짜(`created_at`)를 조회하세요.

**정답:**
```sql
SELECT u.name, MAX(o.created_at) as last_order_date
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;
EXPLAIN GROUP BY u.id, u.name;
```

**문제 58:** `orders` 테이블에서 주문 금액(`total`)이 전체 평균 주문 금액보다 큰 주문들의 ID(`id`)와 금액(`total`)을 조회하세요.

**정답:**
```sql
SELECT id, total 
FROM orders 
WHERE total > (SELECT AVG(total) FROM orders);
EXPLAIN WHERE total > (SELECT AVG(total) FROM orders);
```

**문제 59:** `products` 테이블에서 각 카테고리(`category`)별로 가장 비싼 상품의 카테고리, 이름(`title`), 가격(`price`)을 조회하세요. (서브쿼리 활용)

**정답:**
```sql
SELECT p1.category, p1.title, p1.price
FROM products p1
WHERE p1.price = (
    SELECT MAX(p2.price) 
    FROM products p2 
    WHERE p2.category = p1.category
);
EXPLAIN );
```

**문제 60:** `orders` 테이블과 `users` 테이블을 조인하여, 'TX' 주(`state`)에 거주하는 사용자들이 주문한 총 주문 금액(`total`)의 합계를 구하세요.

**정답:**
```sql
SELECT SUM(o.total)
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.state = 'TX';
EXPLAIN WHERE u.state = 'TX';
```

**문제 61:** `reviews` 테이블과 `products` 테이블을 조인하여, 각 리뷰별로 리뷰 작성자(`reviewer`)의 이름과 해당 상품의 이름(`title`)을 함께 조회하세요.

**정답:**
```sql
SELECT r.reviewer, p.title 
FROM reviews r
JOIN products p ON r.product_id = p.id;
EXPLAIN JOIN products p ON r.product_id = p.id;
```

**문제 62:** `orders` 테이블과 `products` 테이블을 조인하여, 주문한 상품의 가격(`price`)이 100달러 이상인 주문들의 주문 ID(`id`)와 상품 이름(`title`)을 조회하세요.

**정답:**
```sql
SELECT o.id, p.title 
FROM orders o
JOIN products p ON o.product_id = p.id
WHERE p.price >= 100;
EXPLAIN WHERE p.price >= 100;
```

**문제 63:** `products`, `orders`, `users` 테이블을 조인하여, 'Affiliate' 경로로 가입한 사용자(`source`)들이 주문한 상품들의 카테고리(`category`)를 중복 없이 조회하세요.

**정답:**
```sql
SELECT DISTINCT p.category 
FROM products p
JOIN orders o ON p.id = o.product_id
JOIN users u ON o.user_id = u.id
WHERE u.source = 'Affiliate';
EXPLAIN WHERE u.source = 'Affiliate';
```

**문제 64:** `users`, `orders`, `products` 테이블을 조인하여, 각 주(`state`)별로 가장 많이 주문된 상품 카테고리(`category`)와 그 주문 건수를 조회하세요.

**정답:**
```sql
-- 복잡한 쿼리이므로 단계별로 접근
SELECT state, category, COUNT(*) as cnt
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id
GROUP BY state, category;
EXPLAIN GROUP BY state, category;
-- 위 결과를 바탕으로 각 state별 max(cnt)를 구하는 서브쿼리가 추가로 필요합니다.
```

**문제 65:** `products` 테이블과 `reviews` 테이블을 조인하여, 리뷰가 5개 이상 달린 상품의 이름(`title`)과 리뷰 개수를 조회하세요.

**정답:**
```sql
SELECT p.title, COUNT(r.id) as review_cnt
FROM products p
JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.title
HAVING review_cnt >= 5;
EXPLAIN HAVING review_cnt >= 5;
```

**문제 66:** `orders` 테이블과 `users` 테이블을 조인하여, 2018년에 가입한 사용자들이 2019년에 주문한 총 금액(`total`)의 합계를 구하세요.

**정답:**
```sql
SELECT SUM(o.total)
FROM orders o
JOIN users u ON o.user_id = u.id
WHERE u.created_at LIKE '2018%' AND o.created_at LIKE '2019%';
EXPLAIN WHERE u.created_at LIKE '2018%' AND o.created_at LIKE '2019%';
```

**문제 67:** `products` 테이블에서 상품 평점(`rating`)이 해당 카테고리(`category`)의 평균 평점보다 높은 상품들의 이름(`title`)과 평점(`rating`)을 조회하세요.

**정답:**
```sql
SELECT p1.title, p1.rating
FROM products p1
WHERE p1.rating > (
    SELECT AVG(p2.rating) 
    FROM products p2 
    WHERE p2.category = p1.category
);
EXPLAIN );
```

**문제 68:** `users` 테이블에서 주문 내역(`orders`)이 없는 사용자들의 이메일(`email`)을 조회하세요. (`NOT EXISTS` 활용)

**정답:**
```sql
SELECT u.email 
FROM users u
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id
);
EXPLAIN );
```

**문제 69:** `products` 테이블과 `orders` 테이블을 조인하여, 각 벤더(`vendor`)별로 가장 많이 판매된(주문 횟수 기준) 상품의 이름(`title`)을 조회하세요.

**정답:**
```sql
-- 벤더별 상품 주문 횟수 집계 후 벤더 내 최대값 조회
SELECT p1.vendor, p1.title, COUNT(o1.id) as order_cnt
FROM products p1
JOIN orders o1 ON p1.id = o1.product_id
GROUP BY p1.vendor, p1.id
HAVING order_cnt = (
    SELECT MAX(order_counts.cnt)
    FROM (
        SELECT p2.vendor, COUNT(o2.id) as cnt
        FROM products p2
        JOIN orders o2 ON p2.id = o2.product_id
        GROUP BY p2.vendor, p2.id
    ) as order_counts
    WHERE order_counts.vendor = p1.vendor
);
EXPLAIN );
```

**문제 70:** `products` 테이블과 `reviews` 테이블을 조인하여, 사용자 'Hudson Borer'가 작성한 리뷰가 있는 상품의 이름(`title`)을 조회하세요.

**정답:**
```sql
SELECT DISTINCT p.title
FROM products p
JOIN reviews r ON p.id = r.product_id
WHERE r.reviewer = 'Hudson Borer';
EXPLAIN WHERE r.reviewer = 'Hudson Borer';
```

**문제 71:** `users` 테이블에서 'Gizmo' 카테고리 상품을 주문하지 않은 사용자의 ID(`id`)와 이름(`name`)을 조회하세요.

**정답:**
```sql
SELECT id, name 
FROM users 
WHERE id NOT IN (
    SELECT DISTINCT o.user_id 
    FROM orders o 
    JOIN products p ON o.product_id = p.id 
    WHERE p.category = 'Gizmo'
);
EXPLAIN );
```

**문제 72:** `products` 테이블과 `orders` 테이블을 조인하여, 상품 이름(`title`)과 해당 상품을 주문한 사용자 수를 조회하세요. (주문되지 않은 상품도 0으로 표시)

**정답:**
```sql
SELECT p.title, COUNT(o.id) as user_cnt
FROM products p
LEFT JOIN orders o ON p.id = o.product_id
GROUP BY p.id, p.title;
EXPLAIN GROUP BY p.id, p.title;
```

**문제 73:** `users`, `orders`, `products` 테이블을 조인하여, 각 상품 카테고리(`category`)별로 주문 합계(`total`)가 가장 큰 사용자의 이름을 조회하세요.

**정답:**
```sql
-- 생략 (다중 단계 조인 및 서브쿼리 필요)
```

**문제 74:** `users` 테이블과 `orders` 테이블을 조인하여, 할인율(`discount`)이 0.5 이상인 주문을 한 사용자들이 거주하는 도시(`city`) 목록을 중복 없이 조회하세요.

**정답:**
```sql
SELECT DISTINCT u.city 
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE o.discount >= 0.5;
EXPLAIN WHERE o.discount >= 0.5;
```

**문제 75:** `products` 테이블과 `reviews` 테이블을 조인하여, 리뷰 본문(`body`)에 'love'라는 단어가 포함된 리뷰를 받은 상품의 이름(`title`)을 조회하세요.

**정답:**
```sql
SELECT DISTINCT p.title
FROM products p
JOIN reviews r ON p.id = r.product_id
WHERE r.body LIKE '%love%';
EXPLAIN WHERE r.body LIKE '%love%';
```

## 4. 데이터 변환 및 조건문 (CASE, DATE_FORMAT 등)

**문제 76:** `products` 테이블에서 가격(`price`)이 100달러를 초과하면 '고가', 50달러에서 100달러 사이면 '중가', 50달러 미만이면 '저가'로 분류하여 상품 이름(`title`)과 가격, 분류(`price_range`)를 조회하세요.

**정답:**
```sql
SELECT title, price,
    CASE 
        WHEN price < 50 THEN '저가'
        WHEN price BETWEEN 50 AND 100 THEN '중가'
        ELSE '고가'
    END as price_range
FROM products;
EXPLAIN FROM products;
```

**문제 77:** `users` 테이블에서 이메일 주소(`email`)의 도메인(예: gmail.com, yahoo.com)만 추출하여, 각 도메인별 사용자 수를 조회하세요.

**정답:**
```sql
SELECT SUBSTRING_INDEX(email, '@', -1) as domain, COUNT(*) 
FROM users 
GROUP BY domain;
EXPLAIN GROUP BY domain;
```

**문제 78:** `orders` 테이블에서 주문 날짜(`created_at`)를 'YYYY-MM' 형식으로 변환하여, 월별 주문 건수를 조회하세요.

**정답:**
```sql
SELECT DATE_FORMAT(created_at, '%Y-%m') as month, COUNT(*) 
FROM orders 
GROUP BY month;
EXPLAIN GROUP BY month;
```

**문제 79:** `products` 테이블에서 수량(`quantity`)이 100개 이하이면 '재고 부족', 아니면 '정상'으로 표시하여 상품 이름(`title`)과 상태를 조회하세요.

**정답:**
```sql
SELECT title, quantity,
    IF(quantity <= 100, '재고 부족', '정상') as stock_status
FROM products;
EXPLAIN FROM products;
```

**문제 80:** `users` 테이블의 각 사용자별로 `orders` 테이블에 주문 내역이 있으면 '구매 고객', 없으면 '일반 고객'으로 분류하여 이름(`name`)과 함께 조회하세요.

**정답:**
```sql
SELECT u.name,
    CASE 
        WHEN EXISTS (SELECT 1 FROM orders o WHERE o.user_id = u.id) THEN '구매 고객'
        ELSE '일반 고객'
    END as customer_type
FROM users u;
EXPLAIN FROM users u;
```

**문제 81:** `orders` 테이블에서 주문 합계(`total`)를 소수점 첫째 자리에서 반올림하여 주문 ID(`id`)와 함께 조회하세요.

**정답:**
```sql
SELECT id, ROUND(total, 0) FROM orders;
EXPLAIN SELECT id, ROUND(total, 0) FROM orders;
```

**문제 82:** `users` 테이블에서 가입 날짜(`created_at`)의 요일별 가입자 수를 조회하세요. (MySQL의 `DAYNAME` 함수 사용)

**정답:**
```sql
SELECT DAYNAME(created_at) as day, COUNT(*) 
FROM users 
GROUP BY day;
EXPLAIN GROUP BY day;
```

**문제 83:** `reviews` 테이블에서 리뷰 본문(`body`)의 길이를 구하고, 본문 길이가 100자 이상인 리뷰만 조회하세요.

**정답:**
```sql
SELECT body, LENGTH(body) as body_len 
FROM reviews 
WHERE LENGTH(body) >= 100;
EXPLAIN WHERE LENGTH(body) >= 100;
```

**문제 84:** `products` 테이블에서 상품 평점(`rating`)의 소수점 이하를 버리고 정수부만 추출하여 이름(`title`)과 함께 조회하세요. (MySQL의 `FLOOR` 함수 사용)

**정답:**
```sql
SELECT title, FLOOR(rating) FROM products;
EXPLAIN SELECT title, FLOOR(rating) FROM products;
```

**문제 85:** `users` 테이블의 이름(`name`) 컬럼 값을 첫 번째 공백을 기준으로 성(`first_name`)과 이름(`last_name`)으로 분리하여 조회하세요.

**정답:**
```sql
SELECT name, 
    SUBSTRING_INDEX(name, ' ', 1) as first_name,
    SUBSTRING_INDEX(name, ' ', -1) as last_name
FROM users;
EXPLAIN FROM users;
```

## 5. 종합 실습 및 심화 쿼리 (Total 100 Questions)

**문제 86:** `users` 테이블과 `orders` 테이블을 조인하여, 2018년에 가장 많은 금액(`total`)을 주문한 상위 5명의 사용자 이름과 총 주문 금액을 조회하세요.

**정답:**
```sql
SELECT u.name, SUM(o.total) as total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE o.created_at LIKE '2018%'
GROUP BY u.id, u.name
ORDER BY total_spent DESC
LIMIT 5;
EXPLAIN LIMIT 5;
```

**문제 87:** `products` 테이블에서 각 카테고리(`category`)별로 상품 개수, 평균 가격, 최대 가격, 최소 가격을 한 번에 조회하세요.

**정답:**
```sql
SELECT category, COUNT(*), AVG(price), MAX(price), MIN(price)
FROM products
GROUP BY category;
EXPLAIN GROUP BY category;
```

**문제 88:** `products` 테이블에서 평점(`rating`)이 4.5 이상인 상품들 중, `reviews` 테이블에 리뷰가 하나도 등록되지 않은 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products p
WHERE rating >= 4.5 
AND NOT EXISTS (SELECT 1 FROM reviews r WHERE r.product_id = p.id);
EXPLAIN AND NOT EXISTS (SELECT 1 FROM reviews r WHERE r.product_id = p.id);
```

**문제 89:** `orders`, `users`, `products` 테이블을 조인하여, 각 주문 건에 대해 '주문 ID, 사용자 이름, 상품 이름, 주문 합계 금액(`total`)을 조회하세요.

**정답:**
```sql
SELECT o.id, u.name, p.title, o.total
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN products p ON o.product_id = p.id;
EXPLAIN JOIN products p ON o.product_id = p.id;
```

**문제 90:** `orders` 테이블에서 총 주문 금액(`total`의 합계)이 가장 컸던 날짜(연-월-일)와 그날의 매출액 합계를 구하세요.

**정답:**
```sql
SELECT DATE(created_at) as order_date, SUM(total) as daily_total
FROM orders
GROUP BY order_date
ORDER BY daily_total DESC
LIMIT 1;
EXPLAIN LIMIT 1;
```

**문제 91:** `orders` 테이블에서 각 사용자의 주문 건 중, 해당 사용자의 평균 주문 금액보다 더 큰 금액(`total`)의 주문 내역(ID, 사용자 ID, 금액)을 조회하세요.

**정답:**
```sql
SELECT o1.id, o1.user_id, o1.total
FROM orders o1
WHERE o1.total > (
    SELECT AVG(o2.total) 
    FROM orders o2 
    WHERE o2.user_id = o1.user_id
);
EXPLAIN );
```

**문제 92:** `users`, `orders`, `products`, `reviews` 테이블을 조인하여, 'CA' 주(`state`) 사용자들이 가장 높은 평균 평점(`rating`)을 준 상위 3개 벤더(`vendor`)의 이름과 평균 평점을 조회하세요.

**정답:**
```sql
SELECT p.vendor, AVG(r.rating) as avg_rating
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id
JOIN reviews r ON p.id = r.product_id
WHERE u.state = 'CA'
GROUP BY p.vendor
ORDER BY avg_rating DESC
LIMIT 3;
EXPLAIN LIMIT 3;
```

**문제 93:** `orders` 테이블에서 2018년과 2019년의 연도별 총 매출액(`total`의 합계)을 비교하여 조회하세요.

**정답:**
```sql
SELECT 
    SUM(CASE WHEN created_at LIKE '2018%' THEN total ELSE 0 END) as sales_2018,
    SUM(CASE WHEN created_at LIKE '2019%' THEN total ELSE 0 END) as sales_2019
FROM orders;
EXPLAIN FROM orders;
```

**문제 94:** `orders` 테이블과 `products` 테이블을 조인하여, 각 상품 카테고리(`category`)별 매출 비중(해당 카테고리 매출 합계 / 전체 매출 합계 * 100)을 구하세요.

**정답:**
```sql
SELECT category, 
    SUM(total) / (SELECT SUM(total) FROM orders) * 100 as ratio
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY category;
EXPLAIN GROUP BY category;
```

**문제 95:** `users` 테이블과 `orders` 테이블을 조인하여, 자신의 가입일(`created_at`)로부터 1년 이내에 주문을 한 이력이 있는 사용자의 총 수를 구하세요.

**정답:**
```sql
SELECT COUNT(DISTINCT u.id)
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE o.created_at <= DATE_ADD(u.created_at, INTERVAL 1 YEAR);
EXPLAIN WHERE o.created_at <= DATE_ADD(u.created_at, INTERVAL 1 YEAR);
```

**문제 96:** `products` 테이블과 `reviews` 테이블을 사용하여, 리뷰가 하나라도 달린 상품 중 평균 평점(`rating`)이 3점 미만인 상품의 공급업체(`vendor`) 이름을 중복 없이 조회하세요.

**정답:**
```sql
SELECT DISTINCT vendor 
FROM products 
WHERE id IN (
    SELECT product_id 
    FROM reviews 
    GROUP BY product_id 
    HAVING AVG(rating) < 3
);
EXPLAIN );
```

**문제 97:** `users` 테이블과 `orders` 테이블을 조인하여, 사용자의 가입 경로(`source`)별 평균 주문 금액(`total`)을 구하고 평균 금액이 높은 순으로 정렬하세요.

**정답:**
```sql
SELECT u.source, AVG(o.total) as avg_total
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.source
ORDER BY avg_total DESC;
EXPLAIN ORDER BY avg_total DESC;
```

**문제 98:** `orders` 테이블에서 동일한 사용자가 동일한 상품을 2번 이상 주문한 경우의 사용자 ID(`user_id`)와 상품 ID(`product_id`), 그리고 주문 횟수를 조회하세요.

**정답:**
```sql
SELECT user_id, product_id, COUNT(*) as cnt
FROM orders
GROUP BY user_id, product_id
HAVING cnt >= 2;
EXPLAIN HAVING cnt >= 2;
```

**문제 99:** `products` 테이블에서 가격(`price`)이 가장 높은 상품의 이름(`title`)과, 해당 상품이 속한 카테고리의 평균 가격을 함께 조회하세요.

**정답:**
```sql
SELECT p1.title, p1.price, (
    SELECT AVG(p2.price) 
    FROM products p2 
    WHERE p2.category = p1.category
) as cat_avg_price
FROM products p1
ORDER BY price DESC
LIMIT 1;
EXPLAIN LIMIT 1;
```

**문제 100:** `orders` 테이블에서 전체 기간 동안 매달 주문을 한 '충성 고객'의 ID(`user_id`)를 조회하세요.

**정답:**
```sql
-- 간단한 방식: 주문한 서로 다른 월의 개수가 전체 운영 월수와 같은지 확인
SELECT user_id
FROM orders
GROUP BY user_id
HAVING COUNT(DISTINCT DATE_FORMAT(created_at, '%Y-%m')) = (
    SELECT COUNT(DISTINCT DATE_FORMAT(created_at, '%Y-%m')) FROM orders
);
EXPLAIN );
```

## 6. 인덱스 및 검색 성능 최적화 (INDEX)

**문제 101:** `users` 테이블에서 이메일(`email`)을 통한 검색 성능을 높이기 위해 `email` 컬럼에 인덱스를 생성하세요.

**정답:**
```sql
CREATE INDEX idx_users_email ON users(email);
```

**문제 102:** `products` 테이블에서 상품명(`title`) 컬럼에 `idx_products_title`이라는 이름으로 인덱스를 생성하세요.

**정답:**
```sql
CREATE INDEX idx_products_title ON products(title);
```

**문제 103:** `orders` 테이블에서 사용자 ID(`user_id`)와 상품 ID(`product_id`)를 동시에 사용하는 조인 쿼리 성능을 높이기 위해 두 컬럼을 묶은 복합 인덱스(Composite Index)를 생성하세요.

**정답:**
```sql
CREATE INDEX idx_orders_user_product ON orders(user_id, product_id);
```

**문제 104:** `users` 테이블에 생성된 모든 인덱스 정보를 확인하는 쿼리를 작성하세요.

**정답:**
```sql
SHOW INDEX FROM users;
```

**문제 105:** `products` 테이블에서 가격(`price`)과 평점(`rating`)을 조건으로 하는 검색이 잦을 때 성능을 높이기 위한 복합 인덱스를 생성하세요.

**정답:**
```sql
CREATE INDEX idx_products_price_rating ON products(price, rating);
```

**문제 106:** `users` 테이블에서 특정 이메일(`email`)의 중복을 방지하고 검색 성능을 높이기 위해 유니크 인덱스(Unique Index)를 생성하세요.

**정답:**
```sql
CREATE UNIQUE INDEX uq_users_email ON users(email);
```

**문제 107:** `products` 테이블에서 더 이상 필요하지 않은 `idx_products_title` 인덱스를 삭제하세요.

**정답:**
```sql
DROP INDEX idx_products_title ON products;
-- 또는
ALTER TABLE products DROP INDEX idx_products_title;
```

**문제 108:** `orders` 테이블에서 주문 날짜(`created_at`) 컬럼에 인덱스를 생성하여 특정 기간 검색 성능을 최적화하세요.

**정답:**
```sql
CREATE INDEX idx_orders_created_at ON orders(created_at);
```

**문제 109:** `reviews` 테이블에서 상품 ID(`product_id`) 컬럼에 인덱스를 생성하여 상품별 리뷰 조회 성능을 높이세요.

**정답:**
```sql
CREATE INDEX idx_reviews_product_id ON reviews(product_id);
```

**문제 110:** 특정 쿼리(예: `SELECT * FROM users WHERE city = 'New York'`)가 인덱스를 타는지 확인하기 위해 실행 계획(Execution Plan)을 확인하는 키워드를 포함하여 쿼리를 작성하세요.

**정답:**
```sql
EXPLAIN SELECT * FROM users WHERE city = 'New York';
```

## 7. 심화 조회 및 윈도우 함수 (Advanced SELECT & Window Functions)

**문제 111:** `products` 테이블에서 각 카테고리별로 가격이 가장 높은 상품 상위 3개를 조회하세요. (윈도우 함수 `DENSE_RANK` 활용)

**정답:**
```sql
SELECT * FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY category ORDER BY price DESC) as rnk
    FROM products
) t WHERE rnk <= 3;
```

**문제 112:** `orders` 테이블에서 각 사용자별로 주문 금액 합계의 누적 합계(Cumulative Sum)를 가입일 순으로 조회하세요.

**정답:**
```sql
SELECT o.user_id, o.total, o.created_at,
       SUM(o.total) OVER (PARTITION BY o.user_id ORDER BY o.created_at) as cum_sum
FROM orders o;
```

**문제 113:** `products` 테이블에서 전체 평균 가격과 각 상품 가격의 차이를 계산하여 조회하세요.

**정답:**
```sql
SELECT title, price, 
       AVG(price) OVER () as avg_price,
       price - AVG(price) OVER () as diff
FROM products;
```

**문제 114:** `orders` 테이블에서 각 달(Month)별로 전월 대비 매출 증감액을 계산하세요. (윈도우 함수 `LAG` 활용)

**정답:**
```sql
WITH MonthlySales AS (
    SELECT DATE_FORMAT(created_at, '%Y-%m') as month, SUM(total) as sales
    FROM orders
    GROUP BY month
)
SELECT month, sales,
       LAG(sales) OVER (ORDER BY month) as prev_sales,
       sales - LAG(sales) OVER (ORDER BY month) as diff
FROM MonthlySales;
```

**문제 115:** `products` 테이블에서 각 카테고리 내에서 가격 순위를 매겨 조회하세요.

**정답:**
```sql
SELECT category, title, price,
       RANK() OVER (PARTITION BY category ORDER BY price DESC) as price_rank
FROM products;
```

**문제 116:** `users` 테이블에서 각 주(state)별 사용자 수의 비율을 전체 사용자 수 대비 백분율로 조회하세요.

**정답:**
```sql
SELECT state, COUNT(*) as cnt,
       COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () as percentage
FROM users
GROUP BY state;
```

**문제 117:** `reviews` 테이블에서 각 상품별로 평점이 5점인 리뷰의 개수와 해당 상품의 전체 리뷰 개수 대비 비율을 조회하세요.

**정답:**
```sql
SELECT product_id,
       COUNT(CASE WHEN rating = 5 THEN 1 END) as five_star_cnt,
       COUNT(*) as total_cnt,
       COUNT(CASE WHEN rating = 5 THEN 1 END) / COUNT(*) as ratio
FROM reviews
GROUP BY product_id;
```

**문제 118:** `orders` 테이블에서 주문 금액이 전체 상위 10%에 해당하는 주문들만 조회하세요. (윈도우 함수 `NTILE` 활용)

**정답:**
```sql
SELECT * FROM (
    SELECT *, NTILE(10) OVER (ORDER BY total DESC) as tile
    FROM orders
) t WHERE tile = 1;
```

**문제 119:** `products` 테이블에서 각 카테고리별 평균 가격보다 비싼 상품들의 정보를 조회하되, 윈도우 함수를 사용하여 서브쿼리 없이 작성해 보세요.

**정답:**
```sql
SELECT * FROM (
    SELECT *, AVG(price) OVER (PARTITION BY category) as avg_cat_price
    FROM products
) t WHERE price > avg_cat_price;
```

**문제 120:** `users` 테이블에서 가입일로부터 현재까지 며칠이 지났는지 계산하여 조회하세요.

**정답:**
```sql
SELECT name, created_at, DATEDIFF(NOW(), created_at) as days_passed FROM users;
```

**문제 121:** `orders` 테이블에서 사용자별 첫 주문일과 마지막 주문일을 조회하세요.

**정답:**
```sql
SELECT user_id, MIN(created_at) as first_order, MAX(created_at) as last_order
FROM orders
GROUP BY user_id;
```

**문제 122:** `products` 테이블에서 상품명(`title`)의 글자 수가 가장 긴 상품 5개를 조회하세요.

**정답:**
```sql
SELECT title, LENGTH(title) as len FROM products ORDER BY len DESC LIMIT 5;
```

**문제 123:** `orders` 테이블에서 각 요일별 평균 주문 금액을 구하고, 평균 금액이 가장 높은 요일을 찾으세요.

**정답:**
```sql
SELECT DAYNAME(created_at) as day, AVG(total) as avg_total
FROM orders
GROUP BY day
ORDER BY avg_total DESC
LIMIT 1;
```

**문제 124:** `reviews` 테이블에서 본문(`body`)에 특수문자나 숫자를 제외한 순수 한글/영문 글자 수만 계산하여 조회하세요. (MySQL의 `REGEXP_REPLACE` 활용 가능 시)

**정답:**
```sql
-- MySQL 8.0 이상
SELECT body, LENGTH(REGEXP_REPLACE(body, '[^a-zA-Z가-힣]', '')) as clean_len FROM reviews;
```

**문제 125:** `users` 테이블에서 이메일 아이디 부분( @ 앞부분 )의 길이를 계산하여 조회하세요.

**정답:**
```sql
SELECT email, LENGTH(SUBSTRING_INDEX(email, '@', 1)) as id_len FROM users;
```

**문제 126:** `orders` 테이블에서 1회 주문 시 2개 이상의 서로 다른 상품을 주문한 주문 건수를 조회하세요.

**정답:**
```sql
-- 현재 스키마에서는 1주문 1상품 구조이므로 0이 나오겠지만 쿼리 형식은 다음과 같습니다.
SELECT COUNT(*) FROM (
    SELECT id FROM orders GROUP BY id HAVING COUNT(DISTINCT product_id) >= 2
) t;
```

**문제 127:** `products` 테이블에서 카테고리별로 상품 가격의 중앙값(Median)을 구하는 쿼리를 작성하세요. (MySQL에서는 함수가 없으므로 윈도우 함수 등을 활용)

**정답:**
```sql
SELECT category, AVG(price) as median
FROM (
    SELECT category, price,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY price) as row_num,
           COUNT(*) OVER (PARTITION BY category) as total_cnt
    FROM products
) t
WHERE row_num IN (FLOOR((total_cnt + 1) / 2), CEIL((total_cnt + 1) / 2))
GROUP BY category;
```

**문제 128:** `orders` 테이블에서 주문한 적이 있는 사용자와 없는 사용자의 비율을 각각 구하세요.

**정답:**
```sql
SELECT 
    COUNT(DISTINCT o.user_id) / COUNT(u.id) as ordered_ratio,
    (COUNT(u.id) - COUNT(DISTINCT o.user_id)) / COUNT(u.id) as never_ordered_ratio
FROM users u
LEFT JOIN orders o ON u.id = o.user_id;
```

**문제 129:** `products` 테이블에서 벤더(vendor)별 총 매출 기여도(해당 벤더 상품의 총 주문 금액 합계)를 조회하세요.

**정답:**
```sql
SELECT p.vendor, SUM(o.total) as vendor_sales
FROM products p
JOIN orders o ON p.id = o.product_id
GROUP BY p.vendor
ORDER BY vendor_sales DESC;
```

**문제 130:** `users` 테이블에서 이름이 같은 동명이인이 있는지 확인하고, 있다면 이름과 인원수를 조회하세요.

**정답:**
```sql
SELECT name, COUNT(*) as cnt
FROM users
GROUP BY name
HAVING cnt >= 2;
```

**문제 131:** `orders` 테이블에서 주문 취소 건을 시뮬레이션하기 위해, 주문 금액(`total`)이 100달러 미만이면서 할인(`discount`)이 없는 주문을 조회하세요.

**정답:**
```sql
SELECT * FROM orders WHERE total < 100 AND discount = 0;
```

**문제 132:** `products` 테이블에서 상품 평점(`rating`)이 0.5 단위로 몇 개씩 있는지 분포를 조회하세요. (예: 4.0~4.5 미만, 4.5~5.0 미만 등)

**정답:**
```sql
SELECT FLOOR(rating * 2) / 2 as rating_group, COUNT(*)
FROM products
GROUP BY rating_group
ORDER BY rating_group;
```

**문제 133:** `users` 테이블에서 주소(`address`)에 'Street'이나 'St'가 포함된 사용자의 수를 조회하세요.

**정답:**
```sql
SELECT COUNT(*) FROM users WHERE address LIKE '%Street%' OR address LIKE '%St%';
```

**문제 134:** `orders` 테이블에서 주문 금액(`total`)을 10달러 단위로 그룹화하여 빈도수(히스토그램)를 조회하세요.

**정답:**
```sql
SELECT FLOOR(total / 10) * 10 as range_start, COUNT(*)
FROM orders
GROUP BY range_start
ORDER BY range_start;
```

**문제 135:** `products` 테이블에서 각 카테고리별로 가장 최근에 등록된(created_at 기준) 상품의 이름과 날짜를 조회하세요.

**정답:**
```sql
SELECT category, title, created_at
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY category ORDER BY created_at DESC) as rn
    FROM products
) t WHERE rn = 1;
```

**문제 136:** `reviews` 테이블에서 같은 사용자가 동일한 상품에 대해 여러 번 리뷰를 남긴 경우를 찾으세요.

**정답:**
```sql
SELECT reviewer, product_id, COUNT(*) as cnt
FROM reviews
GROUP BY reviewer, product_id
HAVING cnt >= 2;
```

**문제 137:** `orders` 테이블에서 특정 기간(예: 2019-06-01 ~ 2019-08-31) 동안의 주말(토, 일) 주문 건수만 조회하세요.

**정답:**
```sql
SELECT COUNT(*)
FROM orders
WHERE created_at BETWEEN '2019-06-01' AND '2019-08-31'
  AND DAYOFWEEK(created_at) IN (1, 7); -- 1: 일요일, 7: 토요일
```

**문제 138:** `products` 테이블에서 상품 설명(`title`)에 카테고리 이름이 포함된 상품을 조회하세요.

**정답:**
```sql
SELECT title, category FROM products WHERE title LIKE CONCAT('%', category, '%');
```

**문제 139:** `users` 테이블에서 생년월일(`birth_date`) 컬럼을 활용해 연령대별(20대, 30대 등) 사용자 수를 조회하세요.

**정답:**
```sql
-- birth_date가 문자열 'YYYY-MM-DD' 형식이라고 가정
SELECT FLOOR((YEAR(NOW()) - YEAR(birth_date)) / 10) * 10 as age_group, COUNT(*)
FROM users
GROUP BY age_group;
```

**문제 140:** `orders` 테이블에서 세금(`tax`)이 주문 금액(`subtotal`)의 몇 퍼센트인지 계산하여 평균적인 세율을 구하세요.

**정답:**
```sql
SELECT AVG(tax / subtotal * 100) as avg_tax_rate FROM orders WHERE subtotal > 0;
```

**문제 141:** `products` 테이블에서 가격이 두 번째로 높은 상품을 조회하세요. (OFFSET 활용)

**정답:**
```sql
SELECT * FROM products ORDER BY price DESC LIMIT 1 OFFSET 1;
```

**문제 142:** `users` 테이블에서 이메일 도메인이 'gmail.com'인 사용자들 중 가장 최근에 가입한 10명을 조회하세요.

**정답:**
```sql
SELECT * FROM users WHERE email LIKE '%@gmail.com' ORDER BY created_at DESC LIMIT 10;
```

**문제 143:** `reviews` 테이블에서 평점이 3점 이하인 리뷰들만 모아, 상품별로 불만족 리뷰의 비중을 계산하세요.

**정답:**
```sql
SELECT product_id,
       COUNT(CASE WHEN rating <= 3 THEN 1 END) / COUNT(*) as unsatisfied_ratio
FROM reviews
GROUP BY product_id;
```

**문제 144:** `orders` 테이블에서 분기별(Q1, Q2, Q3, Q4) 총 매출액을 조회하세요.

**정답:**
```sql
SELECT QUARTER(created_at) as qr, SUM(total)
FROM orders
GROUP BY qr
ORDER BY qr;
```

**문제 145:** `products` 테이블에서 'Widget' 카테고리 상품 중 'Gizmo' 카테고리의 평균 가격보다 비싼 상품을 조회하세요.

**정답:**
```sql
SELECT * FROM products 
WHERE category = 'Widget' 
  AND price > (SELECT AVG(price) FROM products WHERE category = 'Gizmo');
```

**문제 146:** `users` 테이블에서 이름(`name`)의 성씨(첫 글자)별 인원수를 조회하세요.

**정답:**
```sql
SELECT LEFT(name, 1) as first_char, COUNT(*)
FROM users
GROUP BY first_char;
```

**문제 147:** `orders` 테이블에서 결제 수단이 없으므로 가상으로 `total`이 200달러 이상이면 'VIP 결제', 아니면 '일반 결제'라고 표시하고 각각의 건수를 조회하세요.

**정답:**
```sql
SELECT IF(total >= 200, 'VIP 결제', '일반 결제') as payment_type, COUNT(*)
FROM orders
GROUP BY payment_type;
```

**문제 148:** `products` 테이블에서 재고(`quantity`)가 가장 적은 카테고리 순으로 정렬하세요.

**정답:**
```sql
SELECT category, SUM(quantity) as total_qty
FROM products
GROUP BY category
ORDER BY total_qty ASC;
```

**문제 149:** `reviews` 테이블에서 작성일시(`created_at`)의 시간대별(0-23시) 리뷰 작성 건수를 조회하세요.

**정답:**
```sql
SELECT HOUR(created_at) as hr, COUNT(*)
FROM reviews
GROUP BY hr
ORDER BY hr;
```

**문제 150:** `users` 테이블에서 위도(`latitude`)와 경도(`longitude`) 정보를 이용해 북반구에 위치한 사용자의 수를 조회하세요. (위도 > 0)

**정답:**
```sql
SELECT COUNT(*) FROM users WHERE latitude > 0;
```

**문제 151:** `orders` 테이블에서 각 사용자별로 총 주문 횟수와 평균 주문 간격(첫 주문일과 마지막 주문일 사이의 기간 / 주문 횟수)을 구하세요.

**정답:**
```sql
SELECT user_id, COUNT(*) as cnt,
       DATEDIFF(MAX(created_at), MIN(created_at)) / COUNT(*) as avg_interval
FROM orders
GROUP BY user_id;
```

**문제 152:** `products` 테이블에서 상품명에 'Refined'가 들어간 상품들의 평균 평점을 조회하세요.

**정답:**
```sql
SELECT AVG(rating) FROM products WHERE title LIKE '%Refined%';
```

**문제 153:** `users` 테이블에서 가입 경로별로 가장 많이 가입한 날짜를 조회하세요.

**정답:**
```sql
SELECT source, date_only
FROM (
    SELECT source, DATE(created_at) as date_only, COUNT(*) as cnt,
           ROW_NUMBER() OVER (PARTITION BY source ORDER BY COUNT(*) DESC) as rn
    FROM users
    GROUP BY source, date_only
) t WHERE rn = 1;
```

**문제 154:** `orders` 테이블에서 연도별, 월별 매출 합계를 구하되, `WITH ROLLUP`을 사용하여 소계와 총계를 함께 표시하세요.

**정답:**
```sql
SELECT YEAR(created_at) as yr, MONTH(created_at) as mo, SUM(total)
FROM orders
GROUP BY yr, mo WITH ROLLUP;
```

**문제 155:** `products` 테이블에서 카테고리별로 가격이 100달러 이상인 상품의 비율을 구하세요.

**정답:**
```sql
SELECT category, 
       COUNT(CASE WHEN price >= 100 THEN 1 END) / COUNT(*) as high_price_ratio
FROM products
GROUP BY category;
```

**문제 156:** `reviews` 테이블에서 본문에 'good', 'excellent', 'great' 등 긍정적인 단어가 포함된 리뷰의 개수를 조회하세요.

**정답:**
```sql
SELECT COUNT(*) FROM reviews 
WHERE body REGEXP 'good|excellent|great';
```

**문제 157:** `users` 테이블에서 가입한 지 1년이 넘었지만 주문 내역이 없는 사용자를 조회하세요.

**정답:**
```sql
SELECT u.* FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at < DATE_SUB(NOW(), INTERVAL 1 YEAR)
  AND o.id IS NULL;
```

**문제 158:** `orders` 테이블에서 상품별로 판매된 총 수량의 순위를 매기되, 동일 순위가 있을 경우 다음 순위를 건너뛰는 방식으로 조회하세요. (`RANK` 함수 활용)

**정답:**
```sql
SELECT product_id, SUM(quantity) as total_qty,
       RANK() OVER (ORDER BY SUM(quantity) DESC) as rnk
FROM orders
GROUP BY product_id;
```

**문제 159:** `products` 테이블에서 카테고리 이름의 알파벳 순서대로 상품을 정렬하되, 각 카테고리 내에서는 평점이 높은 순으로 조회하세요.

**정답:**
```sql
SELECT * FROM products ORDER BY category ASC, rating DESC;
```

**문제 160:** `users` 테이블에서 주(state) 이름이 두 글자인(예: CA, NY) 사용자만 조회하세요.

**정답:**
```sql
SELECT * FROM users WHERE LENGTH(state) = 2;
```

**문제 161:** `orders` 테이블에서 각 사용자별로 두 번째 주문을 한 날짜를 조회하세요.

**정답:**
```sql
SELECT user_id, created_at
FROM (
    SELECT user_id, created_at,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at) as rn
    FROM orders
) t WHERE rn = 2;
```

**문제 162:** `products` 테이블에서 'EAN' 번호의 첫 3자리를 국가 코드로 가정하고, 국가 코드별 상품 개수를 조회하세요.

**정답:**
```sql
SELECT LEFT(ean, 3) as country_code, COUNT(*)
FROM products
GROUP BY country_code;
```

**문제 163:** `reviews` 테이블에서 평점이 5점인 리뷰가 가장 많은 상품 상위 5개를 조회하세요.

**정답:**
```sql
SELECT product_id, COUNT(*) as five_star_cnt
FROM reviews
WHERE rating = 5
GROUP BY product_id
ORDER BY five_star_cnt DESC
LIMIT 5;
```

**문제 164:** `users` 테이블에서 이름에 'and'가 포함된 사용자의 수를 조회하세요.

**정답:**
```sql
SELECT COUNT(*) FROM users WHERE name LIKE '%and%';
```

**문제 165:** `orders` 테이블에서 평균적으로 한 주문당 몇 종류의 상품이 포함되는지 구하세요. (현재 스키마 구조상 1주문 1상품이므로 1이 나오겠지만 쿼리를 작성해 보세요)

**정답:**
```sql
SELECT AVG(distinct_prod_cnt)
FROM (
    SELECT id, COUNT(DISTINCT product_id) as distinct_prod_cnt
    FROM orders
    GROUP BY id
) t;
```

**문제 166:** `products` 테이블에서 가격에서 소수점 부분을 제외한 금액이 짝수인 상품만 조회하세요.

**정답:**
```sql
SELECT * FROM products WHERE FLOOR(price) % 2 = 0;
```

**문제 167:** `users` 테이블에서 도시(city) 이름에 공백이 포함된 도시들을 조회하세요.

**정답:**
```sql
SELECT DISTINCT city FROM users WHERE city LIKE '% %';
```

**문제 168:** `orders` 테이블에서 매출액 상위 5% 사용자들의 평균 주문 금액을 구하세요.

**정답:**
```sql
WITH UserSales AS (
    SELECT user_id, SUM(total) as total_spent,
           PERCENT_RANK() OVER (ORDER BY SUM(total) DESC) as pr
    FROM orders
    GROUP BY user_id
)
SELECT AVG(total_spent) FROM UserSales WHERE pr <= 0.05;
```

**문제 169:** `products` 테이블에서 각 벤더(vendor)가 취급하는 카테고리의 개수를 조회하세요.

**정답:**
```sql
SELECT vendor, COUNT(DISTINCT category) FROM products GROUP BY vendor;
```

**문제 170:** `reviews` 테이블에서 본문의 단어 개수를 대략적으로 추정하여 조회하세요. (공백의 개수 + 1)

**정답:**
```sql
SELECT body, (LENGTH(body) - LENGTH(REPLACE(body, ' ', '')) + 1) as word_count FROM reviews;
```

**문제 171:** `users` 테이블에서 가장 북쪽에 있는 사용자와 가장 남쪽에 있는 사용자의 이름과 위도를 조회하세요.

**정답:**
```sql
(SELECT name, latitude, 'North' as type FROM users ORDER BY latitude DESC LIMIT 1)
UNION ALL
(SELECT name, latitude, 'South' as type FROM users ORDER BY latitude ASC LIMIT 1);
```

**문제 172:** `orders` 테이블에서 할인 금액(`discount`)이 0원인 주문과 0원 초과인 주문의 매출 비중을 비교하세요.

**정답:**
```sql
SELECT 
    IF(discount > 0, 'Discounted', 'No Discount') as type,
    SUM(total) as sales,
    SUM(total) / SUM(SUM(total)) OVER () as ratio
FROM orders
GROUP BY type;
```

**문제 173:** `products` 테이블에서 'Gizmo'와 'Gadget' 카테고리 상품들의 평균 가격 차이를 구하세요.

**정답:**
```sql
SELECT 
    ABS(AVG(CASE WHEN category = 'Gizmo' THEN price END) - 
        AVG(CASE WHEN category = 'Gadget' THEN price END)) as price_diff
FROM products;
```

**문제 174:** `users` 테이블에서 가입일로부터 7일 이내에 리뷰를 작성한 사용자의 목록을 조회하세요.

**정답:**
```sql
SELECT DISTINCT u.name
FROM users u
JOIN reviews r ON u.name = r.reviewer -- reviewer 이름이 users.name과 매칭된다고 가정
WHERE r.created_at <= DATE_ADD(u.created_at, INTERVAL 7 DAY);
```

**문제 175:** `orders` 테이블에서 월별로 가장 많이 팔린 상품 1위의 이름과 판매량을 조회하세요.

**정답:**
```sql
SELECT month, title, total_qty
FROM (
    SELECT DATE_FORMAT(o.created_at, '%Y-%m') as month, p.title, SUM(o.quantity) as total_qty,
           ROW_NUMBER() OVER (PARTITION BY DATE_FORMAT(o.created_at, '%Y-%m') ORDER BY SUM(o.quantity) DESC) as rn
    FROM orders o
    JOIN products p ON o.product_id = p.id
    GROUP BY month, p.title
) t WHERE rn = 1;
```
