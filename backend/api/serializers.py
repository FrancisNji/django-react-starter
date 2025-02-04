from rest_framework import serializers
from .models import Query



class QuerySeriazlier(serializers.ModelSerializer):        
    class Meta:
        model = Query 
        # fields = "__all__"
        fields = ["id","variable","startDateTime","endDateTime","temporalLevel","north","south","east","west","created_at", "aggLevel",]

class TimeSeriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Query
        fields = ["id","variable","startDateTime","endDateTime","temporalLevel","north","south","east","west","created_at", "aggLevel", "secondAgg",]

class FindTimeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Query
        fields = ["id", "variable", "startDateTime", "endDateTime", "temporalLevel", "north", "south", "east", "west", "created_at", "aggLevel", "secondAgg", "filterPredicate", "filterValue"]