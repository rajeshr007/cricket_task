from django import forms
from .models import ScoreCard, Team, Match


class ScoreCardForm(forms.ModelForm):
    team = forms.ModelChoiceField(
        queryset=Team.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=True
    )

    match = forms.ModelChoiceField(
        queryset=Match.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=True
    )

    runs = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control'}),
        required=True)
    wicket = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control'}),
        required=True)
    over = forms.FloatField(
        widget=forms.NumberInput(attrs={'step': 0.1, 'class': 'form-control'}),
        required=True)

    status = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        max_length=30,
        required=True)
    point = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control'}),
        required=True)

    class Meta:
        model = ScoreCard
        fields = ['match', 'team', 'runs', 'wicket', 'over', 'status', 'point']


class MatchForm(forms.ModelForm):
    name = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        max_length=30,
        required=True)

    team1 = forms.ModelChoiceField(
        queryset=Team.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=True
    )

    team2 = forms.ModelChoiceField(
        queryset=Team.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=True
    )

    match_result = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        max_length=30,
        required=True)

    class Meta:
        model = Match
        fields = ['name', 'team1', 'team2', 'match_date', 'match_result']
