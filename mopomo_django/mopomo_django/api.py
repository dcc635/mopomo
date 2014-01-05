from django.contrib.auth.models import User
from tastypie import fields
from tastypie.resources import ModelResource
from mopomo_django.models import Timer

class UserResource(ModelResource):
    class Meta:
        queryset = User.objects.all()
        resource_name = 'user'

class TimerResource(ModelResource):
    user = fields.ForeignKey(UserResource, 'user')

    class Meta:
        queryset = Timer.objects.all()
        resource_name = 'timer'
