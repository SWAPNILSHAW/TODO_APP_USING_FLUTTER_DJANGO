from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.views import View
from .models import Todo
from .serializers import TodoSerializer
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.generics import (
    ListCreateAPIView,
    RetrieveUpdateDestroyAPIView
    
)

class TodoListCreate(ListCreateAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer

class TodoDetail(RetrieveUpdateDestroyAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer