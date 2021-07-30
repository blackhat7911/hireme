from django.urls import path
from accounts.views import *

urlpatterns = [
    path('user/', UserView.as_view(), name='accounts'),
    path('user/<int:pk>/', UserDetailView.as_view(), name='accounts'),
    path('', AccountView.as_view(), name='accounts'),
    path('<int:pk>/', AccountDetailView.as_view(), name='accounts'),
   
]