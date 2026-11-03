SELECT "artist" AS "Artist", "english_title" AS "Title in English", "japanese_title" AS "Title in Japanese"
FROM "views" WHERE "artist" = 'Hokusai' ORDER BY "english_title" LIMIT 10;
