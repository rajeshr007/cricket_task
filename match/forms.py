from django import forms
from .models import ScoreCard, Team, Match


# Form for Score Card create
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

    status = forms.ChoiceField(
        choices=(
            ('won', 'Won'),
            ('loss', 'Loss'),
            ('draw', 'Draw'),
        ),
        widget=forms.Select(attrs={'class': 'form-control'}),
        required=True
    )

    point = forms.IntegerField(
        widget=forms.NumberInput(attrs={'class': 'form-control'}),
        required=True)

    class Meta:
        model = ScoreCard
        fields = ['match', 'team', 'runs', 'wicket', 'over', 'status', 'point']


# Form for Match Form create
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

    match_date = forms.DateField(
        widget=forms.DateInput(attrs={'class': 'form-control date'}),
        required=True
    )

    match_result = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        max_length=30,
        required=True)

    class Meta:
        model = Match
        fields = ['name', 'team1', 'team2', 'match_date', 'match_result']
