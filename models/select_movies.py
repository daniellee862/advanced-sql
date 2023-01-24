import pg8000 as pg
# from dotenv import load_dotenv
# load_dotenv("../.env")

""" Create the function select_movies. It should return a list of movie dictionaries. From your locally hosted movies table. Each movie should contain the following keys:
movie_id
title
release_date
rating
classification
The default order of the movies should be alphabetically by title. """


def select_movies():
    conn = pg.Connection('daniel', database='nc_flix', password='1234')
    # THE DOCS I LOOKED AT DID NOT USE CONN.RUN FOR QUERIES
    # result = conn.run('SELECT * FROM movies;')

    # THE DOCS SAID TO USE A 'CURSOR' BUT ENSURE TO CLOSE IT TO PREVENT DATA LEAK
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM movies;')
    # cursor.fetchall() returns a list of tuples, where each tuple represents a row in the query result and the items in the tuple correspond to the values of the columns in that row.
    column_names = [desc[0] for desc in cursor.description]
    # list comprehension to convert the rows returned by cursor.fetchall() into a list of dictionaries, where each dictionary represents a row and the keys are the column names and the values are the column values.
    movies = [dict(zip(column_names, row)) for row in cursor.fetchall()]

    cursor.close()

    return movies
