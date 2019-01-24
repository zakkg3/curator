# Elasticsearch Curator

Here you have:

Curator Dockerfile with ssm-env, to fetch secure strings form paramter storage.


## Environment vars needed

RETENTION_DAYS = Curator will delete indexes older than these amount of days. (11 days in dev / 15 days in prod)

CURATOR_LOGIN = user:password or the AWS SSM parameter name (starting with "ssm://") for the SecureString (ssm:///your//path/to/curator/pass)

DRYRUN=--dry-run to run in dry mode (no modifications).

Curator deletes indices older than X ($RETENTION_DAYS) day (configured in action-file.yml).

## Custom Configs

Mount your own config folder in /curatorcfg to have

Config file in /curatorcfg/config.yml
Action file in /curatorcfg/action-file.yml


Have fun!
