SELECT 
    acquiring.name AS acquiruing_name,
    acq.price_amount,
    acquired.name AS acquired_name,
    acquired.funding_total,
    ROUND(acq.price_amount / acquired.funding_total, 0)
FROM acquisition AS acq
JOIN company AS acquiring ON acq.acquiring_company_id = acquiring.id
JOIN company AS acquired ON acq.acquired_company_id = acquired.id
WHERE acq.price_amount <> 0
      AND acquired.funding_total <> 0
ORDER BY price_amount DESC,
         acquired_name
LIMIT 10