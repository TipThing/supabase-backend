\SET pguser `echo "$POSTGRES_USER"`

CREATE SCHEMA IF NOT EXISTS _analytics;
ALTER SCHEMA _analytics OWNER TO :pguser;