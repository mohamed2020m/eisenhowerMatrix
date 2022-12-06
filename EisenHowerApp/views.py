from django.shortcuts import render
from EisenHowerApp.models import Tasks
from django.http import JsonResponse, HttpResponse
from django.core import serializers
from django.db import IntegrityError

def index(request):
    tasks = Tasks.objects.all()
    return render(request, 'EisenHowerApp/index.html', {
        "tasks": tasks,
        "valid_quadrants" : [('do_first', 'Do First'), ('schedule', 'Schedule'), 
            ('delegate', 'Delegate'), ('dont_do', 'Don\'t do')
        ]
    })

def completedTask(request):
    completed_tasks = Tasks.objects.filter(status="done")

    return render(request, "EisenHowerApp/completedTask.html", {
        "completedTask": completed_tasks
    })


def CreateTask(request):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        title = request.POST["title"]
        quadrant = request.POST["quadrant"]

        # create a task
        try:
            new_task = Tasks(title=title, quadrant=quadrant)
            new_task.save()
        except IntegrityError:
            return JsonResponse({"error": "Already exist!"}, safe=False, status='500')

        serialized_new_task = serializers.serialize('json', [ new_task, ])
        return JsonResponse(serialized_new_task,safe=False, status='200')

    return JsonResponse({"Error": "Unvalid method"}, safe=False, status='501')

def UpdateTaskStatus(request, task_id):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        checked = request.POST.get("isChecked")
        task_status = ""

        if(checked == "on"):
            task_status = "done"
        elif checked is None:
            task_status = "in_progress"

        # update Task status
        if(task_status in ['done', 'in_progress']):
            Tasks.objects.filter(id=task_id).update(status=task_status)
        else:
            return HttpResponse("server Error 500")

        updated_task = Tasks.objects.get(pk=task_id)

        serialized_updated_task = serializers.serialize('json', [ updated_task, ])
        return JsonResponse(serialized_updated_task, safe=False, status='200')
    
    return JsonResponse({"Error":"Unvalid method"}, safe=False, status='501')

def DeleteTask(request, task_id):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        print("request POST dictionary: ", request.POST)
        # delete the task
        Tasks.objects.filter(id=task_id).delete()
        return JsonResponse({"message": "Deleted Successfully!"}, safe=False, status='200')
    return JsonResponse({"Error": "Unvalid method"}, safe=False, status='501')


