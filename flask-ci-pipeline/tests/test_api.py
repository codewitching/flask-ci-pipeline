from app import create_app

def test_health_check():
    flask_app = create_app()
    client = flask_app.test_client()
    response = client.get("/health")
    assert response.status_code == 200

def test_create_task():
    flask_app = create_app()
    client = flask_app.test_client()
    response = client.post("/tasks", json={"title": "CI Task"})
    assert response.status_code == 201
    data = response.get_json()
    assert data["title"] == "CI Task"
