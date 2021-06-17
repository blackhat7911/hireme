from django.urls import path
from location.views import LocationList, LocationDetailView, MapGridList, MapGridDetailView

urlpatterns = [
    path('', LocationList.as_view(), name="locations"),
    path('<int:pk>/', LocationDetailView.as_view(), name="location_details"),
    path('map_grid/', MapGridList.as_view(), name="map_grid"),
    path('map_grid/<int:pk>/', MapGridDetailView.as_view(), name="map_grid_details"),
]
