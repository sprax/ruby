#!/usr/local/bin/bash
# See: https://stackoverflow.com/questions/17029902/using-curl-post-with-variables-defined-in-bash-script-functions

query_type=simple_query_string
query_term=${1:-"from Denver"}
def_field1=${2:-description}
def_field2=${3:-name}
def_operat=${4:-AND}
analyzer_1=${5:-standard}

gen_data()
{
cat <<EOF
{
  "query": {
    "$query_type" : {
        "query": "+($query_term | search) -frittata",
        "fields": ["$def_field1", "$def_field2"],
        "default_operator": "and",
        "analyzer": "$analyzer_1"
    }
  }
}
EOF
} 

curl "http://localhost:9200/get-together/_search" -d "$(gen_data)"

echo
echo "query_type: $query_type"
echo "query_term: $query_term"
echo "def_field1: $def_field1"
echo "def_field2: $def_field2"
echo "flags used: $multi_flag"

