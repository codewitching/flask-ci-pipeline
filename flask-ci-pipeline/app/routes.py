from flask import Blueprint, request, jsonify
from app.services import create_task, get_tasks, delete_task

api=Blueprint("api",__name__)

@api.route("/tasks", methods=["POST"])
def add_task():
    data = request.get_json()
    task = create_task(data["title"])
    return jsonify(task), 201

@api.route("/tasks", methods=["GET"])
def list_tasks():
    return jsonify(get_tasks()), 200        

@api.route("/tasks/<int:task_id>", methods=["DELETE"])
def remove_task(task_id):
    delete_task(task_id)
    return {"deleted": True}, 200