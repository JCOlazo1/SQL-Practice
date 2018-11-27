/* Put your data in here and query it! */

CREATE TABLE players (ID INTEGER PRIMARY KEY,
    name TEXT,
    main TEXT,
    region TEXT,
    rating INTEGER);
    
INSERT INTO players VALUES(1, "Mang0", "Fox/Falco", "USA", 93);
INSERT INTO players VALUES(2, "Hungrybox", "Jigglypuff", "USA", 97);
INSERT INTO players VALUES(3, "Leffen", "Fox", "Sweden", 94);
INSERT INTO players VALUES(4, "Mew2King", "Marth/Sheik", "USA", 95);
INSERT INTO players VALUES(5, "Plup", "Sheik/Fox/Samus", "USA", 96);
INSERT INTO players VALUES(6, "Ryan Ford", "Fox", "Toronto", 78);
INSERT INTO players VALUES(7, "n0ne", "Capt. Falcon", "Toronto", 82);
INSERT INTO players VALUES(8, "MTL Kyle", "Peach", "Montreal", 2);
INSERT INTO players VALUES(9, "HugS86", "Samus", "USA", 75);
INSERT INTO players VALUES(10, "Monib", "Luigi", "Toronto", 68);
INSERT INTO players VALUES(11, "Zain", "Marth", "USA", 81);
INSERT INTO players VALUES(12, "JCO", "Sheik", "Toronto", 23);
INSERT INTO players VALUES(13, "Plat", "Fox", "Toronto", 70);
INSERT INTO players VALUES(14, "PPMD", "Marth/Falco", "USA", 60);
INSERT INTO players VALUES(15, "PewPewU", "Marth", "USA", 80);
INSERT INTO players VALUES(16, "Buckee the Bort Bus Driver", "Fox/Falco", "Toronto", 65);
INSERT INTO players VALUES(17, "Chillindude", "Fox", "USA", 70);
INSERT INTO players VALUES(18, "2Saint", "Ice Climbers", "USA", 79);
INSERT INTO players VALUES(19, "Hax$", "Fox", "USA", 76);
INSERT INTO players VALUES(20, "lmao", "Zelda", "Antarctica", 69);

/* SHOW ALL */
SELECT * FROM players ORDER BY rating DESC;

/* AVERAGE rating of players from USA */
SELECT region, AVG(rating) AS average_rating FROM players 
WHERE region = "USA";

/* AVERAGE rating of players from Toronto */
SELECT region, AVG(rating) AS average_rating FROM players 
WHERE region = "Toronto";

/* AVERAGE rating of players from Montreal */
SELECT region, AVG(rating) AS average_rating FROM players WHERE region = "Montreal";

/* Ranking players per region(USA) */
SELECT name, rating FROM players 
WHERE region = "USA"
ORDER BY rating DESC;

/* Ranking players per region(Canada) */
SELECT name, rating FROM players
WHERE region = "Toronto"
ORDER BY rating DESC;

/* Player Grade */
SELECT COUNT(*),
    CASE
        WHEN rating > 95 THEN "1. God"
        WHEN rating > 90 THEN "2. Legend"
        WHEN rating > 80 THEN "3. Pro"
        WHEN rating > 60 THEN "4. Good"
        WHEN rating > 20 THEN "5. Scrub"
        ELSE "garbage"
    END AS rank_title
FROM players
GROUP BY rank_title;

/* 'Good' players and up */
SELECT name, rating FROM players WHERE rating > 60
ORDER BY rating DESC;

/* Ranking Sheik mains */
SELECT name, main, rating FROM players 
WHERE main LIKE "%Sheik%"
ORDER by rating DESC;

/* Ranking Fox mains */
SELECT name, main, rating FROM players 
WHERE main LIKE "%Fox%"
ORDER BY rating DESC;

/* Average rating of Sheik mains */
SELECT AVG(rating) AS avg_rating_sheik FROM players 
WHERE main LIKE "%Sheik%";

/* Average rating of Fox mains */
SELECT AVG(rating) AS avg_rating_fox FROM players
WHERE main LIKE "%Fox%";

/* "Good" players from Toronto */
SELECT name AS "Good Toronto Players" FROM players 
WHERE region = "Toronto" AND rating > 60;

