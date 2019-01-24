# Elasticsearch Curator


## Environment vars needed

RETENTION_DAYS = Curator will delete indexes older than these amount of days. (11 days in dev / 15 days in prod)
CURATOR_LOGIN = AWS SSM parameter name for the SecureString (sms:///elk/curator/pass) format user:password


Curator deletes indices older than X day (configured in action-file.yml in EFS).

Use -e -e DRYRUN=--dry-run to run in dry mode (no modifications)

Mount config folder in /curatorcfg to have

Config file in /curatorcfg/config.yml
Action file in /curatorcfg/action-file.yml


Have fun!
