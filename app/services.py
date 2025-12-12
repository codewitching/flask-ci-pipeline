tasks=[]
counter=1

def create_task(title):
    global counter
    task = {'id': counter, 'title': title}
    tasks.append(task)
    counter += 1
    return task
def get_tasks():
    return tasks

def delete_task(task_id):
    global tasks
    tasks = [t for t in tasks if t['id'] != task_id]