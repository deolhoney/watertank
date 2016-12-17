from django.conf.urls import url

from . import views

from django.views.generic import TemplateView

urlpatterns = [
    #directs to index veiw
    url(r'$', views.index, name='index'),
    url(r'^specs/$', views.specs, name='specs'),
    url(r'^download/$', views.download, name='download')
]
