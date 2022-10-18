from curses.ascii import HT
import http
import re
from urllib.error import HTTPError
from django.contrib.auth import authenticate, login, logout
from django.db import IntegrityError
from django.http import HttpResponseRedirect, JsonResponse, Http404
from django.shortcuts import HttpResponse, render
from django.urls import reverse
from django.utils import timezone
from django.core import serializers
# from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from .models import User, Posts, Followers
from .form import PostsForm
from .helper import paginator, isFollowing


def index(request):    
    posts = Posts.objects.all().order_by('-editedAt')   
    page_obj, page_number, last_page = paginator(request, posts)
    form = PostsForm()
    return render(request, "network/index.html", {'form': form,'posts' : page_obj, "current_page": page_number, "last_page": last_page})

@login_required      
def NewPost(request):
    if(request.headers.get('x-requested-with') == 'XMLHttpRequest' and 
        request.method == 'POST'):
        form = PostsForm(request.POST)
        if form.is_valid():
            try:
                new_p = Posts(poster=request.user, content=request.POST['content'], createdAt=timezone.now(), editedAt=timezone.now())
                new_p.save()
                ser_content = serializers.serialize('json', [ new_p, ])
                print(ser_content)
                return JsonResponse({"content": ser_content}, status=200)
            except Posts.DoesNotExist:
                raise Http404()
        return JsonResponse({"error": "not valid data"}, status=400)
    return JsonResponse({"error": "something went wrong!"}, status=500)

@login_required
def EditPost(request, post_id):
    if(request.headers.get('x-requested-with') == 'XMLHttpRequest' and 
        request.method == 'POST'):
        try:
            Posts.objects.filter(id=post_id).update(
                content=request.POST['content'], 
                edited = True, 
                editedAt=timezone.now()
            )
            post = Posts.objects.filter(id=post_id)[0]
            ser_content = serializers.serialize('json', [ post, ])
            return JsonResponse({"content": ser_content}, status=200)
        except Posts.DoesNotExist:
            raise Http404()
    return JsonResponse({"error": "something went wrong!"}, status=500)

@login_required
def MyProfile(request):
    try:
        user = User.objects.get(id=request.user.id)
        followers = len(Followers.objects.filter(user=user))
        followings = len(Followers.objects.filter(follower=user))
        posts = Posts.objects.filter(poster=user)
        page_obj, page_number, last_page = paginator(request, posts)
        
        return render(request, 'network/profile.html', {
            'user_id':user.id,
            'followers': followers,
            'followings': followings,
            'posts' : page_obj, 
            "current_page": page_number, 
            "last_page": last_page
        })

    except User.DoesNotExist or Posts.DoesNotExist:
        raise Http404

@login_required
def profile(request, username_id):

    # make sure that username_id contains - character
    if not username_id.count('-'):
        raise Http404

    # extract the id from username_id
    username, id = username_id.split('-')

    # check if id is numeric
    if(not id.isnumeric()):
        raise Http404

    id = int(id)

    # checking if the user id is valid
    try:
        user = User.objects.get(id=id)
        posts = Posts.objects.filter(poster=user).order_by('-createdAt')
        followers = len(Followers.objects.filter(user=user))
        followings = len(Followers.objects.filter(follower=user))

        isfollowed = isFollowing(request, user.id, User, Followers)

        if not len(User.objects.filter(username=username)):
            raise Http404
        
        if(request.user.id == id):
            return HttpResponseRedirect(reverse('me'))

        if(user.id != User.objects.filter(username=username)[0].id):
            raise Http404

        page_obj, page_number, last_page = paginator(request, posts)

        return render(request, 'network/profile.html', {
            'user_id':user.id,
            'name': username,
            'followers': followers,
            'followings': followings,
            'isFollowed': isfollowed,
            'posts' : page_obj, 
            "current_page": page_number, 
            "last_page": last_page
        })

    except User.DoesNotExist or Posts.DoesNotExist:
        raise Http404

@login_required
def Follow(request, user_id):
    if(request.headers.get('x-requested-with') == 'XMLHttpRequest' and 
        request.method == 'POST'):
        user = User.objects.get(id=user_id)
        try:
            if(isFollowing(request, user_id, User, Followers)):
                # unfollow
                followers = Followers.objects.get(user=user, follower=request.user)
                followers.delete()
                ser_follower = serializers.serialize('json', [user,])
                return JsonResponse({"ser_follower": ser_follower, "followed": False, "number_of_followers": len(Followers.objects.filter(user=user))}, status=200)
            else:
                #follow
                new_follower = Followers(user=user, follower=request.user)
                new_follower.save()
                ser_follower = serializers.serialize('json', [user])
                return JsonResponse({"ser_follower": ser_follower, "followed": True, "number_of_followers": len(Followers.objects.filter(user=user))}, status=200)

        except User.DoesNotExist or Followers.DoesNotExist:
            raise Http404

    else:
        return HttpResponse("unvalid method, method shoud be post!")

@login_required
def LikePost(request, post_id):
    if(request.headers.get('x-requested-with') == 'XMLHttpRequest' and 
        request.method == 'POST'):
        post = Posts.objects.get(id=post_id)
        if request.user.id not in [u.id for u in list(post.likes.all())] :
            post.likes.add(request.user)
        else:
            post.likes.remove(request.user)
        return JsonResponse({"num_of_likes" : len(post.likes.all())})
    else:
        return HttpResponse("unvalid method!")


@login_required
def following(request):
    # people I follow
    my_following = [item.user for item in Followers.objects.filter(follower=request.user.id)]
    my_following_posts = []
    for myf in my_following:
        posts = Posts.objects.filter(poster=myf)
        for p in posts:
            my_following_posts.append(p)
    
    page_obj, page_number, last_page = paginator(request, my_following_posts)
    
    return render(request, "network/following.html", {
        'posts' : page_obj, 
        "current_page": page_number, 
        "last_page": last_page
        }
    )


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
            return render(request, "network/login.html", {
                "message": "Invalid username and/or password."
            })
    else:
        return render(request, "network/login.html")


def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse("index"))


def register(request):
    if request.method == "POST":
        username = request.POST["username"]
        email = request.POST["email"]

        # Ensure password matches confirmation
        password = request.POST["password"]
        confirmation = request.POST["confirmation"]
        if password != confirmation:
            return render(request, "network/register.html", {
                "message": "Passwords must match."
            })

        # Attempt to create new user
        try:
            user = User.objects.create_user(username, email, password)
            user.save()
        except IntegrityError:
            return render(request, "network/register.html", {
                "message": "Username already taken."
            })
        login(request, user)
        return HttpResponseRedirect(reverse("index"))
    else:
        return render(request, "network/register.html")
