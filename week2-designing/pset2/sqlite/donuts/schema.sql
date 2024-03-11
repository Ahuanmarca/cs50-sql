DROP TABLE IF EXISTS ingredients_donuts;
DROP TABLE IF EXISTS orders_donuts;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS donuts;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE ingredients (
  id INTEGER,
  name TEXT,
  price INTEGER,
  unit_type TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE donuts (
  id INTEGER,
  glutten_free INTEGER,
  price INTEGER,
  PRIMARY KEY(id)
);

CREATE TABLE ingredients_donuts (
  id INTEGER,
  ingredient_id INTEGER,
  donut_id INTEGER,
  PRIMARY KEY(id),
  FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
  FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

CREATE TABLE orders (
  order_number INTEGER,
  customer_id INTEGER,
  PRIMARY KEY (order_number),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE orders_donuts (
  order_number INTEGER,
  donut_id INTEGER,
  PRIMARY KEY (order_number, donut_id),
  FOREIGN KEY (order_number) REFERENCES orders(order_number),
  FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

CREATE TABLE customers (
  id INTEGER,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  PRIMARY KEY (id)
);