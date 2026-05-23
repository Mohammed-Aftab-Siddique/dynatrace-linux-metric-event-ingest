#!/bin/bash

TOKEN="<Access Token>"

CONFIG="<Resolution or Timeframe or ManagementZone or EntitySelector>"

QUERY='<The query to fetch a metric value from dynatrace>'

ME_QUERY='<The query that is used in the metric event>'

# Get metric value
value=$(curl -s -X GET \
"https://<DNS>/e/<Env-ID>/api/v2/metrics/query?metricSelector=$QUERY$CONFIG" \
-H "Authorization: Api-Token $TOKEN" \
| jq -r '.result[0].data[0].values[0]')

value=${value:-<Default Value>}

echo "Metric value: $value"

# Get latest update token
settings=$(curl 'https://<DNS>/e/<Env-ID>/api/v2/settings/objects/<Object-ID>' \
-X GET \
-H 'Accept: application/json; charset=utf-8' \
-H 'Content-Type: application/json; charset=utf-8' \
-H "Authorization: Api-Token $TOKEN")

updateToken=$(echo "$settings" | jq -r '.updateToken')

echo "Update token: $updateToken"

# PUT update
curl 'https://<DNS>/e/<Env-ID>/api/v2/settings/objects/<Object-ID>' \
-X PUT \
-H 'Accept: application/json; charset=utf-8' \
-H 'Content-Type: application/json; charset=utf-8' \
-H 'Authorization: Api-Token '"$TOKEN" \
-d $'{
"schemaVersion":"1.0.19",
"updateToken":"'"$updateToken"'",
"value":{
"enabled":true,
"summary":"<Summary>",
"queryDefinition":{
"type":"METRIC_SELECTOR",
"metricSelector":"'"$ME_QUERY"'",
"managementZone":"<MZ-ID>",
"queryOffset":null
},
"modelProperties":{
"type":"STATIC_THRESHOLD",
"threshold":'"$value"',
"alertOnNoData":true,
"alertCondition":"BELOW",
"violatingSamples":3,
"samples":5,
"dealertingSamples":3
},
"eventTemplate":{
"title":"<Title>",
"description":"<Description>",
"eventType":"CUSTOM_ALERT",
"davisMerge":true,
"metadata":[<Metadata (if any)>]
},
"eventEntityDimensionKey":null,
"legacyId":null
}
}'
