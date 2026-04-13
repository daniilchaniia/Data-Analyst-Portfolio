
--Создание изначальных таблиц для безопасного импортирования CSV данных.
--Все таблицы создаются с текстовыми полями, чтобы избежать ошибок при загрузке.

CREATE TABLE IF NOT EXISTS user_events ( --Внизу предоставлена логика содержащаяся в таблице до импортирования.
    event_id TEXT, -- SERIAL PRIMARY KEY
    user_id TEXT, -- INTEGER NOT NULL идентификатор пользователя, который совершил событие
    event_type TEXT, --VARCHAR(50) NOT NULL тип события (например, "purchase", "view", "click")
    event_date TEXT, --TIMESTAMP NOT NULL дата и время события
    product_id TEXT, --INTEGER NOT NULL идентификатор продукта, связанного с событием
    amount TEXT, --NUMERIC(12,2) сумма, связанная с событием (например, стоимость покупки)
    traffic_source TEXT --VARCHAR(100) источник трафика, откуда пришел пользователь (например, "organic", "paid", "referral")
);

--Загрузка данных из CSV файлов в созданные таблицы.

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
    FORMAT csv, --указываем, что файл в формате CSV
    HEADER true --пропускаем первую строку с названиями столбцов
);

--После загрузки данных, необходимо изменить типы данных в таблице на соответствующие,
--чтобы обеспечить корректную работу с данными и выполнение запросов.
ALTER TABLE user_events
    ALTER COLUMN event_id TYPE INTEGER USING event_id::INTEGER,
    ALTER COLUMN user_id TYPE INTEGER USING user_id::INTEGER,
    ALTER COLUMN product_id TYPE INTEGER USING product_id::INTEGER,
    ALTER COLUMN amount TYPE NUMERIC(12,2) USING NULLIF(amount, '')::NUMERIC(12,2),
    ALTER COLUMN event_date TYPE TIMESTAMP USING event_date::TIMESTAMP;
