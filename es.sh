#!/usr/bin/sh

term=${1:-knowledge}

gen_data()
{
cat <<EOF
{
    "query": {
        "query_string": {
            "query": "$term",
            "default_field": "description"
        }
    }
}
EOF
} 


curl "http://localhost:9200/get-together/_search" -d "$(gen_data)"

echo
echo "term: $term"
