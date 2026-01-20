# Database Practice

이 저장소는 데이터베이스 SQL 실습을 위한 스키마와 데이터를 제공합니다.

## 학습 목표
1. **데이터베이스 기본 개념 이해**: 관계형 데이터베이스(RDB)의 구조와 DBMS의 역할을 이해하고 설명할 수 있습니다.
2. **SQL 문법 숙달**: SELECT 문을 활용한 기초 조회부터 집계, 그룹화, 조인, 서브쿼리 등 복잡한 데이터 추출 능력을 갖춥니다.
3. **데이터 조작 능력(CRUD)**: INSERT, UPDATE, DELETE 문을 사용하여 데이터를 안전하게 관리하는 방법을 익힙니다.
4. **성능 최적화 및 설계 기초**: 인덱스를 활용한 쿼리 성능 개선과 정규화를 통한 데이터베이스 설계 원리를 학습합니다.
5. **실무 데이터 분석**: 실제 커머스 데이터(Users, Products, Orders, Reviews)를 활용하여 실무적인 SQL 활용 능력을 배양합니다.

## 학습 순서
1. **기초 이론**: [데이터베이스 기본 개념 및 정규화 학습](docs/DB_BASICS.md)
2. **CRUD**: [데이터 삽입, 수정, 삭제 실습](docs/SQL_CRUD_QUESTIONS.md)
3. **조회 실습**: [기초부터 심화까지 SELECT 쿼리 연습](docs/SQL_PRACTICE_QUESTIONS.md)

## 데이터 출처
- [YugabyteDB Sample Data - Retail Analytics](https://docs.yugabyte.com/stable/sample-data/retail-analytics/)

## 포함된 파일
- `resources/ddl/schema.sql`: MySQL용 테이블 생성 스키마
- `resources/ddl/*.sql`: 실습용 데이터 삽입 쿼리 (users, products, orders, reviews)

## SQL 실습 교재
- [**데이터베이스 기초(DB_BASICS.md)**](docs/DB_BASICS.md): 실습 전 가볍게 읽어보는 기본 개념 정리입니다.
- [**SQL 실습 가이드 및 교재 (SQL_TEXTBOOK.md)**](docs/SQL_TEXTBOOK.md): 기초부터 실무 활용까지 체계적으로 학습할 수 있는 메인 교재입니다.

## 실습 문제집
- [SQL CRUD(데이터 조작) 실습 문제 - 문제편](docs/SQL_CRUD_QUESTIONS.md): 총 25문항
- [SQL 조회(SELECT) 및 인덱스 실습 문제 - 문제편](docs/SQL_PRACTICE_QUESTIONS.md): 총 110문항
- [SQL 조회(SELECT) 및 인덱스 실습 문제 - 정답편](docs/SQL_PRACTICE_ANSWERS.md)
- [SQL CRUD(데이터 조작) 실습 문제 - 정답편](docs/SQL_CRUD_ANSWERS.md)
