
-- 003_crea_vista_sobrevivientes_por_clase.sql

 
SET search_path TO titanic;
 
CREATE OR REPLACE VIEW vista_sobrevivientes_por_clase AS
SELECT
    c.descripcion_clase                                   AS descripcion_clase,
    COUNT(p.passengerid)                                   AS total_pasajeros,
    COUNT(p.passengerid) FILTER (WHERE p.sobrevivio)        AS total_sobrevivientes
FROM clase c
LEFT JOIN pasajero p ON p.clase = c.clase
GROUP BY c.clase, c.descripcion_clase
ORDER BY c.clase;
 
INSERT INTO schema_migrations (version) VALUES ('003-crea-vista-sobrevivientes-por-clase');
 