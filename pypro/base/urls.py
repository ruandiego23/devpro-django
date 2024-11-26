from django.contrib import admin
from django.urls import path

from pypro.base import views

app_name = 'base'

urlpatterns = [
    path('', views.home, name='home'),
]
