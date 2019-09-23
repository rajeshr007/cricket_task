from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from django.db.models import Sum, Count
from django.apps import apps

"""
Model class: Country class
Depdency: Base model
"""


class Country(models.Model):
    code = models.CharField(max_length=10, unique=True)
    name = models.CharField(max_length=80, blank=False, unique=True)
    flag = models.ImageField(upload_to='country_flag/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table = "country"


class AdminManager(models.Manager):
    def get_queryset(self):
        return super(AdminManager, self).get_queryset().filter(user_type='admin')


class PlayerManager(models.Manager):
    def get_queryset(self):
        return super(PlayerManager, self).get_queryset().filter(user_type='player')


class User(AbstractUser):
    type_choices = (
        ('admin', 'Admin'),
        ('player', 'Player'),
    )

    PLAYER_TYPE_CHOICE = (
        ('batsman', 'Batsman'),
        ('bowler', 'Bowler'),
        ('wicket keeper', 'Wicket Keeper'),
        ('captain', 'Captain'),
        ('All rounder', 'All Rounder'),
    )

    user_type = models.CharField(max_length=20, choices=type_choices, default='P')
    email = models.EmailField(unique=True)
    image_uri = models.ImageField(upload_to='image_user/', blank=False)
    jersy_number = models.CharField(max_length=5, blank=False)
    country = models.ForeignKey(Country, null=True, blank=True, on_delete=models.CASCADE)
    team = models.ForeignKey("match.Team", related_name="player", null=True, blank=True, on_delete=models.CASCADE)
    player_type = models.CharField(max_length=20, choices=PLAYER_TYPE_CHOICE, default="all rounder", blank=False)

    def __str__(self):
        return self.username

    class Meta:
        db_table = "user"
        ordering = ['-date_joined']

    objects = UserManager()
    admins = AdminManager()
    players = PlayerManager()

    @property
    def is_admin(self):
        if self.user_type == 'admin':
            return True
        return False

    @property
    def is_player(self):
        if self.user_type == 'player':
            return True
        return False

    def playertype(self):
        return str(self.first_name) + " " + str(self.last_name) + " - " + str(self.player_type)

    @property
    def total_runs(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        runs_obj = ScoreCardPlayer.objects.filter(player_id=self.id)
        return runs_obj.aggregate(Sum('runs'))['runs__sum'] if runs_obj.exists() else 0

    @property
    def total_wickets(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        wickets_obj = ScoreCardPlayer.objects.filter(player_id=self.id)
        return wickets_obj.aggregate(Sum('wicket'))['wicket__sum'] if wickets_obj.exists() else 0

    @property
    def total_overs(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        overs_obj = ScoreCardPlayer.objects.filter(player_id=self.id)
        return overs_obj.aggregate(Sum('over'))['over__sum'] if overs_obj.exists() else 0

    @property
    def total_meadan_overs(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        meadan_overs_obj = ScoreCardPlayer.objects.filter(player_id=self.id)
        return meadan_overs_obj.aggregate(Sum('meadan_over'))['meadan_over__sum'] if meadan_overs_obj.exists() else 0

    @property
    def total_fours(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        fours_obj = ScoreCardPlayer.objects.filter(player_id=self.id)
        return fours_obj.aggregate(Sum('fours'))['fours__sum'] if fours_obj.exists() else 0

    @property
    def total_sixs(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        sixs_obj = ScoreCardPlayer.objects.filter(player_id=self.id)
        return sixs_obj.aggregate(Sum('sixs'))['sixs__sum'] if sixs_obj.exists() else 0

    @property
    def total_fifty(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        return ScoreCardPlayer.objects.filter(player_id=self.id).aggregate(Sum('fifty'))['fifty__sum']

    @property
    def total_hundred(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        return ScoreCardPlayer.objects.filter(player_id=self.id).aggregate(Sum('hundred'))['hundred__sum']

    @property
    def total_man_of_match(self):
        ScoreCardPlayer = apps.get_model('match', 'ScoreCardPlayer')
        return ScoreCardPlayer.objects.filter(player_id=self.id, man_of_match=True).count
