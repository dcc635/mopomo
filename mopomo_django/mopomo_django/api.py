from django.contrib.auth.models import User
from tastypie import fields
from tastypie.authentication import BasicAuthentication
from tastypie.resources import ModelResource
from mopomo_django.models import Timer

import json
from django.core.serializers.json import DjangoJSONEncoder
from tastypie.serializers import Serializer

class PrettyJSONSerializer(Serializer):
    json_indent = 2

    def to_json(self, data, options=None):
        options = options or {}
        data = self.to_simple(data, options)
        return json.dumps(data, cls=DjangoJSONEncoder,
                sort_keys=True, ensure_ascii=False, indent=self.json_indent)

class UserResource(ModelResource):
    class Meta:
        queryset = User.objects.all()
        #resource_name = 'user'
        excludes = [
            'email',
            'password',
            'is_active',
            'is_staff',
            'is_superuser',
        ]
        allowed_methods = ['get']
        authentication = BasicAuthentication()

class TimerResource(ModelResource):
    #user = fields.ForeignKey(UserResource, 'user')

    class Meta:
        queryset = Timer.objects.all()
        resource_name = 'timer'
        serializer = PrettyJSONSerializer()
