from flask import Blueprint, jsonify

api = Blueprint("api", __name__)

@api.route("/health")
def health():
    return jsonify({
        "status": "ok",
        "message": "CI + Docker pipeline working 🚀"
    })
