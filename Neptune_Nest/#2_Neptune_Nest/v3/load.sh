#!/bin/bash

echo "Loading edges..."
curl http://localhost:8182/sparql -d "@air-routes-edges.su" -H "Content-type: application/sparql-update"

echo "Loading nodes..."
curl http://localhost:8182/sparql -d "@air-routes-nodes.su" -H "Content-type: application/sparql-update"

echo "All done"
