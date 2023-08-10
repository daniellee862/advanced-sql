# Advanced SQL with Python, PG8000 and PostgreSQL 📊

## Introduction 🎥 :
The intention of this project is to take a deeper dive into more advanced SQL queries, data analysis, and Python integration. The theme of the project and database is based on a video rental store. 

---

## Overview 🎬 :
Video streaming services are all well and good, but they lack a certain physical quality. Not to miss out on a questionable business venture, we are bringing back the **video rental store**!

Business is somewhat slow at the moment (surprisingly!) so we've been tasked to start thinking about how we store our data. At the moment we have the following three tables:

-   stores

-   customers

-   movies

-   stock

---

# Section One: 

## Task 1 - Exploring the data 🧐

- Extracted 21st century movie titles using SQL queries based on release years.
- Identified the oldest customer by extracting and sorting birthdates.
- Organized customer names alphabetically using SQL.
- Computed average ratings for 1980s movies, handling null values.
- Implemented a 5% rental fee reduction through precise SQL commands, demonstrating data manipulation skills.


> _**If you want to run the updates multiple times without going bankrupt, the data will need to be reset. I added a bash script that will run all of the *.sql files in the ./db folder. Try running the command `./run-all.sh` from your terminal in the root of this repository. This will save the output of each *.sql file in the ./db directory to a \*.txt file of the same name.**_

## Task 2 - Creating Genre Relationships 🤝

2.1 Created a `genres` table with the following data. Defined genres and descriptions, showcasing SQL schema design.

| genre_slug | description                                                    |
| ---------- | -------------------------------------------------------------- |
| family     | Fun for everyone!                                              |
| comedy     | A giggle a minute                                              |
| romance    | I feel it in my fingers, I feel it in my toes                  |
| fantasy    | There be elves and witches                                     |
| action     | Shooty shooty, punchy punchy                                   |
| drama      | Plot driven story time                                         |
| crime      | Watch out, there's gangsters about                             |
| sci_fi     | Your scientists were so preoccupied with whether they could... |


2.2 Established movie-genre relationships: Designed a junction table with many to many relationship between the `genres` and the `movies` tables.

2.3 Populated genre table: Inserted movie data, validating data manipulation and SQL skills.

| Film                               | Genres               |
| ---------------------------------- | -------------------- |
| Ghostbusters II                    | Family, Comedy       |
| The Breakfast Club                 | Comedy, Drama        |
| Todo Sobre Mi Madre                | Comedy, Drama        |
| The Lion King II: Simba''s Pride   | Family               |
| The Care Bears Movie               | Family               |
| Tron                               | Fantasy, Action      |
| Highlander                         | Fantasy, Action      |
| Cleopatra                          | Romance, Drama       |
| Catch Me If You Can                | Comedy, Drama, Crime |
| Taxi Driver                        | Drama, Crime         |
| The Princess Switch                | Comedy, Romance      |
| Girl, Interrupted                  | Drama                |
| The Fellowship of the Ring         | Fantasy, Action      |
| Episode I - The Phantom Menace     | Action, Sci-Fi       |
| Episode IV - A New Hope            | Action, Sci-Fi       |
| Episode IX - The Rise of Skywalker | Action, Sci-Fi       |
| Back to the Future                 | Comedy, Sci-Fi       |
| Back to the Future Part II         | Comedy, Sci-Fi       |
| The Godfather                      | Drama, Crime         |
| Raiders of the Lost Ark            | Action, Fantasy      |
| Pulp Fiction                       | Crime                |
| Toy Story                          | Family               |
| Groundhog Day                      | Comedy, Romance      |
| A Fish Called Wanda                | Comedy, Crime        |
| Independence Day                   | Action, Sci-Fi       |

## Task 3 - Data Insights 🔍

- Analyzed genre inventory: Calculated film counts for each genre, emphasizing SQL aggregations.
- Explored film ratings in Newcastle: Queried average ratings, showcasing data interaction.
- Revealed '90s movie excellence: Combined filtering and aggregation, demonstrating versatile SQL application.

## Task 4 - Analysing Sequal Availability 🏆

- Queried the database to identify the store with the highest total number of sequel copies. Explored this using SQL queries with a focus on film titles containing 'II' or 'VI' as indicators of sequels.
- Enhanced sequel identification by modifying the movies table to better track sequel information. Adapted previous queries to utilize the updated structure.

## Task 5 - Creating a Rental Framework 🖼️

 - Designined an effective rental information system: rentals track the following information:

    - rental_id
    - stock_id
    - rental_start
    - rental_end
    - customer_id
   
- Fulfilling complex customer rental requests: 
   - The film must be age appropriate (classification of U)
   - The film must be available in Birmingham.
   - The film must not have been rented more than 5 times already

Instead of creating a list of only the films that match this criteria, I created an output which marks `yes` or `no` in a column that represents the requirement. example ; 

| title   | age_appropriate | in_stock_nearby | not_too_mainstream |
| ------- | --------------- | --------------- | ------------------ |
| x-men 2 | no              | yes             | yes                |



## Task 6 - Visualising with ERD's 📉

- Crafted an Entity Relationship Diagram (ERD) illustrating database structure and relationships using dbdiagram.io. Leveraged the tool's visualization capabilities to depict intricate connections between tables.


