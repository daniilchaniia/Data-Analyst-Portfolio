CREATE TABLE IF NOT EXISTS user_events (
    event_id TEXT,
    user_id TEXT,
    event_type TEXT,
    event_date TEXT,
    product_id TEXT,
    amount TEXT,
    traffic_source TEXT
);

COPY user_events (
    event_id,
    user_id,
    event_type,
    event_date,
    product_id,
    amount,
    traffic_source
)
FROM '/data/user_events.csv'
WITH (
    FORMAT csv,
    HEADER true
);

ALTER TABLE user_events
    ALTER COLUMN event_id TYPE INTEGER USING event_id::INTEGER,
    ALTER COLUMN user_id TYPE INTEGER USING user_id::INTEGER,
    ALTER COLUMN product_id TYPE INTEGER USING product_id::INTEGER,
    ALTER COLUMN amount TYPE NUMERIC(12,2) USING NULLIF(amount, '')::NUMERIC(12,2),
    ALTER COLUMN event_date TYPE TIMESTAMP USING event_date::TIMESTAMP;
