CREATE TABLE IF NOT EXISTS public.hotel_room
(
    id serial,
    name character varying(100),
    price integer NOT NULL,
    CONSTRAINT hotel_room_pkey PRIMARY KEY (id)
);

INSERT INTO hotel_room (name, price) VALUES
('Номер 1', 1000),
('Номер 2', 1000),
('Номер 3', 1000),
('Номер 4', 1000),
('Номер 5', 1000);

CREATE TABLE IF NOT EXISTS public.sale
(
    id serial,
    days_count integer NOT NULL,
    sale integer NOT NULL,
    CONSTRAINT sale_pkey PRIMARY KEY (id)
);

INSERT INTO sale (days_count, sale) VALUES
(10, 10),
(20, 20);

CREATE TABLE IF NOT EXISTS public.booking
(
    id serial,
	hotel_room_id integer references hotel_room NOT NULL,
	start_date timestamp with time zone NOT NULL,
	end_date timestamp with time zone NOT NULL,
	price integer,
	sale integer,
	total_price integer,
    CONSTRAINT booking_pkey PRIMARY KEY (id)
);