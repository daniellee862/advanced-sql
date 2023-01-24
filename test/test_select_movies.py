from models.select_movies import select_movies

result = select_movies()


def test_return_value_is_list():
    assert isinstance(result, list)


def test_return_value_length():
    assert len(result) == 25


def test_movie_dict_has_correct_properties():
    for movie in result:
        assert "movie_id" in movie
        assert "title" in movie
        assert "release_date" in movie
        assert "rating" in movie
        assert "cost" in movie
        assert "classification" in movie


def test_default_sorting_by_title():
    assert result[0]["title"] == 'A Fish Called Wanda'


def test_optional_sorting():
    sort_by_release = select_movies('release_date')
    assert sort_by_release[0]["title"] == 'Cleopatra'
    sort_by_rating = select_movies('rating')
    assert sort_by_rating[0]["title"] == 'The Lion King II: Simba\'s Pride'
    sort_by_cost = select_movies('cost')
    assert sort_by_cost[0]["title"] == 'The Care Bears Movie'
