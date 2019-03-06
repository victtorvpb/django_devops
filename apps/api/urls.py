from rest_framework import routers

from .api_views import PayloadApiView


app_name = "api"
router = routers.DefaultRouter()
router.register(r"v1/api", PayloadApiView, base_name="Payload")

urlpatterns = router.urls
