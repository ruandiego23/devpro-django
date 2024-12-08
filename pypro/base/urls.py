from django.urls import path

from pypro.base import views

app_name = 'base'

urlpatterns = [
    path('', views.home, name='home'),
    path('debug/', views.debug, name='debug'),
]
