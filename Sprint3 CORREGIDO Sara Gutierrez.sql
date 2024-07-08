#Ejercicio 1

-- Creamos la tabla teniendo en cuenta cada tipo de dato:

CREATE TABLE credit_card(id VARCHAR (100) PRIMARY KEY, -- Miramos que tipo de dato es la FK de la tabla de hecho y ponemos el mismo
 iban VARCHAR (100),
 pan VARCHAR (50),
 pin CHAR (4),
 cvv CHAR (3),
 expiring_date DATE);
 
 #Creamos la relación entre tablas:
ALTER TABLE transaction
ADD CONSTRAINT fk_transaction_credit_card
FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);

#Ejercicio 2

-- Modificamos:
UPDATE credit_card SET iban = "R323456312213576817699999" WHERE Id = "CcU-2938";
-- Y comprobamos:
SELECT * FROM credit_card WHERE id = "CcU-2938";

#Ejercicio 3

#También tenemos que crear este nuevo valor de ID en el resto de las tablas por las que está relacionado:
INSERT INTO company(id)
VALUES ("b-9999");

INSERT INTO credit_card(id)
VALUES ("Ccu-9999");

#Ahora si que podemos crear el nuevo usuario en Trnasaction:
INSERT INTO transaction (Id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
VALUES ("108B1D1D-5B23-A76C-55EF-C568E49A99DD", "CcU-9999", "b-9999", 9999, 829.999, -117.999, 111.11, 0);

#Comprobamos:
SELECT * FROM transaction
WHERE user_id = 9999;

#Ejercicio 4
ALTER TABLE credit_card DROP COLUMN pan;

#Comprobamos:
SELECT * FROM credit_card;
