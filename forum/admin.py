from django.contrib import admin
from forum.models import LoginUser,Nav,Column,PostType,Post,Comment,Message,Application,Notice
# Register your models here.

admin.site.register(LoginUser)
admin.site.register(Nav)
admin.site.register(Column)
admin.site.register(PostType)
admin.site.register(Post)
admin.site.register(Comment)
admin.site.register(Message)
admin.site.register(Application)
admin.site.register(Notice)
