-- CHECK
DROP TABLE IF EXISTS product;
CREATE TABLE product (
    no       BIGINT AUTO_INCREMENT PRIMARY KEY,
    price    INT NOT NULL CHECK(price >= 0),
    discount INT NOT NULL,
    CONSTRAINT check_discount CHECK (price >= discount)
);

-- 제약 조건X
INSERT INTO product(price, discount)
VALUES (-1000, 0);
INSERT INTO product(price, discount)
VALUES (10000, 20000);


-- 제약조건 O
INSERT INTO product(price, discount)
VALUES (20000, 10000);


--

SELECT *
FROM information_schema.CHECK_CONSTRAINTS;

-- CHECK 제약 조건 삭제
ALTER TABLE product
DROP CONSTRAINT product_chk_1;


ALTER TABLE product
DROP CONSTRAINT check_discount;