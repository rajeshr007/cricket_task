from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from django.db.models import Sum, Count
from core.models import User

# Create your models here.



"""
Model class: Team class
Depdency: Base model
"""


class Team(models.Model):
    name = models.CharField(max_length=80, unique=True)
    logo_uri = models.ImageField(upload_to='team_logo/', blank=False)
    club_state = models.CharField(max_length=80, blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "team"

    @property
    def total_runs(self):
        runs_obj = ScoreCard.objects.filter(team=self.id)
        return runs_obj.aggregate(Sum('runs'))['runs__sum'] if runs_obj.exists() else 0
        # return total_runs

    @property
    def total_wickets(self):
        wickets_obj = ScoreCard.objects.filter(team=self.id)
        return wickets_obj.aggregate(Sum('wicket'))['wicket__sum'] if wickets_obj.exists() else 0

    @property
    def total_overs(self):
        overs_obj = ScoreCard.objects.filter(team=self.id)
        return overs_obj.aggregate(Sum('over'))['over__sum'] if overs_obj.exists() else 0

    @property
    def total_point(self):
        point_obj = ScoreCard.objects.filter(team=self.id)
        return point_obj.aggregate(Sum('point'))['point__sum'] if point_obj.exists() else 0

    @property
    def total_status(self):
        status_obj = ScoreCard.objects.filter(team=self.id)
        total_status = {}
        win = 0;
        loss = 0;
        draw = 0
        for status in status_obj:
            if status.status == 'won':
                win = +1
            elif status.status == 'loss':
                loss = +1
            elif status.status == 'draw':
                draw = +1
            else:
                pass
        total_status["win"] = win;
        total_status["loss"] = loss;
        total_status["draw"] = draw
        return total_status


"""
Model class: Match details class
Depdency: Base model, Team model
"""


class Match(models.Model):
    name = models.CharField(max_length=100, blank=False)
    team1 = models.ForeignKey(Team, related_name="team1", blank=False, on_delete=models.CASCADE)
    team2 = models.ForeignKey(Team, related_name="team2", blank=False, on_delete=models.CASCADE)
    match_date = models.DateTimeField(null=True, blank=True)
    match_result = models.CharField(max_length=100, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "match"
        ordering = ['-created_at']


"""
Model class: Match Player details class
Depdency: Base model, User model, Team modal
"""


class MatchPlayerDetails(models.Model):
    match_id = models.ForeignKey(Match, related_name="match_player", blank=False, on_delete=models.CASCADE)
    team_id = models.ForeignKey(Team, related_name="match_team", blank=False, on_delete=models.CASCADE)
    player = models.ForeignKey(User, related_name="user_player", blank=False, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.match_id.name

    class Meta:
        db_table = "match_player_detail"


"""
Model class: ScoreCard class
Depdency: Base model, User model, Team modal
"""


class ScoreCard(models.Model):
    SCORE_STATUS_CHOICE = (
        ('won', 'Won'),
        ('loss', 'Loss'),
        ('draw', 'Draw'),
    )

    match = models.ForeignKey(Match, related_name="score_card_match", blank=False, on_delete=models.CASCADE)
    team = models.ForeignKey(Team, related_name="score_card_team", blank=False, on_delete=models.CASCADE)
    runs = models.IntegerField(blank=False, default=0)
    wicket = models.IntegerField(blank=False, default=0)
    over = models.FloatField(blank=False, default=0.0)
    status = models.CharField(max_length=10, choices=SCORE_STATUS_CHOICE, blank=True)
    point = models.IntegerField(blank=False, default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.match.name

    class Meta:
        db_table = "score_card"
        ordering = ['-created_at']

    def score_status_list(self):
        return self.status


"""
Model class: ScoreCardPlayer class
Depdency: Base model, User model, Team modal
"""


class ScoreCardPlayer(models.Model):
    PLAYER_STATUS_CHOICE = (
        ('out', 'Out'),
        ('notout', 'Not Out'),
        ('notplayed', 'Not Played'),
    )

    score = models.ForeignKey(ScoreCard, related_name="score_player", blank=False, on_delete=models.CASCADE)
    player_id = models.ForeignKey(User, related_name="player_score", blank=False, on_delete=models.CASCADE)
    runs = models.IntegerField(blank=False, default=0)
    wicket = models.IntegerField(blank=False, default=0)
    over = models.FloatField(blank=False, default=0.0)
    fifty = models.IntegerField(blank=False, default=0)
    hundred = models.IntegerField(blank=False, default=0)
    meadan_over = models.FloatField(blank=False, default=0)
    fours = models.IntegerField(blank=False, default=0)
    sixs = models.IntegerField(blank=False, default=0)
    man_of_match = models.BooleanField(blank=False, default=False)
    status = models.CharField(max_length=10, choices=PLAYER_STATUS_CHOICE, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.player_id.first_name

    class Meta:
        db_table = "score_card_player"
