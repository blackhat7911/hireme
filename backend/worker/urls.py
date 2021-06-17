from django.urls import path
from worker.views import WorkerList, WorkerDetailView

urlpatterns = [
    path('', WorkerList.as_view(), name="worker"),
    path('<int:pk>/', WorkerDetailView.as_view(), name="worker_details")
]
