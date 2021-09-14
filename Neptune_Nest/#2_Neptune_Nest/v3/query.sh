curl -s http://localhost:8182/sparql \
            -d "@$1" \
            -H "Content-type: application/sparql-query" -H "Accept: text/csv"
