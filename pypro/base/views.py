from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt


# Create your views here.

def home(request):
    return HttpResponse("Hello, world. You're at the polls page.")


@csrf_exempt
def debug(request):
    headers = dict(request.headers)
    headers['request.host'] = request.get_host()
    headers['secure'] = request.is_secure()
    return JsonResponse(headers)
