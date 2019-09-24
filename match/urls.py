from django.urls import path
from . import views

app_name = 'matches'
urlpatterns = [
    path('', views.TeamListView.as_view(), name='team-list'),
    path('<int:pk>/players/', views.PlayersListView.as_view(), name='team-players'),
    path('matches/', views.MatchListView.as_view(), name='team-matches'),
    path('score-card/', views.ScoreCardView.as_view(), name='score-card'),


    # url(r'^add/$', views.product_add, name='product_add'),
    # url(r'^(?P<pk>\d+)/edit/$', views.product_update, name='product_update'),
    # url(r'^(?P<pk>\d+)/delete/$', views.product_delete, name='product_delete'),

]
