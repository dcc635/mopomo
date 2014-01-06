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

class CORSResource(object):
    """
    Adds CORS headers to resources that subclass this.
    """
    def create_response(self, *args, **kwargs):
        response = super(CORSResource, self).create_response(*args, **kwargs)
        response['Access-Control-Allow-Origin'] = '*'
        response['Access-Control-Allow-Headers'] = 'Content-Type'
        return response
 
    def method_check(self, request, allowed=None):
        if allowed is None:
            allowed = []
 
        request_method = request.method.lower()
        allows = ','.join(map(str.upper, allowed))
 
        if request_method == 'options':
            response = HttpResponse(allows)
            response['Access-Control-Allow-Origin'] = '*'
            response['Access-Control-Allow-Headers'] = 'Content-Type'
            response['Allow'] = allows
            raise ImmediateHttpResponse(response=response)
 
        if not request_method in allowed:
            response = http.HttpMethodNotAllowed(allows)
            response['Allow'] = allows
            raise ImmediateHttpResponse(response=response)
 
        return request_method

class UserResource(ModelResource, CORSResource):
    class Meta:
        queryset = User.objects.all()
        resource_name = 'user'
        excludes = [
            'email',
            'password',
            'is_active',
            'is_staff',
            'is_superuser',
        ]
        allowed_methods = ['get']
        authentication = BasicAuthentication()

class TimerResource(ModelResource, CORSResource):
    #user = fields.ForeignKey(UserResource, 'user')

    class Meta:
        queryset = Timer.objects.all()
        resource_name = 'timer'
        allowed_methods = ['get']
        serializer = PrettyJSONSerializer()

    def create_response(self, *args, **kwargs):
        response = super().create_response(*args, **kwargs)
        response['Access-Control-Allow-Origin'] = 'http://artemis.vm:9000'
        response['Access-Control-Allow-Headers'] = 'Content-Type'
        response['Access-Control-Allow-Credentials'] = 'true'
        return response

