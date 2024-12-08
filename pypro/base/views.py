from django.http import HttpResponse, JsonResponse


# Create your views here.

def home(request):
    return HttpResponse("Hello, world. You're at the polls page.")


def debug(request):
    return JsonResponse(request.headers)
