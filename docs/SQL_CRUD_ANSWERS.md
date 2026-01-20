# SQL CRUD(CREATE, READ, UPDATE, DELETE) 실습 문제 (정답편)

본 실습 문제 (정답편)은 MySQL 환경을 기준으로 작성되었습니다. 제공된 `../resources/ddl/schema.sql`과 데이터 파일들을 임포트한 후 실습을 진행해 주세요.

---

## 1. 데이터 조회 (READ)

**문제 1:** `users` 테이블에서 모든 사용자의 이름(`name`)과 이메일(`email`)을 조회하세요.

**정답:**
```sql
SELECT name, email FROM users;
EXPLAIN SELECT name, email FROM users;
```

**문제 2:** `products` 테이블에서 가격(`price`)이 100달러 이상인 상품의 모든 정보를 조회하세요.

**정답:**
```sql
SELECT * FROM products WHERE price >= 100;
EXPLAIN SELECT * FROM products WHERE price >= 100;
```

**문제 3:** `reviews` 테이블에서 평점(`rating`)이 5점인 리뷰의 내용(`body`)과 작성자(`reviewer`)를 조회하세요.

**정답:**
```sql
SELECT body, reviewer FROM reviews WHERE rating = 5;
EXPLAIN SELECT body, reviewer FROM reviews WHERE rating = 5;
```

**문제 4:** `orders` 테이블에서 특정 사용자(예: `user_id` = 1)의 주문 내역을 모두 조회하세요.

**정답:**
```sql
SELECT * FROM orders WHERE user_id = 1;
EXPLAIN SELECT * FROM orders WHERE user_id = 1;
```

**문제 5:** `products` 테이블에서 각 카테고리(`category`)별 상품 개수를 조회하세요.

**정답:**
```sql
SELECT category, COUNT(*) FROM products GROUP BY category;
EXPLAIN SELECT category, COUNT(*) FROM products GROUP BY category;
```

---

## 2. 데이터 삽입 (INSERT / CREATE)

**문제 6:** `products` 테이블에 새로운 상품을 등록하세요.
- 카테고리: 'Gadget'
- EAN: '1234567890123'
- 가격: 99.99
- 평점: 5.0
- 상품명: 'Super Smart Watch'
- 제조사: 'NHN Academy'
- 생성일: 현재 시간

**정답:**
```sql
INSERT INTO products (category, ean, price, rating, title, vendor, created_at)
VALUES ('Gadget', '1234567890123', 99.99, 5.0, 'Super Smart Watch', 'NHN Academy', NOW());
```

**문제 7:** `users` 테이블에 새로운 사용자를 등록하세요.
- 이름: '홍길동'
- 이메일: 'gildong@nhnacademy.com'
- 가입일: '2023-10-01 10:00:00'
- 가입 경로: 'Google'
- 주소: '광주광역시 동구'
- 도시: 'Gwangju'
- 주: 'GJ'
- 비밀번호: 'password123'

**정답:**
```sql
INSERT INTO users (name, email, created_at, source, address, city, state, password)
VALUES ('홍길동', 'gildong@nhnacademy.com', '2023-10-01 10:00:00', 'Google', '광주광역시 동구', 'Gwangju', 'GJ', 'password123');
```

**문제 8:** `reviews` 테이블에 'Super Smart Watch'(상품 ID는 방금 등록한 ID 혹은 임의의 ID)에 대한 리뷰를 등록하세요.
- 평점: 5
- 작성자: '홍길동'
- 내용: '정말 스마트한 시계네요! 대만족입니다.'
- 생성일: 현재 시간

**정답:**
```sql
-- Super Smart Watch의 ID를 201이라고 가정할 때
INSERT INTO reviews (product_id, rating, reviewer, body, created_at)
VALUES (201, 5, '홍길동', '정말 스마트한 시계네요! 대만족입니다.', NOW());
```

**문제 9:** `products` 테이블에 여러 상품을 한 번에 등록하세요.
- 상품 1: ('Widget', '9876543210987', 15.50, 4.2, 'Mini Widget', 'Widget Corp')
- 상품 2: ('Widget', '9876543210988', 12.00, 3.8, 'Small Widget', 'Widget Corp')

**정답:**
```sql
INSERT INTO products (category, ean, price, rating, title, vendor, created_at)
VALUES 
('Widget', '9876543210987', 15.50, 4.2, 'Mini Widget', 'Widget Corp', NOW()),
('Widget', '9876543210988', 12.00, 3.8, 'Small Widget', 'Widget Corp', NOW());
```

**문제 10:** `orders` 테이블에 홍길동 사용자가 'Super Smart Watch'를 2개 구매한 내역을 등록하세요. (필요한 컬럼: `user_id`, `product_id`, `quantity`, `subtotal`, `tax`, `total`, `created_at`)

**정답:**
```sql
-- user_id=2501, product_id=201 이라고 가정할 때
INSERT INTO orders (user_id, product_id, quantity, subtotal, tax, total, created_at)
VALUES (2501, 201, 2, 179.98, 18.00, 197.98, NOW());
```

---

## 3. 데이터 수정 (UPDATE)

**문제 11:** `products` 테이블에서 'Super Smart Watch' 상품의 가격을 89.99로 인하하세요.

**정답:**
```sql
UPDATE products 
SET price = 89.99 
WHERE title = 'Super Smart Watch';
```

**문제 12:** `users` 테이블에서 '홍길동' 사용자의 주소를 '서울특별시 강남구'로, 도시를 'Seoul'로, 주를 'SL'로 변경하세요.

**정답:**
```sql
UPDATE users 
SET address = '서울특별시 강남구', city = 'Seoul', state = 'SL' 
WHERE name = '홍길동';
```

**문제 13:** `products` 테이블에서 'Widget' 카테고리의 모든 상품 수량(`quantity`)을 현재 수량에서 100개씩 추가하세요.

**정답:**
```sql
UPDATE products 
SET quantity = quantity + 100 
WHERE category = 'Widget';
```

**문제 14:** `reviews` 테이블에서 평점이 1점인 모든 리뷰의 내용을 '불만족스러운 서비스입니다.'로 일괄 수정하세요.

**정답:**
```sql
UPDATE reviews 
SET body = '불만족스러운 서비스입니다.' 
WHERE rating = 1;
```

**문제 15:** `orders` 테이블에서 2023년 이전에 발생한 모든 주문의 할인율(`discount`)을 0.1로 설정하세요.

**정답:**
```sql
UPDATE orders 
SET discount = 0.1 
WHERE created_at < '2023-01-01 00:00:00';
```

**문제 16:** `products` 테이블에서 평점(`rating`)이 4.0 이상인 상품들의 가격을 5% 인상하세요.

**정답:**
```sql
UPDATE products 
SET price = price * 1.05 
WHERE rating >= 4.0;
```

**문제 17:** `users` 테이블에서 가입 경로(`source`)가 NULL인 사용자의 가입 경로를 'Unknown'으로 변경하세요.

**정답:**
```sql
UPDATE users 
SET source = 'Unknown' 
WHERE source IS NULL;
```

**문제 18:** `reviews` 테이블에서 특정 상품(예: product_id = 1)에 달린 모든 리뷰의 평점을 1점씩 올리세요. (최대 5점을 넘지 않도록 처리해 보세요.)

**정답:**
```sql
UPDATE reviews 
SET rating = CASE 
    WHEN rating < 5 THEN rating + 1 
    ELSE 5 
END
WHERE product_id = 1;
-- 또는 LEAST 함수 활용 (MySQL)
UPDATE reviews 
SET rating = LEAST(rating + 1, 5) 
WHERE product_id = 1;
```

---

## 4. 데이터 삭제 (DELETE)

**문제 19:** `reviews` 테이블에서 내용(`body`)이 비어 있는 리뷰를 모두 삭제하세요.

**정답:**
```sql
DELETE FROM reviews 
WHERE body IS NULL OR body = '';
```

**문제 20:** `products` 테이블에서 등록한 지 5년이 넘은 상품 중 평점(`rating`)이 1.0 미만인 상품을 삭제하세요.

**정답:**
```sql
DELETE FROM products 
WHERE created_at < DATE_SUB(NOW(), INTERVAL 5 YEAR) 
AND rating < 1.0;
```

**문제 21:** `users` 테이블에서 '홍길동' 사용자의 계정을 삭제하세요. (주의: 외래 키 제약 조건이 있다면 관련 데이터 처리가 필요할 수 있습니다.)

**정답:**
```sql
-- 만약 외래 키 제약 조건이 없다면 단순히 삭제
DELETE FROM users 
WHERE name = '홍길동';

-- 제약 조건이 있다면 홍길동의 주문 내역, 리뷰 등을 먼저 삭제해야 할 수도 있습니다.
```

**문제 22:** `orders` 테이블에서 총 주문 금액(`total`)이 0원인 비정상적인 주문 데이터를 삭제하세요.

**정답:**
```sql
DELETE FROM orders 
WHERE total = 0;
```

**문제 23:** `products` 테이블에서 재고 수량(`quantity`)이 0개인 상품을 모두 삭제하세요.

**정답:**
```sql
DELETE FROM products 
WHERE quantity = 0;
```

**문제 24:** `reviews` 테이블에서 2020년 이전에 작성된 모든 리뷰를 삭제하세요.

**정답:**
```sql
DELETE FROM reviews 
WHERE created_at < '2020-01-01 00:00:00';
```

**문제 25:** `products` 테이블에서 이름(`title`)에 'Test'가 포함된 모든 연습용 상품 데이터를 삭제하세요.

**정답:**
```sql
DELETE FROM products 
WHERE title LIKE '%Test%';
```

## 5. 트랜잭션 및 복합 CRUD (Complex CRUD)

**문제 26:** 새로운 사용자가 회원 가입을 하고, 상품을 주문하는 과정을 하나의 트랜잭션으로 처리하는 시나리오를 작성하세요.

**정답:**
```sql
START TRANSACTION;

INSERT INTO users (name, email, created_at) VALUES ('New User', 'newuser@example.com', NOW());
SET @new_user_id = LAST_INSERT_ID();

INSERT INTO orders (user_id, product_id, quantity, total, created_at) VALUES (@new_user_id, 1, 1, 100.0, NOW());

UPDATE products SET quantity = quantity - 1 WHERE id = 1;

COMMIT;
```

**문제 27:** 재고가 부족한 상품들을 한꺼번에 재입고 처리하세요.

**정답:**
```sql
UPDATE products SET quantity = 100 WHERE quantity < 10;
```

**문제 28:** 특정 기간 동안 리뷰가 한 번도 작성되지 않은 상품들을 비활성화(삭제 대신 카테고리를 'Discontinued'로 변경) 처리하세요.

**정답:**
```sql
UPDATE products 
SET category = 'Discontinued'
WHERE id NOT IN (SELECT DISTINCT product_id FROM reviews);
```

**문제 29:** 휴면 계정 처리: 최근 1년간 주문 내역이 없는 사용자의 이름을 '휴면 계정'으로, 이메일을 'N/A'로 일괄 수정하세요.

**정답:**
```sql
UPDATE users 
SET name = '휴면 계정', email = 'N/A'
WHERE id NOT IN (SELECT DISTINCT user_id FROM orders WHERE created_at > DATE_SUB(NOW(), INTERVAL 1 YEAR));
```

**문제 30:** 중복 데이터 정제: 이메일이 중복된 사용자 중 가입일이 더 늦은 데이터를 삭제하세요.

**정답:**
```sql
DELETE u1 FROM users u1
JOIN users u2 ON u1.email = u2.email
WHERE u1.created_at > u2.created_at;
```

**문제 31:** 연쇄 삭제 시뮬레이션: 특정 사용자를 삭제할 때, 해당 사용자가 작성한 모든 리뷰를 먼저 삭제하는 쿼리를 작성하세요.

**정답:**
```sql
-- 1단계: 리뷰 삭제 (reviewer 이름 기준일 경우)
DELETE FROM reviews WHERE reviewer = (SELECT name FROM users WHERE id = 1);
-- 2단계: 사용자 삭제
DELETE FROM users WHERE id = 1;
```

**문제 32:** 대량 가격 조정: 특정 벤더('Widget Corp')의 모든 상품 가격을 현재 가격의 10% 할인가로 수정하세요.

**정답:**
```sql
UPDATE products SET price = price * 0.9 WHERE vendor = 'Widget Corp';
```

**문제 33:** 평점이 낮은 상품 일괄 처리: 평균 평점이 2.0 미만인 상품들을 조회하여 삭제하세요. (서브쿼리 활용)

**정답:**
```sql
DELETE FROM products 
WHERE id IN (
    SELECT product_id FROM reviews GROUP BY product_id HAVING AVG(rating) < 2.0
);
```

**문제 34:** 조건부 데이터 이동: 'Gizmo' 카테고리의 모든 상품 정보를 가상의 `archived_products` 테이블(구조는 동일)로 복사한 후 원본 테이블에서 삭제하세요.

**정답:**
```sql
-- 테이블 복사 (스키마가 미리 생성되어 있어야 함)
INSERT INTO archived_products SELECT * FROM products WHERE category = 'Gizmo';
-- 원본 삭제
DELETE FROM products WHERE category = 'Gizmo';
```

**문제 35:** 실적 기반 데이터 업데이트: 2018년에 가장 많이 주문된 상품의 카테고리를 'Best Seller'로 변경하세요.

**정답:**
```sql
UPDATE products SET category = 'Best Seller'
WHERE id = (
    SELECT product_id FROM orders 
    WHERE created_at LIKE '2018%' 
    GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 1
);
```

**문제 36:** 비정상 데이터 수정: `orders` 테이블에서 `subtotal` + `tax`가 `total`과 일치하지 않는 데이터들을 찾아 `total`을 올바르게 수정하세요.

**정답:**
```sql
UPDATE orders SET total = subtotal + tax WHERE subtotal + tax <> total;
```

**문제 37:** 사용자 가입 경로 보정: `email`이 'google.com'으로 끝나지만 `source`가 'Google'이 아닌 경우를 찾아 'Google'로 업데이트하세요.

**정답:**
```sql
UPDATE users SET source = 'Google' WHERE email LIKE '%google.com' AND source <> 'Google';
```

**문제 38:** 리뷰 블라인드 처리: 욕설이나 부적절한 단어(가상으로 'badword'라 가정)가 포함된 리뷰 본문을 '****'로 수정하세요.

**정답:**
```sql
UPDATE reviews SET body = REPLACE(body, 'badword', '****') WHERE body LIKE '%badword%';
```

**문제 39:** 상품 상세 정보 일괄 보강: `products` 테이블의 `ean` 번호가 없는 상품들에 대해 'NO-EAN'이라는 기본값을 채워 넣으세요.

**정답:**
```sql
UPDATE products SET ean = 'NO-EAN' WHERE ean IS NULL OR ean = '';
```

**문제 40:** 주소 데이터 표준화: `state` 컬럼이 'California'인 경우를 모두 'CA'로 일괄 수정하세요.

**정답:**
```sql
UPDATE users SET state = 'CA' WHERE state = 'California';
```

**문제 41:** 대량 주문 사용자 등급 업그레이드: 총 주문 금액이 1000달러 이상인 사용자들의 이름 앞에 '[VIP]'를 붙이세요. (CONCAT 활용)

**정답:**
```sql
UPDATE users SET name = CONCAT('[VIP]', name)
WHERE id IN (SELECT user_id FROM orders GROUP BY user_id HAVING SUM(total) >= 1000);
```

**문제 42:** 오타 수정: 벤더 이름 중 'Senger-Stamm'을 'Senger-Stamm Corp'으로 변경하세요.

**정답:**
```sql
UPDATE products SET vendor = 'Senger-Stamm Corp' WHERE vendor = 'Senger-Stamm';
```

**문제 43:** 리뷰 작성자 이름 동기화: `users` 테이블에서 이름이 변경된 경우, `reviews` 테이블의 `reviewer` 이름도 함께 업데이트하는 쿼리를 작성하세요.

**정답:**
```sql
-- 이 시나리오는 보통 조인을 사용하여 업데이트합니다.
UPDATE reviews r 
JOIN users u ON r.user_id = u.id -- reviews에 user_id가 있다고 가정하거나 이름 매칭
SET r.reviewer = u.name;
```

**문제 44:** 장기 재고 상품 할인: 등록된 지 3년이 지났고 재고가 1000개 이상인 상품들의 가격을 20% 할인하세요.

**정답:**
```sql
UPDATE products 
SET price = price * 0.8 
WHERE created_at < DATE_SUB(NOW(), INTERVAL 3 YEAR) AND quantity >= 1000;
```

**문제 45:** 빈 데이터 삭제: `users` 테이블에서 `address`, `city`, `state` 정보가 모두 비어 있는 유령 계정을 삭제하세요.

**정답:**
```sql
DELETE FROM users 
WHERE (address IS NULL OR address = '') 
  AND (city IS NULL OR city = '') 
  AND (state IS NULL OR state = '');
```

**문제 46:** 카테고리 통합: 'Gadget' 카테고리와 'Gizmo' 카테고리를 'Electronic' 카테고리로 통합하세요.

**정답:**
```sql
UPDATE products SET category = 'Electronic' WHERE category IN ('Gadget', 'Gizmo');
```

**문제 47:** 주문 취소 시 재고 복구: 특정 주문(예: order_id = 100)을 삭제하면서, 해당 주문에 포함되었던 상품의 재고를 다시 증가시키세요.

**정답:**
```sql
START TRANSACTION;
UPDATE products p
JOIN orders o ON p.id = o.product_id
SET p.quantity = p.quantity + o.quantity
WHERE o.id = 100;

DELETE FROM orders WHERE id = 100;
COMMIT;
```

**문제 48:** 대문자 변환: `users` 테이블의 모든 이메일 주소를 소문자로 일괄 변환하세요. (LOWER 함수 활용)

**정답:**
```sql
UPDATE users SET email = LOWER(email);
```

**문제 49:** 불필요한 공백 제거: `products` 테이블의 `title` 컬럼 앞뒤에 붙은 공백을 제거하세요. (TRIM 함수 활용)

**정답:**
```sql
UPDATE products SET title = TRIM(title);
```

**문제 50:** 종합 CRUD 시나리오: 1년 이상 활동이 없고 리뷰도 남기지 않은 사용자를 찾아 삭제하고, 삭제된 사용자 수만큼 로그 테이블(가상)에 기록하는 일련의 과정을 고려해 보세요.

**정답:**
```sql
-- 대상 식별 및 처리 로직 (트랜잭션 권장)
DELETE FROM users 
WHERE id NOT IN (SELECT DISTINCT user_id FROM orders WHERE created_at > DATE_SUB(NOW(), INTERVAL 1 YEAR))
  AND name NOT IN (SELECT DISTINCT reviewer FROM reviews);
```
