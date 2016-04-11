#coding:utf-8
from django.conf.urls import patterns, include, url
from django.contrib.auth.decorators import login_required
from forum.views import IndexView,PostCreate,PostUpdate,PostDelete,MessageCreate,MessageDetail,SearchView,UserPostView
from django.contrib import admin

from forum.manager_delete_decorator import delete_permission

admin.autodiscover()

urlpatterns = patterns('',
    
    url(r'^accounts/login/$','forum.views.userlogin',name='user_login'),
    url(r'^accounts/logout/$','forum.views.userlogout',name='user_logout'),
    url(r'^accounts/register/$','forum.views.userregister',name='user_register'),
    url(r'^$',IndexView.as_view(),name='index'),
    url(r'^columns/$','forum.views.columnall',name='column_all'),
    url(r'^column/(?P<column_pk>\d+)/$','forum.views.columndetail',name='column_detail'),
    url(r'^postdetail/(?P<post_pk>\d+)/$', 'forum.views.postdetail', name='post_detail'),   
    url(r'^makefriend/(?P<sender>\w+)/(?P<receiver>\w+)/$', 'forum.views.makefriend', name='make_friend'), 
    url(r'^makecomment/$', 'forum.views.makecomment', name='make_comment'),
    url(r'^user/postlist/$', UserPostView.as_view(), name='user_post'),
    url(r'^user/post_create/$', login_required(PostCreate.as_view()), name='post_create'), 
    url(r'^user/post_update/(?P<pk>\d+)/$', login_required(PostUpdate.as_view()), name='post_update'),   	
    url(r'^user/post_delete/(?P<pk>\d+)/$', delete_permission(login_required(PostDelete.as_view())), name='post_delete'), 
    #url(r'^sendmessage/(?P<sender>\w+)/(?P<receiver>\w+)/$', 'forum.views.sendmessage', name='send_message'), 
    url(r'^user/notices/$', 'forum.views.shownotice', name='show_notice'),
    url(r'^user/notices/(?P<pk>\d+)/$', 'forum.views.noticedetail', name='notice_detail'),    

    url(r'^user/friend/(?P<pk>\d+)/(?P<flag>\d+)/$', 'forum.views.friendagree', name='friend_agree'),#pk为对方用户id
    url(r'^user/messagedetail/(?P<pk>\d+)/$', MessageDetail.as_view(), name='message_detail'),#pk为消息id
    url(r'^user/message/sendto/(?P<pk>\d+)/$', MessageCreate.as_view(), name='send_message'),#pk为对方用户id
    url(r'^search/$', SearchView.as_view(), name='search'),

    url(r'^validate/$', 'forum.views.validate', name='validate'),
    url(r'^uploadimage/','forum.views.upload_image',name='upload_image'),
)
