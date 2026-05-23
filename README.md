# metric-event-ingest.sh Documentation

## Overview
The `metric-event-ingest` script is designed to update Dynatrace Metric Event through API. It is primarily made to periodically update one or more configuration(s) in the metric event.

## Configuration
To configure the script, you'll need to specify the following parameters:
- `TOKEN` - An access token is required with the following 5 priviledges (Metric Read & Write, Settings Read & Write and Metric Ingest).
- `CONFIG` - The config can be used to provide extra query params such as timeframe, resolution, etc. If none is needed, keep it empty.
- `QUERY` - Here goes the actual query which will be used to fetch any metric from Dynatrace UI (Multiple of such query can be added as per need).
- `ME_QUERY` - This is where the query used in the metric event needs to be provided.
- `value` - The result of the 'Query' is stored here (more can be added as per need).
- `settings` - The current setting of the metric event is fetched here.
- `updateToken` - From the 'settings' the updateToken is extracted as it changes after every revision.

Ensure that the configuration values follow the required format to avoid issues during execution.

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Mohammed-Aftab-Siddique/dynatrace-log-parser.git
   ```
2. Navigate to the cloned directory:
   ```bash
   cd dynatrace-log-parser
   ```
3. Ensure that you have the necessary permissions to execute the script:
   ```bash
   chmod +x log_parser_v1.sh
   ```
## Metric Overview
Metric Name:
 ```bash
   custom.log.error
   ```
Metric Dimensions:
 ```bash
   host, dir & service
   ```
Metric Value:
 ```bash
   status
   ```
## Security Considerations
- Be aware of the sensitivity of the log data being processed. Avoid exposing sensitive information in the output files.
- Run the script in a secure environment to prevent unauthorized access to the log files.

## Troubleshooting
- **Error: "Log file not found"**: Ensure that the `LOG_FILE` path is correct.
- **Permission Denied**: Check that the script has appropriate execution permissions.

## Examples
To run the parser on a log file, use the following command:
```bash
./log_parser_v1.sh
```

This command will process the specified log file and ingest an output to dynatrace.

## Sample Output
<img width="1944" height="1076" alt="image" src="https://github.com/user-attachments/assets/b4b49dac-f942-44e6-9aec-01cf1c70aed4" />

# Version History

# log_parser_v2
- Updated the logic to fetch the latest log file.
  - Added a check to use `ls` if the file count is less than `ARG_MAX` otherwise use `find`.
  - This avoids the failure due to `Too Many Arguments`.

## log_parser_v1
- Initial Release

