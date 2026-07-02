CREATE TRIGGER tg_limite_pasajeros
BEFORE INSERT ON pasajero
FOR EACH ROW
EXECUTE FUNCTION verificar_limite_pasajeros();