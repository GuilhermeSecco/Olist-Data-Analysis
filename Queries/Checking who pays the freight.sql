SELECT 
    i.order_id,
    SUM(i.price) as valor_produtos,
    SUM(i.freight_value) as valor_frete,
    p.payment_value as total_pago,
    CASE 
        WHEN p.payment_value >= (SUM(i.price) + SUM(i.freight_value)) or (p.payment_value - (SUM(i.price) + SUM(i.freight_value))) < 0.1 THEN 'Cliente pagou tudo'
        WHEN p.payment_value < (SUM(i.price) + SUM(i.freight_value)) AND p.payment_value >= SUM(i.price) THEN 'Frete parcialmente subsidiado'
        ELSE 'Vendedor absorveu parte do preço'
    END as politica_comercial
FROM order_items i
JOIN order_payment p ON i.order_id = p.order_id
GROUP BY i.order_id, p.payment_value;