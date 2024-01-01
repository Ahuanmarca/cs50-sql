select * from census limit 10;
-- +----+-----------+----------------------------------------+----------+------------+------------+-------+--------+
-- | id | district  |                locality                | families | households | population | male  | female |
-- +----+-----------+----------------------------------------+----------+------------+------------+-------+--------+
-- | 1  | Taplejung | Aathrai Tribeni Rural Municipality     | 2869     | 2735       | 12288      | 6005  | 6283   |
-- | 2  | Taplejung | Maiwakhola Rural Municipality          | 2275     | 2178       | 10365      | 5264  | 5101   |
-- | 3  | Taplejung | Meringden Rural Municipality           | 2683     | 2528       | 12040      | 6181  | 5859   |
-- | 4  | Taplejung | Mikwakhola Rural Municipality          | 1862     | 1792       | 7991       | 4000  | 3991   |
-- | 5  | Taplejung | Phaktanglung Rural Municipality        | 2864     | 2700       | 11925      | 6239  | 5686   |
-- | 6  | Taplejung | Phungling Municipality                 | 7306     | 5888       | 28786      | 14160 | 14626  |
-- | 7  | Taplejung | Sidingba Rural Municipality            | 2604     | 2484       | 10981      | 5593  | 5388   |
-- | 8  | Taplejung | Sirijangha Rural Municipality          | 3329     | 3197       | 14186      | 7227  | 6959   |
-- | 9  | Taplejung | Pathivara Yangwarak Rural Municipality | 2738     | 2637       | 11797      | 5855  | 5942   |
-- | 10 | Panchthar | Falelung Rural Municipality            | 4940     | 4773       | 20531      | 10211 | 10320  |
-- +----+-----------+----------------------------------------+----------+------------+------------+-------+--------+

select
  count(*) as rows,
  count(distinct district) as districts,
  count(distinct locality) as localities,
  printf("%,i", sum(families)) as families,
  printf("%,i", sum(households)) as households,
  printf("%,i", sum(population)) as population,
  printf("%,i", sum(male)) as male,
  printf("%,i", sum(female)) as female
from
  census;
-- +------+-----------+------------+-----------+------------+------------+------------+------------+
-- | rows | districts | localities | families  | households | population |    male    |   female   |
-- +------+-----------+------------+-----------+------------+------------+------------+------------+
-- | 753  | 77        | 737        | 6,759,473 | 5,642,674  | 29,074,990 | 14,188,639 | 14,886,351 |
-- +------+-----------+------------+-----------+------------+------------+------------+------------+

