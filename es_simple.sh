#!/usr/local/bin/bash
# See: https://stackoverflow.com/questions/17029902/using-curl-post-with-variables-defined-in-bash-script-functions

query_type="simple_query_string"
query_term=${1:-"Group of Clojure"}
def_field1=${2:-description}
def_field2=${3:-name}
multi_flag=${4:-"OR|AND|PREFIX"}


gen_data()
{
cat <<EOF
{
    "query": {
        "simple_query_string": {
            "query": "$query_term",
            "fields": ["$def_field1", "$def_field2"],
            "flags" : "$multi_flag"
        }
    },
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

