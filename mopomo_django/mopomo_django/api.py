from tastypie.resources import ModelResource
from mopomo_django.models import Timer

class TimerResource(ModelResource):
    class Meta:
        queryset = Timer.objects.all()
        resource_name = 'timer'
