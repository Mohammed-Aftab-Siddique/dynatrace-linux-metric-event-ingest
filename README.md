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
   git clone https://github.com/Mohammed-Aftab-Siddique/dynatrace-linux-metric-event-ingest.git
   ```
2. Navigate to the cloned directory:
   ```bash
   cd dynatrace-linux-metric-event-ingest
   ```
3. Ensure that you have the necessary permissions to execute the script:
   ```bash
   chmod +x metric-event-ingest.sh
   ```
## Security Considerations
- Be aware of the sensitivity of the data being processed. Avoid exposing sensitive information in the output files.
- Run the script in a secure environment to prevent unauthorized access to the log files.

## Troubleshooting
- **Permission Denied**: Check that the script has appropriate execution permissions.

## Examples
To run the parser on a log file, use the following command:
```bash
./metric-event-ingest.sh
```

This command will process the specified log file and ingest an output to dynatrace.

## metric-event-ingest [v1]
- Initial Release

