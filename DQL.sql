Use pizza_planet;

-- Productos más vendidos (pizza, panzarottis, bebidas, etc.)
SELECT pr.nombre AS producto, 
       COUNT(pp.id_producto) AS cantidad_vendida
FROM pedido_producto pp
JOIN productos pr ON pp.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY cantidad_vendida DESC;
-- en esta consulta se contaron la tabla que estaba conectada que era de muchos a muchos especialida para esta relacion, y se comparo para
 -- que los productos fueran mas vendidos.

-- Promedio de precios de productos
SELECT AVG(pr.precio) AS promedio_precios_brrrr
FROM productos pr;

-----------------------------------
-- Promedio de pizzas pedidas por cliente
SELECT c.nombre AS cliente, 
       COUNT(pp.id_producto) / COUNT(DISTINCT p.id_pedido) AS promedio_pizzas
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN pedido_producto pp ON p.id_pedido = pp.id_pedido
JOIN productos pr ON pp.id_producto = pr.id_producto
WHERE pr.nombre = 'pizza'
GROUP BY c.id_cliente;

-- Total de ventas por día de la semana
SELECT ds.dia_semana, 
       COUNT(p.id_pedido) AS total_ventas
FROM pedidos p
JOIN dias_semana ds ON p.id_dia_semana = ds.id_dia_semana
GROUP BY ds.id_dia_semana, ds.dia_semana
ORDER BY ds.id_dia_semana;

-- Cantidad de panzarottis vendidos con extra queso
SELECT COUNT(pap.id_pedido) AS panzerrotiss_con_quesoo
FROM pedidos_adiciones_productos pap
JOIN productos pr ON pap.id_producto = pr.id_producto
JOIN adiciones a ON pap.id_adicion = a.id_adicion
WHERE pr.nombre = 'panzerotti' AND a.adicion = 'queso';

-- Día de la semana con mayor número de pedidos para recoger
SELECT ds.dia_semana, 
       COUNT(p.id_pedido) AS total_pedidos
FROM pedidos p
JOIN dias_semana ds ON p.id_dia_semana = ds.id_dia_semana
JOIN tipo_pedido tp ON p.id_tipo_pedido = tp.id_tipo_pedido
WHERE tp.tipo_pedido = 'llevar'
GROUP BY ds.id_dia_semana, ds.dia_semana
ORDER BY total_pedidos DESC
LIMIT 1;

-- Clientes que han realizado más de 5 pedidos
SELECT c.id_cliente, 
       c.nombre, 
       COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(p.id_pedido) > 5
ORDER BY total_pedidos DESC;

-- Total de combos vendidos
SELECT COUNT(cp.id_combo) AS total_combos_vendidos
FROM combo_productos cp
JOIN pedidos p ON cp.id_combo = p.id_pedido;

-- Pedidos con más de 2 productos diferentes
SELECT pp.id_pedido, 
       COUNT(DISTINCT pp.id_producto) AS total_productes
FROM pedido_producto pp
GROUP BY pp.id_pedido
HAVING COUNT(DISTINCT pp.id_producto) > 2
ORDER BY total_productes DESC;
