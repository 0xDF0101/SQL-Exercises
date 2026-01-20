-- https://docs.yugabyte.com/stable/sample-data/retail-analytics

CREATE TABLE products(
                         id         BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         created_at DATETIME,
                         category   VARCHAR(255),
                         ean        VARCHAR(255),
                         price      DOUBLE,
                         quantity   INT DEFAULT 5000,
                         rating     DOUBLE,
                         title      VARCHAR(255),
                         vendor     VARCHAR(255)
);

CREATE TABLE users(
                      id         BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                      created_at DATETIME,
                      name       VARCHAR(255),
                      email      VARCHAR(255),
                      address    VARCHAR(255),
                      city       VARCHAR(255),
                      state      VARCHAR(255),
                      zip        VARCHAR(255),
                      birth_date VARCHAR(255),
                      latitude   DOUBLE,
                      longitude  DOUBLE,
                      password   VARCHAR(255),
                      source     VARCHAR(255)
);

CREATE TABLE orders(
                       id         BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       created_at DATETIME,
                       user_id    BIGINT,
                       product_id BIGINT,
                       discount   DOUBLE,
                       quantity   INT,
                       subtotal   DOUBLE,
                       tax        DOUBLE,
                       total      DOUBLE
);

CREATE TABLE reviews(
                        id         BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        created_at DATETIME,
                        reviewer   VARCHAR(255),
                        product_id BIGINT,
                        rating     INT,
                        body       TEXT
);
