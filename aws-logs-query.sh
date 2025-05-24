#!/bin/bash

query-id = $(aws logs start-query \
    --log-group-names <log-group-name> \
    --start-time <start-time> \
    --end-time <end-time> \
    --query-string "<query-string>")

# Wait for the query to complete
while true; do
    status=$(aws logs get-query-results --query-id $query-id --query 'status' --output text)
    if [ "$status" == "Complete" ]; then
        break
    elif [ "$status" == "Failed" ]; then
        echo "Query failed"
        exit 1
    fi
    sleep 1
done

# Get the query results
results=$(aws logs get-query-results --query-id $query-id)
# Process the results
echo $results | jq -r '.results[] | map(.value) | @csv' | while IFS=',' read -r field1 field2 field3; do
    # Do something with each field
    echo "Field 1: $field1"
    echo "Field 2: $field2"
    echo "Field 3: $field3"
done
