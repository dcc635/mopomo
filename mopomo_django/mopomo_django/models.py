from django.db import models

class Timer(models.Model):
    hours = models.IntegerField()
    minutes = models.IntegerField()
    seconds = models.IntegerField()
    milliseconds = models.IntegerField()