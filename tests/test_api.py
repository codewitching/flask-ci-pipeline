import pytest
from app import create_app

@pytest.fixture
def client():
    app = create_app()
    app.config["TESTING"] = True
    return app.test_client()

def test_divide_endpoint(client):
    response = client.get("/divide")
    assert response.status_code == 200
    assert response.json["result"] == 5
