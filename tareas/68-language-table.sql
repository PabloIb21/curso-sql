

-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
SELECT * FROM language;

INSERT INTO
    "language" (name)
SELECT
    DISTINCT "language"
from
    countrylanguage
ORDER BY
    "language";

SELECT
    "language",
    (
        select
            code
        from
            "language" b
        where
            a.language = b.name
    )
FROM
    countrylanguage a;

-- Actualizar todos los registros
UPDATE
    countrylanguage a
SET
    languagecode = (
        select
            code
        from
            "language" b
        where
            a.language = b.name
    );

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
ALTER TABLE
    countrylanguage
ALTER COLUMN
    languagecode TYPE int4 USING languagecode :: integer;

-- Crear el forening key y constraints de no nulo el language_code

-- Revisar lo creado
select * from countrylanguage;