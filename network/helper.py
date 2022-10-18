from django.core.paginator import Paginator

def paginator(request, posts):
    paginator = Paginator(posts, 10)
    page_number = request.GET.get('page')
    if(page_number):
        page_number = int(page_number)
    else:
        page_number = 1
    
    page_obj = paginator.get_page(page_number)
    return page_obj, page_number, paginator.num_pages


def isFollowing(request, user_id, User, Followers):
    isfollowed_arr = [u.user.id for u in Followers.objects.filter(follower=User.objects.get(id=request.user.id))]
    return user_id in isfollowed_arr