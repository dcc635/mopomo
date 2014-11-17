from django.db import models
from django.template.defaultfilters import slugify


class Timer(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField()
    start_hours = models.IntegerField()
    start_minutes = models.IntegerField()
    start_seconds = models.IntegerField()
    start_milliseconds = models.IntegerField()
    current_hours = models.IntegerField()
    current_minutes = models.IntegerField()
    current_seconds = models.IntegerField()
    current_milliseconds = models.IntegerField()

    def __unicode__(self):
        return self.title

    def save(self, *args, **kwargs):
        # For automatic slug generation
        if not self.slug:
            self.slug = slugify(self.title)[:50]
        if not self.current_hours:
            self.current_hours = self.start_hours
        if not self.current_minutes:
            self.current_minutes = self.start_minutes
        if not self.current_seconds:
            self.current_seconds = self.start_seconds
        if not self.current_milliseconds:
            self.current_milliseconds = self.start_milliseconds

        return super().save(*args, **kwargs)
