from django.contrib import messages
from django.contrib.auth import authenticate, login, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import redirect, render, get_object_or_404
from django.urls import reverse
from django.views.generic import ListView

from match.models import ScoreCard
from .filters import PlayerFilter
from .forms import SignUpForm, PlayerForm
from .models import Country

User = get_user_model()


# Dashboard view
def dashboard(request):
    if request.user.is_authenticated:
        scorecard_obj = ScoreCard.objects.all()
        max_runs_obj = scorecard_obj.order_by('-runs').first()
        max_wicket_obj = scorecard_obj.order_by('-wicket').first()
        max_win_obj = ScoreCard.objects.filter(status="won").order_by('-status')
        max_win_count = max_win_obj.count()

        context = {
            "max_runs_obj": max_runs_obj,
            "max_wicket_obj": max_wicket_obj,
            "max_win_obj": max_win_obj,
            "max_win_count": max_win_count
        }
        return render(request, 'core/dashboard.html', context)
    else:
        return render(request, 'core/cover.html')


# signup user view
def signup(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if not form.is_valid():
            return render(request, 'core/signup.html',
                          {'form': form})

        else:
            first_name = form.cleaned_data.get('first_name')
            last_name = form.cleaned_data.get('last_name')
            username = form.cleaned_data.get('username')
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            User.objects.create_user(first_name=first_name, last_name=last_name, username=username, password=password,
                                     email=email)
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('/')

    else:
        return render(request, 'core/signup.html',
                      {'form': SignUpForm()})


# Player listing view
@login_required
def player_list(request):
    players = User.players.filter(is_active=True)
    filter = PlayerFilter(request.GET, queryset=players)
    if request.GET:
        players = filter.qs
    paginator = Paginator(players, 10)
    page = request.GET.get('page')
    try:
        players = paginator.page(page)
    except PageNotAnInteger:
        players = paginator.page(1)
    except EmptyPage:
        players = paginator.page(paginator.num_pages)
    return render(request, 'core/players.html', {'players': players, 'form': filter.form})


# Player detail view
@login_required
def player_detail(request, pk=None):
    user_obj = get_object_or_404(User, pk=pk)

    context = {
        "title": "Player Information",
        "user_obj": user_obj
    }

    return render(request, 'core/player_details.html', context)


# Add Player view
@login_required
def player_add(request):
    if request.method == 'POST':
        form = PlayerForm(request.POST, request.FILES)
        if not form.is_valid():
            return render(request, 'core/player_add.html',
                          {'form': form})
        else:
            user = form.save(commit=False)
            user.user_type = 'player'
            user.save()
            messages.success(request, "Successfully Added")
            return redirect(reverse('players'))

    else:
        context = {
            "title": 'Add Player',
            "form": PlayerForm(),
        }
        return render(request, 'core/player_add.html', context)


# Listing Country Generic View
class CountryListView(LoginRequiredMixin, ListView):
    model = Country
    paginate_by = 10
