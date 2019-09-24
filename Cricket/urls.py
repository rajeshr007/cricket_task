"""Cricket URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import include
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import path

from core.views import (signup, CountryListView, player_list,
                        dashboard, player_detail, player_add)

urlpatterns = [
    # dashboard url
    path('', dashboard, name='home'),

    # profile urls
    path('login', auth_views.LoginView.as_view(template_name='core/cover.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/'), name='logout'),
    path('signup/', signup, name='signup'),

    # players urls
    path('players/', player_list, name='players'),
    path('player/<int:pk>/', player_detail, name='player_detail'),
    path('player/add/', player_add, name='player_add'),

    # country url
    path('country-list/', CountryListView.as_view(), name='country-list'),

    # including team app urls
    path('team/', include("match.urls")),

    path('admin/', admin.site.urls),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
