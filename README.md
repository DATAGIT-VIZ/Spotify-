# 🎵 PostgreSQL Music Analytics Project

## 📊 Project Overview
This project is a comprehensive SQL-based analysis of a music dataset (Spotify). The original data was cleaned and made concise using AI-assisted methods to ensure consistency and remove noise. After preparing the dataset, I crafted a variety of SQL queries categorized into easy, medium, and advanced levels to explore key insights and practice real-world SQL use cases.

The goal behind creating this project was to build something insightful and interactive, simulating real-life data exploration scenarios. By segmenting the questions into difficulty levels, the project also serves as a personal learning tool and a demonstration of my ability to apply SQL for data analysis.

## Key highlights:

## ✅ Used AI to preprocess and clean the dataset.

## ✅ Designed unique and purposeful queries to extract music insights.

## ✅ Covered a range of SQL concepts including aggregation, ranking, filtering, and window functions.

## ✅ Aimed at practicing real-world data storytelling through SQL.
---

## 🎧 Spotify SQL Project – Query Showcase

### 🟢 Easy Level Questions

**1. Retrieve all the details of the songs performed by 'Gorillaz'.**
```sql
SELECT * FROM spotify 
WHERE artist = 'Gorillaz';
```

**2. List all unique album names in the dataset.**
```sql
SELECT DISTINCT album 
FROM spotify;
```

**3. Find the total number of songs in the dataset.**
```sql
SELECT COUNT(*) AS total_songs 
FROM spotify;
```

**4. Display the top 10 most viewed songs.**
```sql
SELECT track, artist, views
FROM spotify
ORDER BY views DESC
LIMIT 10;
```

**5. Show the song title and views where views are greater than 100,000,000.**
```sql
SELECT track, views
FROM spotify 
WHERE views > 100000000;
```

---

### 🟡 Medium Level Questions

**1. Find the average danceability, energy, and loudness of all songs.**
```sql
SELECT 
    AVG(danceability) AS avg_danceability, 
    AVG(energy) AS avg_energy, 
    AVG(loudness) AS avg_loudness
FROM spotify;
```

**2. Retrieve the top 5 artists with the most liked songs.**
```sql
SELECT artist, SUM(likes) AS total_likes
FROM spotify
GROUP BY artist
ORDER BY total_likes DESC
LIMIT 5;
```

**3. List the album names along with the total streams per album, ordered by streams in descending order.**
```sql
SELECT album, SUM(stream) AS total_streams
FROM spotify
GROUP BY album
ORDER BY total_streams DESC;
```

**4. Show the artist with the highest combined views across all their songs.**
```sql
SELECT artist, SUM(views) AS total_views
FROM spotify
GROUP BY artist
ORDER BY total_views DESC
LIMIT 1;
```

**5. Retrieve the song titles and their corresponding albums where the loudness is below -5 dB.**
```sql
SELECT track, album, loudness
FROM spotify
WHERE loudness < -5;
```

---

### 🔴 Advanced Level Questions

**1. Find the top 3 most played songs by each artist.**
```sql
SELECT artist, track, stream
FROM (
    SELECT artist, track, stream,
           RANK() OVER (PARTITION BY artist ORDER BY stream DESC) AS rank
    FROM spotify
) ranked
WHERE rank <= 3;
```

**2. Calculate the total likes, comments, and views for each artist.**
```sql
SELECT artist, 
       SUM(likes) AS total_likes, 
       SUM(comments) AS total_comments, 
       SUM(views) AS total_views
FROM spotify
GROUP BY artist
ORDER BY total_views DESC;
```

**3. Identify the album with the highest average danceability.**
```sql
SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album
ORDER BY avg_danceability DESC
LIMIT 1;
```

**4. Retrieve the artist and the most played song platform for each artist.**
```sql
SELECT artist, most_played_on, COUNT(*) AS song_count
FROM spotify
GROUP BY artist, most_played_on
ORDER BY song_count DESC;
```

---

## 🛠️ Technologies Used
## PostgreSQL – For creating tables, importing data, and writing SQL queries to explore and analyze the dataset.

## SQL – Used to craft beginner to advanced level queries, covering filtering, aggregation, window functions, and more.

## AI Assistance – Leveraged AI to clean and streamline the dataset, ensuring consistency and structure.

## CSV – Cleaned and structured the dataset in CSV format for easy import and analysis.

## Git & GitHub – For version control and sharing the project with the community.

✅ Feel free to explore and contribute!
