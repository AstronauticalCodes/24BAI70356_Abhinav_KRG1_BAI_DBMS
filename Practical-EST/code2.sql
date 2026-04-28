CREATE OR REPLACE PROCEDURE swap_supplier_cities(id1 INT, id2 INT)
LANGUAGE plpgsql
AS $$
BEGIN
    WITH city_data AS (
        SELECT 
            (SELECT city FROM Tbl_Suppliers WHERE sup_id = id1) AS city1,
            (SELECT city FROM Tbl_Suppliers WHERE sup_id = id2) AS city2
    )
    UPDATE Tbl_Suppliers
    SET city = CASE 
        WHEN sup_id = id1 THEN (SELECT city2 FROM city_data)
        WHEN sup_id = id2 THEN (SELECT city1 FROM city_data)
    END
    WHERE sup_id IN (id1, id2);

    IF NOT FOUND THEN
        RAISE EXCEPTION 'One or both Supplier IDs (%) and (%) were not found.', id1, id2;
    END IF;

    COMMIT;
END;
$$;