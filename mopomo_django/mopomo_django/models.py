from django.contrib.auth.models import User
from django.db import models
from django.template.defaultfilters import slugify

class Timer(models.Model):
    #user = models.ForeignKey(User)
    title = models.CharField(max_length=200)
    slug = models.SlugField()
    hours = models.IntegerField()
    minutes = models.IntegerField()
    seconds = models.IntegerField()
    milliseconds = models.IntegerField()

    def __unicode__(self):
        return self.title

    def save(self, *args, **kwargs):
        # For automatic slug generation
        if not self.slug:
            self.slug = slugify(self.title)[:50]

        return super().save(*args, **kwargs)