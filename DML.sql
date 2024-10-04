USE pizza_planet;

INSERT INTO clientes (nombre) VALUES 
('Carlos'),
('juan'),
('mariana grande'),
('holis'),
('maria'),
('pedro');

INSERT INTO adiciones (adicion) VALUES 
('queso'),
('jamon'),
('papas'),
('picante'),
('chorizo');

INSERT INTO tipo_producto (tipo_producto) VALUES 
('heacho a mano'),
('se trae');

INSERT INTO ingredientes (ingrediente) VALUES 
('queso'),
('jamon'),
('sal'),
('azucar'),
('limon'),('pimienta'),
('salchica');

INSERT INTO tipo_pedido (tipo_pedido) VALUES 
('comer aqui'),
('llevar');

INSERT INTO dias_semana(dia_semana) VALUES 
('lunes'),
('martes'),
('miercoles'),
('jueves');

INSERT INTO productos(nombre, precio, id_tipo_producto) VALUES 
('panzerotti', "1000","1"),
('pizza', "2000","1"),
('salchipapa', "3000","1"),
('jugo de mama', "5000","2"),
('postre de agua', "6000","2"),
('delicate pan', "3000","2");


INSERT INTO dias_semana(dia_semana) VALUES 
('lunes'),
('martes'),
('miercoles'),
('jueves');

INSERT INTO combo(precio, nombre) VALUES 
('5000', "super"),
('5000', "jilomen"),
('5000', "kiko");

INSERT INTO combo_productos(id_combo, id_producto) VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 2),
(3, 6),
(3, 5),
(3, 4);

INSERT INTO pedidos(id_tipo_pedido, id_dia_semana, id_cliente) VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 2, 1),
(1, 2, 1),
(2, 2, 6),
(2, 2, 5),
(1, 2, 4),
(1, 3, 4),
(1, 3, 3),
(2, 3, 2),
(2, 4, 1),
(1, 4, 1),
(2, 4, 1);

INSERT INTO pedido_producto(id_pedido, id_producto) VALUES 
(1, 1),
(1, 3),
(1, 2),
(2, 3),
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(4, 4),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 2),
(12, 4),
(13, 1),
(14, 1),
(15, 4);