curl -s http://localhost:8182/sparql?explain=dynamic \
            -d "@$1" \
            -H "Content-type: application/sparql-query" -H "Accept: text/plain" 
