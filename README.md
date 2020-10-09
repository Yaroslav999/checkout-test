# Checkout system

System for calculating the total amount of the basket.

# Items which used in test

|  Item  | Price   |
| -------|---------|
|  A     | 30      |
|  B     | 20      |
|  C     | 50      |
|  D     | 15      |

# Promotions 

- If 3 of Item A are purchased, the price for all 3 is 75.
- If 2 of Item B are purchased, the price for both is 35.
- If the total basket price (after previous discounts) is over 150, the basket receives a discount Of 20.

# Example test data

|  Basket               |  Price   |
| ----------------------|----------|
|  A, B, C              | 100      |
|  B, A, B, A, A        | 110      |
|  C, B, A, A, D, A, B  | 155      |
|  C, A, D, A, A        | 140      |

# Usage and run tests
```
bundle install
rspec spec/
```
