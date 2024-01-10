SELECT
    Cruise.id AS cruise_id,
    Ferry.name AS ferry_name,
    Port_departure.name AS departure_port_name,
    Port_departure.address AS departure_port_address,
    Port_arrival.name AS arrival_port_name,
    Port_arrival.address AS arrival_port_address
FROM
    Cruise
JOIN
    Ferry ON Cruise.ferry_id = Ferry.id
JOIN
    Port AS Port_departure ON Cruise.port_departure = Port_departure.id
JOIN
    Port AS Port_arrival ON Cruise.port_arrival = Port_arrival.id
WHERE
    Port_departure.name = 'Charleroix'
    AND Port_arrival.name = 'South Haven'
    AND Cruise.id IN (
        SELECT
            cruise_id
        FROM
            Services
        WHERE
            name = 'Cocktails'
    );