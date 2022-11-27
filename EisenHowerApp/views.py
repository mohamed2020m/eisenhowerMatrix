from django.shortcuts import render
from EisenHowerApp.models import Tasks
from django.http import JsonResponse
from django.core import serializers

def index(request):
    tasks = Tasks.objects.all()
    return render(request, 'EisenHowerApp/index.html', {
        "tasks": tasks,
        "valid_quadrants" : [('do_first', 'Do First'), ('schedule', 'Schedule'), 
            ('delegate', 'Delegate'), ('dont_do', 'Don\'t do')
        ]
    })

def completedTask(request):
    return render(request, "EisenHowerApp/completedTask.html", {})


def CreateTask(request):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        title = request.POST["title"]
        quadrant = request.POST["quadrant"]

        # create a task
        new_task = Tasks(title=title, quadrant=quadrant)
        new_task.save()

        serialized_new_task = serializers.serialize('json', [ new_task, ])
        return JsonResponse(serialized_new_task,safe=False, status='200')





