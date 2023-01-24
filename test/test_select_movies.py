from models.select_movies import select_movies


def test_return_value_is_list():
    result = select_movies()
    assert isinstance(result, list)
