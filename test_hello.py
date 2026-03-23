from hello import toyou, add, subtract

def setup_function(function):
    function.x = 10

def teardown_function(function):
    del function.x

def test_hello_subtract():
    assert subtract(test_hello_subtract.x) == 9
