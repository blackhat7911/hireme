from django.urls import path
from seeker.views import SeekerList, SeekerDetailView

urlpatterns = [
    path('', SeekerList.as_view(), name="seeker"),
    path('<int:pk>/', SeekerDetailView.as_view(), name="seeker_details")
]
