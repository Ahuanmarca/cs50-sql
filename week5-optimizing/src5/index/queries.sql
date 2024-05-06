SELECT "title", "year" FROM "movies"
  INNER JOIN "stars" ON "movies"."id" = "stars"."movie_id"
  INNER JOIN "people" ON "people"."id" = "stars"."person_id"
WHERE "people"."name" = 'Tom Hanks';