-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';

-- DROP SEQUENCE public.stock_data_id_seq;

CREATE SEQUENCE public.stock_data_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.symbols_id_seq;

CREATE SEQUENCE public.symbols_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.symbols definition

-- Drop table

-- DROP TABLE public.symbols;

CREATE TABLE public.symbols (
	id serial4 NOT NULL,
	symbol varchar(10) NOT NULL,
	"name" varchar(255) NULL,
	exchange varchar(50) NULL,
	asset_type varchar(50) NULL,
	sector varchar(255) NULL,
	CONSTRAINT symbols_pkey PRIMARY KEY (id),
	CONSTRAINT symbols_symbol_key UNIQUE (symbol)
);


-- public.stock_data definition

-- Drop table

-- DROP TABLE public.stock_data;

CREATE TABLE public.stock_data (
	id serial4 NOT NULL,
	symbol_id int4 NULL,
	"date" date NULL,
	"open" numeric NULL,
	high numeric NULL,
	low numeric NULL,
	"close" numeric NULL,
	volume numeric NULL,
	CONSTRAINT stock_data_pkey PRIMARY KEY (id),
	CONSTRAINT fk_symbol_id FOREIGN KEY (symbol_id) REFERENCES public.symbols(id),
	CONSTRAINT stock_data_symbol_id_fkey FOREIGN KEY (symbol_id) REFERENCES public.symbols(id)
);