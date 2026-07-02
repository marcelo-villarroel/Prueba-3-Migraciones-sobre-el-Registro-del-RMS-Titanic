SET search_path TO titanic;

CREATE OR REPLACE FUNCTION verificar_limite_pasajeros()
RETURNS TRIGGER AS $$
DECLARE
    total_pasajeros INT;
BEGIN

    SELECT COUNT(*) INTO total_pasajeros FROM pasajero;


    IF total_pasajeros >= 1309 THEN
        RAISE EXCEPTION 'No puedes registrar más pasajeros: ¡el ya Titanic zarpó en 1912!';
    END IF;


    RETURN NEW;
END;
$$ LANGUAGE plpgsql;