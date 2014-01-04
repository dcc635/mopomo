from django.conf.urls import patterns, include, url
from mopomo_django.api import TimerResource

from django.contrib import admin
admin.autodiscover()

timer_resource = TimerResource()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'mopomo_django.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^api/', include(timer_resource.urls)),
    url(r'^admin/', include(admin.site.urls)),
)
