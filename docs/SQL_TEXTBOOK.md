# SQL 실습 가이드 및 교재

본 교재는 MySQL 환경에서 데이터베이스 실습을 체계적으로 수행할 수 있도록 구성되었습니다. 총 225문항 이상의 실습 문제를 통해 기초 조회부터 심화 쿼리, 데이터 조작(CRUD), 그리고 성능 최적화(인덱스)까지 단계별로 학습할 수 있습니다.

## 데이터 출처
- [YugabyteDB Sample Data - Retail Analytics](https://docs.yugabyte.com/stable/sample-data/retail-analytics/)

> **학습 전 참고**: 데이터베이스의 기본적인 개념이 궁금하다면 [데이터베이스 기초](DB_BASICS.md)를 먼저 읽어보시는 것을 추천합니다.

---

## 목차
1. [실습 환경 준비](#1-실습-환경-준비)
2. [데이터베이스 스키마 구조](#2-데이터베이스-스키마-구조)
3. [Chapter 1: 기초 조회 및 필터링](#chapter-1-기초-조회-및-필터링)
4. [Chapter 2: 집계 및 그룹화](#chapter-2-집계-및-그룹화)
5. [Chapter 3: 조인 및 서브쿼리](#chapter-3-조인-및-서브쿼리)
6. [Chapter 4: 데이터 변환 및 조건문](#chapter-4-데이터-변환-및-조건문)
7. [Chapter 5: 데이터 조작 (CRUD)](#chapter-5-데이터-조작-crud)
8. [Chapter 6: 인덱스 및 성능 최적화](#chapter-6-인덱스-및-성능-최적화)
9. [부록: 문제집 및 정답지 링크](#부록-문제집-및-정답지-링크)

---

## 1. 실습 환경 준비

실습을 시작하기 위해 먼저 데이터베이스와 테이블을 생성하고 데이터를 임포트해야 합니다.

### 스키마 생성
`resources/ddl/schema.sql` 파일을 실행하여 테이블 구조를 생성합니다.
```bash
mysql -u [사용자명] -p [데이터베이스명] < ../resources/ddl/schema.sql
```

### 데이터 임포트
다음 순서대로 데이터를 임포트하는 것을 권장합니다.
1. `users.sql` (사용자 데이터)
2. `products.sql` (상품 데이터)
3. `orders.sql` (주문 데이터)
4. `reviews.sql` (리뷰 데이터)

---

## 2. 데이터베이스 스키마 구조

실습에 사용되는 테이블 정보입니다. 모든 테이블의 ID는 기본 키(Primary Key)이며 자동 증가(Auto Increment) 속성을 가집니다.

### 2.1 products (상품 정보)
상품의 상세 정보와 재고, 가격 등을 관리합니다.

| 컬럼명 | 타입 | 속성 | 설명 |
|:---|:---|:---|:---|
| **id** | BIGINT | PK, AI | 상품 고유 번호 |
| **created_at** | DATETIME | | 데이터 생성 일시 |
| **category** | VARCHAR(255) | | 상품 카테고리 |
| **ean** | VARCHAR(255) | | 유럽 상품 번호 (Barcode) |
| **price** | DOUBLE | | 상품 가격 |
| **quantity** | INT | DEFAULT 5000 | 재고 수량 |
| **rating** | DOUBLE | | 상품 평점 |
| **title** | VARCHAR(255) | | 상품명 |
| **vendor** | VARCHAR(255) | | 제조사/판매처 |

### 2.2 users (사용자 정보)
서비스 이용자의 개인정보 및 계정 정보를 관리합니다.

| 컬럼명 | 타입 | 속성 | 설명 |
|:---|:---|:---|:---|
| **id** | BIGINT | PK, AI | 사용자 고유 번호 |
| **created_at** | DATETIME | | 가입 일시 |
| **name** | VARCHAR(255) | | 사용자 이름 |
| **email** | VARCHAR(255) | | 이메일 주소 |
| **address** | VARCHAR(255) | | 상세 주소 |
| **city** | VARCHAR(255) | | 거주 도시 |
| **state** | VARCHAR(255) | | 거주 주 (State) |
| **zip** | VARCHAR(255) | | 우편번호 |
| **birth_date** | VARCHAR(255) | | 생년월일 |
| **latitude** | DOUBLE | | 거주지 위도 |
| **longitude** | DOUBLE | | 거주지 경도 |
| **password** | VARCHAR(255) | | 비밀번호 |
| **source** | VARCHAR(255) | | 가입 경로 |

### 2.3 orders (주문 내역)
사용자가 상품을 주문한 상세 내역을 관리합니다.

| 컬럼명 | 타입 | 속성 | 설명 |
|:---|:---|:---|:---|
| **id** | BIGINT | PK, AI | 주문 고유 번호 |
| **created_at** | DATETIME | | 주문 일시 |
| **user_id** | BIGINT | | 주문한 사용자 ID |
| **product_id** | BIGINT | | 주문된 상품 ID |
| **discount** | DOUBLE | | 할인 금액 |
| **quantity** | INT | | 주문 수량 |
| **subtotal** | DOUBLE | | 세전 소계 |
| **tax** | DOUBLE | | 세금 |
| **total** | DOUBLE | | 최종 결제 금액 |

### 2.4 reviews (상품 리뷰)
상품에 대해 사용자가 작성한 평가 및 리뷰를 관리합니다.

| 컬럼명 | 타입 | 속성 | 설명 |
|:---|:---|:---|:---|
| **id** | BIGINT | PK, AI | 리뷰 고유 번호 |
| **created_at** | DATETIME | | 리뷰 작성 일시 |
| **reviewer** | VARCHAR(255) | | 작성자 이름 |
| **product_id** | BIGINT | | 리뷰 대상 상품 ID |
| **rating** | INT | | 부여된 평점 |
| **body** | TEXT | | 리뷰 본문 내용 |

---

## Chapter 1: 기초 조회 및 필터링

데이터베이스에서 데이터를 추출하는 가장 기본적인 단계입니다.

### 1.1 SELECT와 FROM
- `SELECT`: 조회하고자 하는 컬럼명을 지정합니다. 모든 컬럼을 조회할 때는 `*`를 사용합니다.
- `FROM`: 데이터를 가져올 테이블명을 지정합니다.
```sql
SELECT name, email FROM users;
```

### 1.2 WHERE를 이용한 필터링
- 특정 조건에 맞는 데이터만 추출할 때 사용합니다.
- 비교 연산자: `=`, `<>`, `!=`, `<`, `<=`, `>`, `>=`
- 논리 연산자: `AND`, `OR`, `NOT`
```sql
SELECT * FROM products WHERE price >= 50 AND category = 'Gizmo';
```

### 1.3 다양한 비교 패턴
- `LIKE`: 문자열 패턴 매칭 (`%`: 모든 문자, `_`: 한 문자)
- `IN`: 여러 값 중 하나와 일치하는지 확인
- `BETWEEN`: 특정 범위 내의 값인지 확인
- `IS NULL`: 데이터가 비어 있는지 확인
```sql
SELECT * FROM users WHERE email LIKE '%@gmail.com';
SELECT * FROM products WHERE category IN ('Gadget', 'Widget');
```

### 1.4 결과 정렬 (ORDER BY)
- `ASC`: 오름차순 (기본값)
- `DESC`: 내림차순
```sql
SELECT * FROM products ORDER BY price DESC;
```

### 1.5 개수 제한 (LIMIT)
- 출력되는 행의 수를 제한합니다. 주로 상위 N개를 조회할 때 사용합니다.
```sql
SELECT * FROM orders ORDER BY total DESC LIMIT 5;
```

- **실습 문제**: [문제 1번 ~ 25번](SQL_PRACTICE_QUESTIONS.md#1-기초-조회-및-필터링-select-where-order-by-limit)

---

## Chapter 2: 집계 및 그룹화

데이터를 요약하고 그룹별로 분석하는 방법을 학습합니다.

### 2.1 집계 함수 (Aggregate Functions)
- `COUNT()`: 행의 개수를 셉니다.
- `SUM()`: 합계를 구합니다.
- `AVG()`: 평균을 구합니다.
- `MAX()` / `MIN()`: 최대값과 최소값을 구합니다.
```sql
SELECT COUNT(*) FROM orders;
SELECT AVG(price) FROM products WHERE category = 'Gadget';
```

### 2.2 데이터 그룹화 (GROUP BY)
- 특정 컬럼을 기준으로 데이터를 그룹으로 묶습니다. 집계 함수와 함께 자주 사용됩니다.
```sql
SELECT category, COUNT(*) FROM products GROUP BY category;
```

### 2.3 그룹 필터링 (HAVING)
- `WHERE`는 개별 행에 대한 조건이지만, `HAVING`은 그룹화된 결과에 대한 조건을 지정합니다.
```sql
SELECT category, AVG(price) FROM products 
GROUP BY category 
HAVING AVG(price) >= 100;
```

- **실습 문제**: [문제 26번 ~ 50번](SQL_PRACTICE_QUESTIONS.md#2-집계-및-그룹화-aggregate-functions-group-by-having)

---

## Chapter 3: 조인 및 서브쿼리

여러 테이블을 결합하거나 복잡한 쿼리를 작성하는 방법을 학습합니다.

### 3.1 조인 (JOIN)
- `INNER JOIN`: 두 테이블 모두에 데이터가 있는 경우만 결합합니다.
- `LEFT JOIN`: 왼쪽 테이블의 모든 데이터를 유지하며 오른쪽 테이블을 결합합니다. (데이터가 없으면 NULL)
```sql
SELECT u.name, o.total 
FROM users u 
INNER JOIN orders o ON u.id = o.user_id;
```

### 3.2 서브쿼리 (Subquery)
- 쿼리 내부에 포함된 또 다른 쿼리입니다.
- WHERE 절 서브쿼리: 특정 조건의 값을 다른 쿼리에서 가져올 때 사용합니다.
- FROM 절 서브쿼리 (인라인 뷰): 쿼리 결과를 하나의 테이블처럼 사용합니다.
- SELECT 절 서브쿼리 (스칼라 서브쿼리): 한 행의 컬럼 값으로 서브쿼리 결과를 사용합니다.
```sql
SELECT title FROM products 
WHERE id IN (SELECT product_id FROM orders WHERE total > 100);
```

- **실습 문제**: [문제 51번 ~ 75번](SQL_PRACTICE_QUESTIONS.md#3-조인-및-서브쿼리-join-subqueries)

---

## Chapter 4: 데이터 변환 및 조건문

데이터를 원하는 형식으로 가공하고 조건에 따라 처리하는 방법을 학습합니다.

### 4.1 CASE 문 (조건문)
- SQL 내에서 `if-else`와 같은 조건 로직을 구현합니다.
```sql
SELECT title,
    CASE 
        WHEN price >= 100 THEN 'Premium'
        WHEN price >= 50 THEN 'Standard'
        ELSE 'Budget'
    END AS price_class
FROM products;
```

### 4.2 날짜 및 시간 함수
- `DATE_FORMAT()`: 날짜를 특정 형식의 문자열로 변환합니다.
- `NOW()`: 현재 날짜와 시간을 반환합니다.
```sql
SELECT DATE_FORMAT(created_at, '%Y-%m-%d') FROM orders;
```

### 4.3 기타 주요 함수
- `IF(조건, 참, 거짓)`: 간단한 조건문입니다.
- `COALESCE(값1, 값2, ...)`: NULL이 아닌 첫 번째 값을 반환합니다. (NULL 처리용)
- `CONCAT(문자1, 문자2, ...)`: 문자열을 합칩니다.
```sql
SELECT name, COALESCE(state, 'N/A') FROM users;
```

- **실습 문제**: [문제 76번 ~ 100번](SQL_PRACTICE_QUESTIONS.md#4-데이터-변환-및-조건문-case-date_format-등)

---

## Chapter 5: 데이터 조작 (CRUD)

데이터를 생성(Create), 수정(Update), 삭제(Delete)하는 방법을 학습합니다.

### 5.1 데이터 삽입 (INSERT)
- 테이블에 새로운 행을 추가합니다.
```sql
INSERT INTO users (name, email, created_at) 
VALUES ('Jane Doe', 'jane@example.com', NOW());
```

### 5.2 데이터 수정 (UPDATE)
- 기존 데이터를 조건에 맞게 수정합니다. **반드시 WHERE 절을 확인하세요!**
```sql
UPDATE products SET price = price * 0.9 WHERE category = 'Old';
```

### 5.3 데이터 삭제 (DELETE)
- 테이블에서 행을 삭제합니다. **반드시 WHERE 절을 확인하세요!**
```sql
DELETE FROM reviews WHERE rating = 1;
```

- **실습 문제**: [SQL CRUD 실습 문제 (문제편)](SQL_CRUD_QUESTIONS.md)

---

## Chapter 6: 인덱스 및 성능 최적화

데이터베이스의 성능을 관리하고 최적화하는 방법을 학습합니다.

### 6.1 인덱스 (Index)
데이터 조회 속도를 높이기 위한 색인입니다.
- **인덱스 생성**: `CREATE INDEX [인덱스명] ON [테이블명]([컬럼명]);`
- **인덱스 삭제**: `DROP INDEX [인덱스명] ON [테이블명];`
- **인덱스 확인**: `SHOW INDEX FROM [테이블명];`

```sql
-- products 테이블의 category 컬럼에 인덱스 생성
CREATE INDEX idx_products_category ON products(category);

-- 복합 인덱스 (여러 컬럼을 묶어서 생성)
CREATE INDEX idx_orders_user_product ON orders(user_id, product_id);
```

### 6.2 실행 계획 확인 (EXPLAIN)
데이터베이스가 쿼리를 어떻게 실행하는지 분석합니다. 인덱스가 제대로 사용되는지(`type`이 `ref`나 `range`인지, `key` 항목에 인덱스명이 있는지) 확인할 때 필수적입니다.

```sql
EXPLAIN SELECT * FROM products WHERE category = 'Gizmo';
```
- **type**: `ALL`(Full Scan, 느림), `index`(인덱스 전체 스캔), `range`(범위 스캔), `ref`(상수 비교, 빠름)
- **key**: 실제로 사용된 인덱스 이름
- **rows**: 쿼리 처리를 위해 조사한 행의 예상 수 (적을수록 좋음)

- **실습 문제**: [문제 101번 ~ 175번](SQL_PRACTICE_QUESTIONS.md#6-인덱스-및-검색-성능-최적화)

---

## 부록: 문제집 및 정답지 링크

효율적인 학습을 위해 문제와 정답을 분리하였습니다.

### 문제집 (Questions)
- [조회(SELECT) 및 인덱스 실습 문제](SQL_PRACTICE_QUESTIONS.md)
- [CUD(등록, 수정, 삭제) 실습 문제](SQL_CRUD_QUESTIONS.md)

### 정답지 (Answers)
- [조회(SELECT) 및 인덱스 실습 정답](SQL_PRACTICE_ANSWERS.md)
- [CUD(등록, 수정, 삭제) 실습 정답](SQL_CRUD_ANSWERS.md)
