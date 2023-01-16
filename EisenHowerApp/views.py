from django.shortcuts import render, redirect
from django.http import JsonResponse, HttpResponseRedirect
from django.urls import reverse
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from django.core import serializers
from django.utils import timezone
from django.utils.html import format_html
from django.db import IntegrityError
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from EisenHowerApp.models import Tasks, Users

@login_required(login_url='login')
def index(request):
    tasks = Tasks.objects.filter(user=request.user)
    return render(request, 'EisenHowerApp/index.html', {
        "tasks": tasks,
        "valid_quadrants" : [('do_first', 'Do First'), ('schedule', 'Schedule'), 
            ('delegate', 'Delegate'), ('dont_do', 'Don\'t do')
        ]
    })

@login_required(login_url='login')
def task(request, task_id):
    try:
        task = Tasks.objects.get(id=task_id, user_id=request.user)
        return render(request, 'EisenHowerApp/task_info.html', {
            "task": task,
            "task_description": format_html(task.description),
            "valid_quadrants" : [('do_first', 'Do First'), ('schedule', 'Schedule'), 
                ('delegate', 'Delegate'), ('dont_do', 'Don\'t do')
            ]
        })
    except Tasks.DoesNotExist:
        return render(request, 'EisenHowerApp/404.html', {

        })

@login_required(login_url='login')
def completedTask(request):
    completed_tasks = Tasks.objects.filter(user=request.user, status="done")

    return render(request, "EisenHowerApp/completedTask.html", {
        "completedTask": completed_tasks
    })

@login_required(login_url='login')
def CreateTask(request):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        title = request.POST["title"]
        quadrant = request.POST["quadrant"]
        task_description = request.POST["task_description"]

        print("description: ", task_description)
        # create a task
        try:
            if quadrant in ['do_first', 'schedule', 'delegate','dont_do'] :
                if not title:
                    return JsonResponse({"error": "Empty title not Allowed!"}, status=500)
                new_task = Tasks(title=title, description=task_description, quadrant=quadrant, user=request.user)
                new_task.save()
            else:
                raise ValueError('No valid task type!') 
        except IntegrityError:
            return JsonResponse({"error": "Already exist!"}, status=500)
        
        except ValueError as e:
            return JsonResponse({"error": str(e)}, status=501)

        serialized_new_task = serializers.serialize('json', [ new_task])
        return JsonResponse({"message": "Successfully created!", "result": serialized_new_task}, status=200)

    return JsonResponse({"Error": "Unvalid method"}, status=405)

@login_required(login_url='login')
def EditTask(request, task_id):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        title = request.POST["title"]
        quadrant = request.POST["quadrant"]
        task_description = request.POST["task_description"]
        # edit a task
        try:
            if quadrant in ['do_first', 'schedule', 'delegate','dont_do'] :
                if not title:
                    return JsonResponse({"error": "Empty title not Allowed!"}, status=500)
                Tasks.objects.filter(id=task_id, user=request.user).update(
                    title=title, 
                    description=task_description, 
                    quadrant=quadrant,
                    updated_At=timezone.now(),
                    isUpdated = True
                )
            else:
                raise ValueError('No valid task type!') 
        except IntegrityError:
            return JsonResponse({"error": "Already exist!"}, status=500)
        
        except ValueError as e:
            return JsonResponse({"error": str(e)}, status=501)

        serialized_updated_task = serializers.serialize('json', [ Tasks.objects.get(id=task_id)])
        return JsonResponse({"message": "Successfully updated!", "result": serialized_updated_task}, status=200)

    return JsonResponse({"Error": "Unvalid method"}, status=405)


@login_required(login_url='login')
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
            Tasks.objects.filter(id=task_id, user=request.user).update(status=task_status)
        else:
            return JsonResponse({"error":"Unvalid task status!"}, status=400)

        updated_task = Tasks.objects.get(pk=task_id)

        serialized_updated_task = serializers.serialize('json', [ updated_task, ])
        return JsonResponse(serialized_updated_task, safe=False, status=200)
    
    return JsonResponse({"Error":"Unvalid method"}, status=405)

@login_required(login_url='login')
def DeleteTask(request, task_id):
    if request.method == 'POST' and request.headers.get('x-requested-with') == 'XMLHttpRequest':
        # delete the task
        Tasks.objects.filter(id=task_id, user=request.user).delete()
        return JsonResponse({"message": "Deleted Successfully!"}, status=200)
    return JsonResponse({"Error": "Unvalid method"}, status=405)

@login_required(login_url='login')
def DeleteTaskWithoutAjax(request, task_id):
    if request.method == 'POST':
        Tasks.objects.filter(id=task_id, user=request.user).delete()
        return HttpResponseRedirect(reverse('index'))
    return JsonResponse({"Error": "Unvalid method"}, status=405)

def login_view(request):
    if request.method == "POST":
        # Attempt to sign user in
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)

        # Check if authentication successful
        if user is not None:
            login(request, user)
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, "EisenHowerApp/login.html", {
                "message": "Invalid username and/or password."
            })

    return render(request, "EisenHowerApp/login.html")


def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse("index"))

def register(request):
    if request.method == "POST":
        username = request.POST["username"]
        first_name = request.POST["firstname"]
        last_name = request.POST["lastname"]
        email = request.POST["email"]
        password = request.POST["password"]
        confirmation = request.POST["confirmation"]
        
        # username shouldn't be empty
        if not username:
            return render(request, "EisenHowerApp/register.html", {
                "message": "Username required!"
            })
        # firstName and lastName must be non-empty
        if not first_name and not last_name:
            return render(request, "EisenHowerApp/register.html", {
                "message": "firstName and LastName are required!"
            })
        # Ensure email is valid
        try:
            validate_email(email)
        except ValidationError:
            return render(request, "EisenHowerApp/register.html", {
                 "message": "Enter a valid email address"
            })

        # Ensure password matches confirmation
        if password != confirmation:
            return render(request, "EisenHowerApp/register.html", {
                "message": "Passwords must match."
            })

        # Attempt to create new user
        try:
            user = Users.objects.create_user(
                username=username, 
                first_name=first_name, 
                last_name=last_name,
                email=email, 
                password=password, 
            )
            user.save()

        except IntegrityError:
            return render(request, "EisenHowerApp/register.html", {
                "message": "Username already taken."
            })

        login(request, user)
        return HttpResponseRedirect(reverse("index"))

    return render(request, "EisenHowerApp/register.html", {})