CREATE DATABASE IF NOT EXISTS pizza_planet;

USE pizza_planet;


CREATE TABLE tipo_producto (
    id_tipo_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_producto VARCHAR(255)
);

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) UNIQUE,
    precio INT,
    id_tipo_producto INT NOT NULL,
    FOREIGN KEY (id_tipo_producto) REFERENCES tipo_producto(id_tipo_producto)
);

CREATE TABLE ingredientes (
    id_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ingrediente VARCHAR(255)
);

CREATE TABLE producto_ingrediente (
    id_ingrediente INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_ingrediente, id_producto),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE adiciones (
    id_adicion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adicion VARCHAR(255)
);

CREATE TABLE dias_semana (
    id_dia_semana INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(255)
);

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255)
);

CREATE TABLE pedidos (
    id_tipo_pedido INT NOT NULL,
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_dia_semana INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_dia_semana) REFERENCES dias_semana(id_dia_semana),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE pedido_producto (
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE clientes_pedidos (
    id_cliente INT NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_cliente, id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

CREATE TABLE pedidos_adiciones_productos (
    id_adicion INT NOT NULL,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_adicion, id_pedido, id_producto),
    FOREIGN KEY (id_adicion) REFERENCES adiciones(id_adicion),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE tipo_pedido (
    id_tipo_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_pedido VARCHAR(255)
);

CREATE TABLE ventas (
    id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    costo_total INT,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE combo (
    id_combo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    precio INT,
    nombre VARCHAR(255) UNIQUE
);

CREATE TABLE combo_productos (
    id_combo INT NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_combo, id_producto),
    FOREIGN KEY (id_combo) REFERENCES combo(id_combo),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
