from django.contrib import admin
from .models import Team,Match,MatchPlayerDetails,ScoreCard,ScoreCardPlayer


admin.site.register(Team)
admin.site.register(Match)
admin.site.register(MatchPlayerDetails)
admin.site.register(ScoreCard)
admin.site.register(ScoreCardPlayer)
