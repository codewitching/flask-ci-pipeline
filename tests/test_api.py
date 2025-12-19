def test_divide_endpoint(client):
    response = client.get("/divide")
    assert response.status_code == 200
    assert response.json["result"] == 5
