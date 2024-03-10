# Specification

Your task at hand is to create a SQLite database for Union Square Donuts from scratch, as by writing a set of CREATE TABLE statements in a schema.sql file. The implementation details are up to you, though you should minimally ensure that your database meets the team’s expectations and that it can represent the sample data.

## Expectations

To understand the team’s expectations for their database, you sat down to talk with them after the shop closed for the day.

### Ingredients

We certainly need to keep track of our ingredients. Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar. Moreover, we would love to keep track of the price we pay per unit of ingredient (whether it’s pounds, grams, etc.).

### Donuts

We’ll need to include our selection of donuts, past and present! For each donut on the menu, we’d love to include three things:

- The name of the donut
- Whether the donut is gluten-free
- The price per donut
  Oh, and it’s important that we be able to look up the ingredients for each of the donuts!

### Orders

We love to see customers in person, though we realize a good number of people might order online nowadays. We’d love to be able to keep track of those online orders. We think we would need to store:

- An order number, to keep track of each order internally
- All the donuts in the order
- The customer who placed the order. We suppose we could assume only one customer places any given order.

### Customers

Oh, and we realize it would be lovely to keep track of some information about each of our customers. We’d love to remember the history of the orders they’ve made. In that case, we think we should store:

- A customer’s first and last name
- A history of their orders

## Sample Data

Your database should be able to represent…

- Cocoa, for which Union Square Donuts pays $5.00 for one pound.
- Sugar, for which Union Square Donuts pays $2.00 for one pound.
- Union Square Donuts’ “Belgian Dark Chocolate” donut, which is not gluten-free, costs $4.00, and includes the following ingredients:
  - Cocoa
  - Flour
  - Buttermilk
  - Sugar
- Union Square Donuts’ “Back-To-School Sprinkles” donut, which is not gluten-free, costs $4.00, and includes the following ingredients:
  - Flour
  - Buttermilk
  - Sugar
  - Sprinkles
- Order 1 from Luis Singh for 3 Belgian Dark Chocolate donuts and 2 Back-To-School Sprinkles donuts.

# CHECK
check50 cs50/problems/2023/sql/donuts

# SUBMIT
submit50 cs50/problems/2023/sql/donuts