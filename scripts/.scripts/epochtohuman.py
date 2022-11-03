#!/usr/bin/env python
import sys
import json
import humanize
from datetime import datetime, timezone

input_timestamp = sys.argv[1]
gmt_time = ""
my_time = ""
if len(input_timestamp) == 13:
    timestamp = float(input_timestamp)/1000
    my_time = datetime.fromtimestamp(timestamp).strftime("%d-%m-%Y %H:%M:%S.%f")[:-3]
    gmt_time = datetime.fromtimestamp(timestamp, timezone.utc).strftime("%d-%m-%Y %H:%M:%S.%f")[:-3]
elif len(input_timestamp) <= 10:
    timestamp = float(input_timestamp)
    my_time = datetime.fromtimestamp(timestamp).strftime("%d-%m-%Y %H:%M:%S")
    gmt_time = datetime.fromtimestamp(timestamp, timezone.utc).strftime("%d-%m-%Y %H:%M:%S")


relative_time = humanize.naturaltime(datetime.now() - datetime.fromtimestamp(timestamp))

response = {
    'gmt': gmt_time,
    'my_time_zone': my_time,
    'relative': relative_time
}

print(json.dumps(response, indent=2))
