from flask import Blueprint, jsonify

api = Blueprint("api", __name__)

@api.route("/health")
def health():
    return jsonify({"status": "ok"})

# ❌ BAD ENDPOINT (INTENTIONAL BUG)
@api.route("/divide")
def divide():
    return 10 / 0   # 💥 division by zero
