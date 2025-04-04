------- Easy Level Questions 

----1. Retrieve all the details of the songs performed by 'Gorillaz'.

   
   select * from spotify 
	where artist = 'Gorillaz'
	
------2. List all unique album names in the dataset.


Select distinct album 
from spotify;

----3. Find the total number of songs in the dataset.
SELECT COUNT(*) AS total_songs 
FROM spotify; 
	
-------4. Display the top 10 most viewed songs.
SELECT track, artist, views
FROM spotify
ORDER BY views DESC
LIMIT 10;

------5. Show the song title and views where views are greater than 100,000,000.
select track,views
from spotify 
where views>100000000;

---Medium Level Questions
---1. Find the average danceability, energy, and loudness of all songs


SELECT 
    AVG(danceability) AS avg_danceability, 
    AVG(energy) AS avg_energy, 
    AVG(loudness) AS avg_loudness
FROM spotify;

-----2. Retrieve the top 5 artists with the most liked songs.

SELECT artist, SUM(likes) AS total_likes
FROM spotify
GROUP BY artist
ORDER BY total_likes DESC
LIMIT 5;
----3. List the album names along with the total streams per album, ordered by streams in descending order.

SELECT album, SUM(stream) AS total_streams
FROM spotify
GROUP BY album
ORDER BY total_streams DESC;

-----4. Show the artist with the highest combined views across all their songs.

SELECT artist, SUM(views) AS total_views
FROM spotify
GROUP BY artist
ORDER BY total_views DESC
LIMIT 1;

-----5. Retrieve the song titles and their corresponding albums where the loudness is below -5 dB.
SELECT track, album, loudness
FROM spotify
WHERE loudness < -5;

---------------Advanced level questions 
-------1.Find the top 3 most played songs by each artist.

SELECT artist, track, stream
FROM (
    SELECT artist, track, stream,
           RANK() OVER (PARTITION BY artist ORDER BY stream DESC) AS rank
    FROM spotify
) ranked
WHERE rank <= 3;

-------2. Calculate the total likes, comments, and views for each artist.

SELECT artist, 
       SUM(likes) AS total_likes, 
       SUM(comments) AS total_comments, 
       SUM(views) AS total_views
FROM spotify
GROUP BY artist
ORDER BY total_views DESC;

-------3.Identify the album with the highest average danceability.

SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album
ORDER BY avg_danceability DESC
LIMIT 1;

-------4.Retrieve the artist and the most played song platform for each artist.

SELECT artist, most_played_on, COUNT(*) AS song_count
FROM spotify
GROUP BY artist, most_played_on
ORDER BY song_count DESC;



