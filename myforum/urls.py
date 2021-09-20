from django.urls import include, path
from django.contrib import admin
admin.autodiscover()

urlpatterns = [
    path(r'admin/', admin.site.urls),
    path(r'', include('forum.urls')),
]
