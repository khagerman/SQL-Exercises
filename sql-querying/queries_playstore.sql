-- Comments in SQL Start with dash-dash --
-- Find the app with an ID of 1880.
select  app_name  FROM analytics WHERE id = 1880   
--              Web Browser for Android
-- Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';
--   id  |                                     app_name                                      
-- ------+-----------------------------------------------------------------------------------
--    10 | Clash Royale
--    11 | Candy Crush Saga
--    12 | UC Browser - Fast Download Private & Secure
--    74 | Score! Hero
--   101 | Tiny Flashlight + LED
--   102 | Crossy Road
--   103 | SimCity BuildIt
--   111 | FIFA Soccer
--   112 | Angry Birds 2
--   125 | Need for Speed™ No Limits
--   126 | YouCam Makeup - Magic Selfie Makeovers
--   152 | Fallout Shelter
--   159 | DU Recorder – Screen Recorder, Video Editor, Live
--   160 | Bike Race Free - Top Motorcycle Racing Games
--   161 | KakaoTalk: Free Calls & Text
--   162 | Dolphin Browser - Fast, Private & Adblock🐬
--   163 | Opera Browser: Fast and Secure
--   164 | MARVEL Contest of Champions
--   184 | Video Editor Music,Cut,No Crop


-- Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, count(category) FROM analytics GROUP BY category

-- Find the top 5 most-reviewed apps and the number of reviews for each.
 SELECT * FROM analytics ORDER BY reviews DESC LIMIT 5;
-- Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name FROM analytics WHERE AVG(reviews) >= 4.8;
-- Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;
-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating  FROM analytics WHERE rating< 3  ORDER BY price DESC LIMIT 1     
    -- Naruto & Boruto FR
-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT app_name FROM analytics WHERE min_installs <=50 AND rating IS NOT NULL   ORDER BY rating desc   

-- Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name FROM analytics WHERE reviews >= 1000 AND rating < 3
-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
 SELECT app_name FROM analytics WHERE price > 0.1  AND price < 1  ORDER BY rating desc
-- Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT * FROM analytics ORDER BY last_updated limit 1
-- Find the most expensive app (the query is very similar to #11).
 SELECT * FROM analytics ORDER BY price desc  limit 1                                                                             
-- Count all the reviews in the Google Play Store.
SELECT SUM(reviews) FROM analytics;
-- Find all the categories that have more than 300 apps in them.
 SELECT category FROM analytics  GROUP BY category HAVING COUNT(*) > 300;
-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
SELECT app_name, reviews, min_installs,  min_installs / reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC
  LIMIT 1;