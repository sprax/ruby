#!/usr/bin/sh

curl "http://localhost:9200/get-together/_search" -d'
{
    "query": {
        "query_string": {
            "query": "elasticsearch hadoop knowledge", "default_field": "description"
        }
    }
}' 

