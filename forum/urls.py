# coding:utf-8
from django.urls import re_path

from django.contrib.auth.decorators import login_required
from forum.views import IndexView, PostCreate, PostUpdate, PostDelete, MessageCreate, MessageDetail, SearchView, \
    UserPostView
from django.contrib import admin

from forum import views
from forum.manager_delete_decorator import delete_permission

admin.autodiscover()

urlpatterns = [
    re_path(r'^accounts/login/$', views.userlogin, name='user_login'),
    re_path(r'^accounts/logout/$', views.userlogout, name='user_logout'),
    re_path(r'^accounts/register/$',
            views.userregister,
            name='user_register'),
    re_path(r'^$', IndexView.as_view(), name='index'),
    re_path(r'^columns/$', views.columnall, name='column_all'),
    re_path(r'^column/(?P<column_pk>\d+)/$',
            views.columndetail,
            name='column_detail'),
    re_path(r'^postdetail/(?P<post_pk>\d+)/$',
            views.postdetail,
            name='post_detail'),
    re_path(r'^makefriend/(?P<sender>\w+)/(?P<receiver>\w+)/$',
            views.makefriend,
            name='make_friend'),
    re_path(r'^makecomment/$', views.makecomment, name='make_comment'),
    re_path(r'^user/postlist/$', UserPostView.as_view(), name='user_post'),
    re_path(r'^user/post_create/$',
            login_required(PostCreate.as_view()),
            name='post_create'),
    re_path(r'^user/post_update/(?P<pk>\d+)/$',
            login_required(PostUpdate.as_view()),
            name='post_update'),
    re_path(r'^user/post_delete/(?P<pk>\d+)/$',
            delete_permission(login_required(PostDelete.as_view())),
            name='post_delete'),
    # url(r'^sendmessage/(?P<sender>\w+)/(?P<receiver>\w+)/$', 'forum.views.sendmessage', name='send_message'),
    re_path(r'^user/notices/$', views.shownotice, name='show_notice'),
    re_path(r'^user/notices/(?P<pk>\d+)/$',
            views.noticedetail,
            name='notice_detail'),
    re_path(r'^user/friend/(?P<pk>\d+)/(?P<flag>\d+)/$',
            views.friendagree,
            name='friend_agree'),  # pk为对方用户id
    re_path(r'^user/messagedetail/(?P<pk>\d+)/$',
            MessageDetail.as_view(),
            name='message_detail'),  # pk为消息id
    re_path(r'^user/message/sendto/(?P<pk>\d+)/$',
            MessageCreate.as_view(),
            name='send_message'),  # pk为对方用户id
    re_path(r'^search/$', SearchView.as_view(), name='search'),
    re_path(r'^validate/$', views.validate, name='validate'),
    re_path(r'^uploadimage/', views.upload_image, name='upload_image'),
]
