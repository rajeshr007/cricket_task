from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import redirect, render
from django.views import View
from django.views.generic.edit import CreateView
from django.views.generic import ListView

from .forms import ScoreCardForm, MatchForm, TeamForm
from .models import Team, Match, ScoreCard, ScoreCardPlayer


# Team listing
class TeamListView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        product_list = Team.objects.all()
        paginator = Paginator(product_list, 10)
        page = request.GET.get('page')
        try:
            teams = paginator.page(page)
        except PageNotAnInteger:
            teams = paginator.page(1)
        except EmptyPage:
            teams = paginator.page(paginator.num_pages)

        context = {
            "title": 'Team',
            'teams': teams,
        }

        return render(request, 'match/team.html', context)


# Add Team view logic
class TeamCreateView(LoginRequiredMixin, CreateView):
    model = Team
    form_class = TeamForm

    def get_context_data(self, **kwargs):
        kwargs['title'] = 'Team Add'
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        team = form.save(commit=False)
        team.save()
        messages.success(self.request, "Successfully Added")
        return redirect('matches:team-list')


# Player details after clicking on team
class PlayersListView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        team_obj = Team.objects.get(pk=self.kwargs.get('pk'))
        player_list = team_obj.player.all()
        paginator = Paginator(player_list, 10)
        page = request.GET.get('page')
        try:
            players = paginator.page(page)
        except PageNotAnInteger:
            players = paginator.page(1)
        except EmptyPage:
            players = paginator.page(paginator.num_pages)
        return render(request, 'core/players.html', {'players': players})


# Match view logic
class MatchListView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        match_list = Match.objects.all()
        paginator = Paginator(match_list, 10)
        page = request.GET.get('page')
        try:
            matches = paginator.page(page)
        except PageNotAnInteger:
            matches = paginator.page(1)
        except EmptyPage:
            matches = paginator.page(paginator.num_pages)
        context = {
            "title": 'Matches',
            'matches': matches
        }
        return render(request, 'match/matches.html', context)


# Add Match view logic
class MatchCreateView(LoginRequiredMixin, CreateView):
    model = Match
    form_class = MatchForm

    def get_context_data(self, **kwargs):
        kwargs['title'] = 'Match Add'
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        match = form.save(commit=False)
        match.save()
        messages.success(self.request, "Successfully Added")
        return redirect('matches:match-list')


# Score view logic
class ScoreCardView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        score_list = ScoreCard.objects.all()
        paginator = Paginator(score_list, 10)
        page = request.GET.get('page')
        try:
            score_list = paginator.page(page)
        except PageNotAnInteger:
            score_list = paginator.page(1)
        except EmptyPage:
            score_list = paginator.page(paginator.num_pages)
        context = {
            "title": 'Score Card',
            'score_list': score_list
        }
        return render(request, 'match/score-card.html', context)


# ScoreCard add view logic
class ScoreCardCreateView(LoginRequiredMixin, CreateView):
    model = ScoreCard
    form_class = ScoreCardForm

    def get_context_data(self, **kwargs):
        kwargs['title'] = 'Score Add'
        return super().get_context_data(**kwargs)

    def form_valid(self, form):
        score = form.save(commit=False)
        score.save()
        messages.success(self.request, "Successfully Added")
        return redirect('matches:score-card')


# Player Score Card after clicking on score-card
class ScoreCardPlayerListView(LoginRequiredMixin, ListView):
    model = ScoreCardPlayer
    paginate_by = 10

    def get_context_data(self, **kwargs):
        kwargs['title'] = 'Player Score Card'
        return super().get_context_data(**kwargs)

    def get_queryset(self, *args, **kwargs):
        score_id = self.kwargs['score_id']
        queryset_list = ScoreCardPlayer.objects.filter(score_id=score_id)
        return queryset_list
