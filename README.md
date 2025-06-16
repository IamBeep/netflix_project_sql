# Netflix Movies and TV shows Data Analysis using SQL 

![Netflix Logo](https://github.com/IamBeep/netflix_project_sql/blob/main/logo.png)



# 📺 Netflix Data Analysis – SQL Project

This project dives into Netflix’s content library using **advanced SQL techniques** to solve **15 real-world business problems**. The analysis covers content trends, user preferences, regional insights, and genre-level breakdowns—providing a data-driven view of Netflix’s global offerings.

---

## 📌 Project Objective

To explore and analyze the Netflix content dataset using SQL and uncover business insights related to:

* Content distribution across countries, years, and genres
* Viewer preferences (TV Shows vs Movies, Ratings, Duration)
* Actor & Director contributions
* Content release and engagement trends
* Categorization of content based on sensitive keywords

---

## 🛠 Tools & Tech Used

* 💾 **PostgreSQL**
* 📋 **SQL Queries & CTEs**
* 📊 **Data Aggregation & Filtering**
* 🧠 **Window Functions & Text Processing**
* 📝 **String Manipulation, Date Functions, and Case Logic**

---

## 📁 Dataset Structure

The dataset includes:

* `show_id`: Unique content ID
* `type`: Movie or TV Show
* `title`, `director`, `casts`
* `country`, `date_added`, `release_year`
* `rating`, `duration`
* `listed_in`: Genre info
* `description`: Content summary

---

## 💡 Key Business Problems Solved

### 1. 🎥 Movie vs TV Show Distribution

→ Counted total number of Movies vs TV Shows

### 2. 🔢 Most Common Ratings

→ Found the most frequent rating for Movies and TV Shows separately

### 3. 📆 Movies Released in a Specific Year

→ Listed all movies released in **2020**

### 4. 🌍 Top 5 Countries by Content Count

→ Parsed multi-country fields to identify top-producing countries

### 5. 🕒 Longest Movie on Netflix

→ Identified the movie with the maximum duration

### 6. 🗓️ Content Added in Last 5 Years

→ Filtered content by `date_added` using current date logic

### 7. 🎬 Content by Director

→ Listed all content directed by **Rajiv Chilaka**

### 8. 📺 TV Shows with >5 Seasons

→ Extracted numeric duration and filtered shows with >5 seasons

### 9. 🎭 Content Count by Genre

→ Broke down the `listed_in` field to count content per genre

### 10. 🇮🇳 Average Yearly Releases in India

→ Analyzed India’s yearly content release and found **Top 5 Years**

### 11. 📚 Movies That Are Documentaries

→ Retrieved all documentary movies by filtering genres

### 12. ❌ Content Without Director Info

→ Queried content entries where `director` is missing

### 13. ⭐ Salman Khan Movies (Last 10 Years)

→ Fetched movies starring **Salman Khan** released in the last 10 years

### 14. 🎭 Top 10 Actors in Indian Movies

→ Identified most frequent actors in Indian-produced movies

### 15. ⚠️ Content Categorization: Good vs Bad

→ Used keyword detection in descriptions (`kill`, `violence`)
→ Categorized as **'Bad'** or **'Good'** and counted total by type

---

## 🔍 SQL Features Demonstrated

* `GROUP BY`, `ORDER BY`, `LIMIT`, `WHERE`
* `ILIKE`, `STRING_TO_ARRAY`, `UNNEST`, `SPLIT_PART`
* `CAST`, `TO_DATE`, `CASE`, `REGEXP_REPLACE`
* `WINDOW FUNCTIONS` (RANK, PARTITION BY)
* `DATE FUNCTIONS` (EXTRACT, CURRENT\_DATE, INTERVAL)
* **Text analysis** with pattern matching

---

## 📊 Insights You Can Use

* **TV Shows vs Movies**: Understanding content mix
* **Viewer Age Preferences**: Most popular ratings by type
* **Regional Growth**: Identify content-rich countries
* **Genre Demand**: What genres dominate Netflix
* **Keyword Sensitivity**: Screening for violent descriptions

---

## 📂 File Structure

```bash
📁 Netflix-Data-SQL-Project/
│
├── 📄 netflix_schema.sql     # Table creation script
├── 📄 netflix_queries.sql    # All 15 problem-solving SQL queries
└── 📄 README.md              # This file
```

---

## 📫 Contact

If you're interested in SQL projects, data analysis, or collaboration, feel free to connect:

* 🌐 [Portfolio](https://iambeep.github.io/ishmamfaruki.github.io/)
* 📩 [LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7304154703997636608/)
* 📊 [Other GitHub Projects](https://github.com/IamBeep)

