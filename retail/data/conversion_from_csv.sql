
--Создание изначальных таблиц для безопасного импортирования CSV данных.
--Все таблицы создаются с текстовыми полями, чтобы избежать ошибок при загрузке.

CREATE TABLE IF NOT EXISTS brands ( --Внизу предоставлена логика содержащаяся в таблице до импортирования.
    brand_id        TEXT, -- SERIAL PRIMARY KEY 
    brand_name      TEXT --VARCHAR(100) название бренда поставщика
);

CREATE TABLE IF NOT EXISTS shoe_models ( --Внизу предоставлена логика содержащаяся в таблице до импортирования.
    model_id             TEXT, -- SERIAL PRIMARY KEY 
    brand_id             TEXT REFERENCES brands(brand_id), -- INT NOT NULL REFERENCES brands(brand_id)
    model_name           TEXT, --VARCHAR(150) название модели обуви, составленное числовым и буквенным кодом или их кмбинацией
    category             TEXT, --VARCHAR(50) категория обуви, продающаяся в этот временной отрезок
    target_gender        TEXT, --VARCHAR(30) указание того, мужская, женская, детская или унисекс обувь 
    material             TEXT, --VARCHAR(100) материал, из которого изготовлена обувь, например кожа, синтетика, текстиль и т.д.
    color                TEXT, --VARCHAR(50) цвет обуви, например черный, белый, красный и т.д.
    unit_price           TEXT, --NUMERIC базовая цена модели обуви без учета скидок, например 1999.99
    season               TEXT, --VARCHAR(30) сезон, в который продается модель обуви, например весна-лето, осень-зима или всесезонная
    chestny_znak_code    TEXT  --VARCHAR(50) уникальный код модели обуви для системы Честный Знак
);

CREATE TABLE IF NOT EXISTS sales ( --Внизу предоставлена логика содержащаяся в таблице до импортирования.
    sale_id              TEXT, -- SERIAL PRIMARY KEY
    sale_datetime        TEXT, --TIMESTAMP NOT NULL
    model_id             TEXT REFERENCES shoe_models(model_id), -- INT NOT NULL REFERENCES shoe_models(model_id)
    shoe_size            TEXT, -- NUMERIC размер модели обуви, например 42.5
    quantity_sold        TEXT, --INT NOT NULL количество проданных единиц модели обуви 
    total_sale_amount    TEXT, --NUMERIC сумма продажи, например 1999.99 после вычета скидки
    discount_amount      TEXT, --NUMERIC сумма скидки
    store_name           TEXT, --VARCHAR(100) NOT NULL название торгового комплекса, где расположен магазин
    payment_method       TEXT, --VARCHAR(50) метод оплаты
    receipt_number       TEXT, --VARCHAR(100) номер чека
    cashier_id           TEXT, --VARCHAR(50)индетификатор кассира, который обработал продажу
    return_flag          TEXT  --BOOLEAN DEFAULT FALSE пометка, указывающая, была ли продажа возвращена (true/false)
);

--Загрузка данных из CSV файлов в созданные таблицы.

COPY brands (
    brand_id,
    brand_name
)
FROM '/data/brands.csv'
WITH (
    FORMAT csv, --указываем, что файл в формате CSV
    HEADER true --пропускаем первую строку с названиями столбцов
);


COPY shoe_models (
    model_id,             
    brand_id,            
    model_name,          
    category,           
    target_gender,       
    material,             
    color,          
    unit_price, 
    season,          
    chestny_znak_code           
)
FROM '/data/shoe_models.csv'
WITH (
    FORMAT csv, --указываем, что файл в формате CSV
    HEADER true --пропускаем первую строку с названиями столбцов
);


COPY sales (
    sale_id,             
    sale_datetime,       
    model_id,            
    shoe_size,           
    quantity_sold,       
    total_sale_amount,   
    discount_amount,     
    store_name,          
    payment_method,      
    receipt_number,      
    cashier_id,          
    return_flag
)
FROM '/data/sales.csv' 
WITH (
    FORMAT csv, --указываем, что файл в формате CSV
    HEADER true --пропускаем первую строку с названиями столбцов
);

--Псоле загрузки данных, необходимо изменить типы данных в таблицах на соответствующие, 
--чтобы обеспечить корректную работу с данными и выполнение запросов.

--Таблица содержащая бренды поставщиков обуви, с указанием их идентификатора и названия.
ALTER TABLE brands
ALTER COLUMN brand_id TYPE INTEGER USING brand_id::INTEGER,
ALTER COLUMN brand_name tYPE VARCHAR(100) USING brand_name::VARCHAR(100);

--Таблица содержащая модели обуви, с указанием их идентификатора, 
--бренда, названия, категории, целевой аудитории,
--материала, цвета, базовой цены, сезона продажи и 
--уникального кода для системы Честный Знак.
ALTER TABLE shoe_models
ALTER COLUMN model_id TYPE INTEGER USING model_id::INTEGER,
ALTER COLUMN brand_id TYPE INTEGER USING brand_id::INTEGER,
ALTER COLUMN model_name TYPE VARCHAR(150) USING model_name::VARCHAR(150),       
ALTER COLUMN category TYPE VARCHAR(50) USING category::VARCHAR(50),
ALTER COLUMN target_gender TYPE VARCHAR(30) USING target_gender::VARCHAR(30),
ALTER COLUMN material TYPE VARCHAR(100) USING material::VARCHAR(100),
ALTER COLUMN color TYPE VARCHAR(50) USING color::VARCHAR(50),
ALTER COLUMN unit_price TYPE NUMERIC(10,2) USING unit_price::NUMERIC(10,2),
ALTER COLUMN season TYPE VARCHAR(30) USING season::VARCHAR(30),
ALTER COLUMN chestny_znak_code TYPE VARCHAR(50) USING chestny_znak_code::VARCHAR(50);

--Таблица содержащая информацию о продажах обуви, с указанием идентификатора продажи,
--даты и времени продажи, модели обуви, размера, количества проданных единиц,
--суммы продажи, суммы скидки, названия торгового комплекса, метода оплаты,
--номера чека, идентификатора кассира и пометки о возврате.
ALTER TABLE sales
ALTER COLUMN sale_id TYPE INTEGER USING sale_id::INTEGER,
ALTER COLUMN sale_datetime TYPE TIMESTAMP USING sale_datetime::TIMESTAMP,
ALTER COLUMN model_id TYPE INTEGER USING model_id::INTEGER,         
ALTER COLUMN shoe_size TYPE NUMERIC(4,1) USING shoe_size::NUMERIC(4,1),
ALTER COLUMN quantity_sold TYPE INTEGER USING quantity_sold::INTEGER,
ALTER COLUMN total_sale_amount TYPE NUMERIC(12,2) USING total_sale_amount::NUMERIC(12,2),
ALTER COLUMN discount_amount TYPE NUMERIC(10,2) USING discount_amount::NUMERIC(10,2),
ALTER COLUMN store_name TYPE VARCHAR(100) USING store_name::VARCHAR(100),
ALTER COLUMN payment_method TYPE VARCHAR(50) USING payment_method::VARCHAR(50),
ALTER COLUMN receipt_number TYPE VARCHAR(100) USING receipt_number::VARCHAR(100),
ALTER COLUMN cashier_id TYPE VARCHAR(50) USING cashier_id::VARCHAR(50),
ALTER COLUMN return_flag TYPE BOOLEAN USING return_flag::BOOLEAN;
