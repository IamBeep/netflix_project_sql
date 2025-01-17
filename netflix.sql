-- Netflix Project

CREATE TABLE netflix
(
	show_id varchar(6),
	type varchar(10),
	title varchar(150),
	director varchar(210),
	casts varchar(1000),
	country varchar(150),
	date_added varchar(50),
	release_year int,
	rating varchar(10),
	duration varchar(15),
	listed_in varchar(100),
	description	varchar(250)
);

select * from netflix;


-- 15 Business Problems & Solutions

-- 1. Count the number of Movies vs TV Shows

select type,count(*) as total_content   from netflix group by type;


-- 2. Find the most common rating for movies and TV shows
SELECT
	TYPE,
	RATING
FROM
	(
		SELECT
			TYPE,
			RATING,
			COUNT(*),
			RANK() OVER (
				PARTITION BY
					TYPE
				ORDER BY
					COUNT(*) DESC
			) AS RANKING
		FROM
			NETFLIX
		GROUP BY
			1,
			2
	) AS T1
WHERE
	RANKING = 1;

/*
(
    SELECT 
        'Movie' AS category,
        rating, 
        COUNT(*) AS count
    FROM 
        netflix
    WHERE 
        type = 'Movie'
    GROUP BY 
        rating
    ORDER BY 
        count DESC
    LIMIT 1
)
UNION
(
    SELECT 
        'TV Show' AS category,
        rating, 
        COUNT(*) AS count
    FROM 
        netflix
    WHERE 
        type = 'TV Show'
    GROUP BY 
        rating
    ORDER BY 
        count DESC
    LIMIT 1
);


*/



--3. List all movies released in a specific year (e.g., 2020)

select * from netflix where type = 'Movie' and release_year = 2020;


-- 4. Find the top 5 countries with the most content on Netflix

SELECT
	UNNEST(STRING_TO_ARRAY(COUNTRY, ',')) AS NEW_COUNTRY,
	COUNT(SHOW_ID) AS TOTAL_CONTENT
FROM
	NETFLIX
GROUP BY
	1
ORDER BY
	2 DESC LIMIT
	5;

5. Identify the longest movie

SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND DURATION = (
		SELECT
			MAX(DURATION)
		FROM
			NETFLIX
	)



--6. Find content added in the last 5 years
SELECT
	*
FROM
	NETFLIX
WHERE
	TO_DATE(DATE_ADDED, 'Month DD,YYYY') >= CURRENT_DATE - INTERVAL '5 years'
	
7. Find all the movies/TV shows by director 'Rajiv Chilaka'!



SELECT 
    title, 
    type, 
    director
FROM 
    netflix
WHERE 
    director LIKE '%Rajiv Chilaka%';

select title 
8. List all TV shows with more than 5 seasons
/*
SELECT 
    title, 
    type, 
    duration
FROM 
    netflix
WHERE 
    type = 'TV Show' 
    AND CAST(REGEXP_REPLACE(duration, '[^0-9]', '', 'g') AS INTEGER) > 5;

*/
	SELECT
	TITLE,
	TYPE,
	DURATION
FROM
	NETFLIX
WHERE
	TYPE = 'TV Show'
	AND CAST(SPLIT_PART(DURATION, ' ', 1) AS INTEGER) > 5;

-- 9. COUNT THE NUMBER OF content items in each genre

SELECT 
    UNNEST(string_to_array(listed_in, ',')) AS genre, 
    COUNT(*) AS genre_count
FROM 
    netflix
    
GROUP BY 
    genre
ORDER BY 
    genre_count DESC;

--10.Find each year and the average numbers of content release in India on netflix. 


return top 5 year with highest avg content release!
SELECT 
	country,
	release_year,
	COUNT(show_id) as total_release,
	ROUND(
		COUNT(show_id)::numeric/
								(SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100 
		,2
		)
		as avg_release
FROM netflix
WHERE country = 'India' 
GROUP BY country, 2
ORDER BY avg_release DESC 
LIMIT 5;
11. List all movies that are documentaries
SELECT
	TITLE
FROM
	NETFLIX
WHERE
	LISTED_IN ILIKE ('%Documentaries%')
	AND TYPE = 'Movie';
	
	
--12. Find all content without a director


SELECT
	*
FROM
	NETFLIX
WHERE
	DIRECTOR IS NULL;


--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!


SELECT
   *
FROM
    NETFLIX
WHERE
    casts ILIKE '%salman khan%'  -- Match "Salman Khan" in the 'casts' column (case-insensitive)
    AND type = 'Movie'           -- Only consider rows where the type is "Movie"
    AND release_year >= (EXTRACT(YEAR FROM CURRENT_DATE) - 10);  -- Filter for movies from the last 10 years


--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.


SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.


SELECT 
    category,
	TYPE,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2

 