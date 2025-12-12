from flask import Flask
from app.routes import api

def create_app():
    app = Flask(__name__)
    app.register_blueprint(api)

    @app.route("/health")
    def health():
        return {"status": "ok"}, 200

    return app
