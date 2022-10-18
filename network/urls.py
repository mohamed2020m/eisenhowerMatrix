
from django.urls import path

from . import views

# app_name='network'

urlpatterns = [
    path("", views.index, name="index"),
    path("newPost", views.NewPost, name="newpost"),
    path("editPost/<int:post_id>", views.EditPost, name="editpost"),
    path("likePost/<int:post_id>", views.LikePost, name="listpost"),
    path("follow/<int:user_id>", views.Follow, name="follow_user"),
    path('following', views.following, name="following"),
    path("profile/me", views.MyProfile, name="me"),
    path("profile/<slug:username_id>", views.profile, name="profile"),
    path("login", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
    path("register", views.register, name="register")
]