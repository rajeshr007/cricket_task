from django.urls import path
from . import views

app_name = 'matches'
urlpatterns = [
    path('', views.TeamListView.as_view(), name='team-list'),
    path('<int:pk>/players/', views.PlayersListView.as_view(), name='team-players'),
    path('matches/', views.MatchListView.as_view(), name='match-list'),
    path('match/add/', views.MatchCreateView.as_view(), name='match-add'),
    path('score-card/', views.ScoreCardView.as_view(), name='score-card'),
    path('score-card/add/', views.ScoreCardCreateView.as_view(), name='score-add'),
    path('score-card/<int:score_id>/players/', views.ScoreCardPlayerListView.as_view(), name='players-score'),

]
