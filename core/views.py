from django.contrib import messages
from django.contrib.auth import authenticate, login, get_user_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.shortcuts import redirect, render, get_object_or_404
from django.http import Http404
from .filters import PlayerFilter

from .forms import SignUpForm, CustomerForm
from match.models import ScoreCard
from django.urls import reverse
from django.views.generic import ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Country

User = get_user_model()


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


@login_required
def PlayerList(request):
    player_list = User.players.filter(is_active=True)
    filter = PlayerFilter(request.GET, queryset=player_list)
    if request.GET:
        player_list = filter.qs
    paginator = Paginator(player_list, 10)
    page = request.GET.get('page')
    try:
        players = paginator.page(page)
    except PageNotAnInteger:
        players = paginator.page(1)
    except EmptyPage:
        players = paginator.page(paginator.num_pages)
    return render(request, 'core/players.html', {'players': players, 'form': filter.form})


@login_required
def player_detail(request, pk=None):
    user_obj = get_object_or_404(User, pk=pk)

    context = {
        "title": "Player Information",
        "user_obj": user_obj
    }

    return render(request, 'core/player_details.html', context)


@login_required
def player_add(request):
    if request.method == 'POST':
        form = CustomerForm(request.POST, request.FILES)
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
            "form": CustomerForm(),
        }
        return render(request, 'core/player_add.html', context)


@login_required
def customer_update(request, pk=None):
    if not request.user.is_salesperson:
        raise Http404
    instance = get_object_or_404(User, pk=pk)
    print(vars(instance))
    if request.method == 'POST':
        form = CustomerForm(request.POST, instance=instance)
        if not form.is_valid():
            return render(request, 'core/customer_update.html',
                          {'form': form})
        else:
            user = form.save(commit=False)
            user.save()
            messages.success(request, "Successfully Updated")
            return redirect('/')

    else:
        context = {
            "title": 'Update Customer',
            "form": CustomerForm(instance=instance),
        }
        return render(request, 'core/customer_update.html', context)


@login_required
def customer_delete(request, pk=None):
    if not request.user.is_salesperson:
        raise Http404
    instance = get_object_or_404(User, pk=pk)
    instance.delete()
    messages.success(request, "Successfully deleted")
    return redirect('/')


class CountryListView(LoginRequiredMixin, ListView):
    model = Country
