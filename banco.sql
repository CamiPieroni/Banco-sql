CREATE DATABASE banco;

USE banco;

drop user ''@'localhost';
drop user 'admin'@'localhost';
drop user 'empleado'@'%';
drop user 'atm'@'%';

CREATE TABLE Ciudad
(
	nombre VARCHAR(45) NOT NULL, 
	cod_postal SMALLINT(4) UNSIGNED ZEROFILL NOT NULL UNIQUE,
	
	CONSTRAINT digitos_codigo_postal
		CHECK(cod_postal between 1 and 9999),
	
	PRIMARY KEY (cod_postal)
) ENGINE=InnoDB;

CREATE TABLE Sucursal
(
	nro_suc	SMALLINT(3) UNSIGNED ZEROFILL NOT NULL UNIQUE AUTO_INCREMENT,
	nombre VARCHAR(45) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	telefono VARCHAR(45) NOT NULL,
	horario VARCHAR(45) NOT NULL,
	cod_postal SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Sucursal
	PRIMARY KEY (nro_suc),

	FOREIGN KEY(cod_postal) REFERENCES Ciudad(cod_postal)

)  ENGINE=InnoDB;

CREATE TABLE Empleado
(
	legajo SMALLINT(4) UNSIGNED ZEROFILL NOT NULL UNIQUE AUTO_INCREMENT,
	apellido VARCHAR(45) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	tipo_doc VARCHAR(20) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	telefono VARCHAR(45) NOT NULL,
	cargo VARCHAR(45) NOT NULL,
	password VARCHAR(32) NOT NULL,
	nro_doc INT(8) UNSIGNED ZEROFILL NOT NULL,
	nro_suc SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Empleado
	PRIMARY KEY (legajo),
	FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON DELETE RESTRICT ON UPDATE CASCADE
		
) ENGINE=InnoDB;

CREATE TABLE Cliente
(
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL UNIQUE AUTO_INCREMENT,
	apellido VARCHAR(45) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	tipo_doc VARCHAR(20) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	telefono VARCHAR(45) NOT NULL,
	nro_doc INT(8) UNSIGNED ZEROFILL NOT NULL,
	fecha_nac DATE NOT NULL,
	 
	CONSTRAINT PK_Cliente
	PRIMARY KEY (nro_cliente)
) ENGINE=InnoDB;

CREATE TABLE Plazo_Fijo
(
	nro_plazo INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	capital DECIMAL (16,2) UNSIGNED NOT NULL,
	tasa_interes DECIMAL (4,2) UNSIGNED NOT NULL,
	interes DECIMAL (16,2) UNSIGNED NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	nro_suc	SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Plazo_Fijo
	PRIMARY KEY (nro_plazo),
	FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Tasa_Plazo_Fijo
(
	periodo SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,
	montO_inf  DECIMAL (16,2) UNSIGNED NOT NULL,
	montO_sup DECIMAL (16,2) UNSIGNED NOT NULL,
	tasa DECIMAL (4,2) UNSIGNED NOT NULL,

	CONSTRAINT PK_Tasa_Plazo_Fijo
	PRIMARY KEY (periodo,montO_inf,montO_sup)
) ENGINE=InnoDB;

CREATE TABLE Plazo_Cliente
(
	nro_plazo INT(8) UNSIGNED ZEROFILL NOT NULL,
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Plazo_Cliente
	PRIMARY KEY (nro_plazo , nro_cliente),
	FOREIGN KEY (nro_plazo) REFERENCES Plazo_Fijo(nro_plazo)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON DELETE RESTRICT ON UPDATE CASCADE	
) ENGINE=InnoDB;

CREATE TABLE Prestamo
(
	nro_prestamo INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	fecha DATE NOT NULL,
	cant_meses TINYINT(2) UNSIGNED ZEROFILL NOT NULL,
	monto  DECIMAL(10,2) UNSIGNED NOT NULL,
	tasa_interes  DECIMAL (4,2) UNSIGNED NOT NULL,
	interes  DECIMAL (9,2) UNSIGNED NOT NULL,
	valor_cuota DECIMAL (9,2) UNSIGNED NOT NULL,
	legajo SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Prestamo
	PRIMARY KEY (nro_prestamo),
	FOREIGN KEY (legajo) REFERENCES Empleado(legajo)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON DELETE RESTRICT ON UPDATE CASCADE

)ENGINE=InnoDB;

CREATE TABLE Pago 
(
	nro_prestamo INT(8) UNSIGNED ZEROFILL NOT NULL,
	nro_pago INT(2) UNSIGNED ZEROFILL NOT NULL,
	fecha_venc DATE NOT NULL,
	fecha_pago DATE,

	CONSTRAINT PK_Pago
	PRIMARY KEY(nro_prestamo , nro_pago),
	FOREIGN KEY (nro_prestamo) REFERENCES Prestamo(nro_prestamo)
		ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Tasa_Prestamo
(
	periodo INT(3) UNSIGNED ZEROFILL NOT NULL,
	monto_inf  DECIMAL (10,2) UNSIGNED NOT NULL,
	monto_sup DECIMAL (10,2) UNSIGNED NOT NULL,
	tasa DECIMAL(4,2) UNSIGNED NOT NULL,

	CONSTRAINT PK_Tasa_Prestamo
	PRIMARY KEY (periodo,monto_inf,monto_sup)
) ENGINE=InnoDB;

CREATE TABLE Caja_Ahorro
(
	nro_ca INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	CBU BIGINT(18) UNSIGNED ZEROFILL NOT NULL,
	saldo DECIMAL(16,2) UNSIGNED NOT NULL,

	CONSTRAINT PK_Caja_Ahorro
	PRIMARY KEY(nro_ca)
) ENGINE=InnoDB;

CREATE TABLE Cliente_CA
(
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,
	nro_ca INT(8) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Cliente_CA
	PRIMARY KEY(nro_cliente , nro_ca),

	FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Tarjeta
(
	nro_tarjeta BIGINT(16) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	PIN VARCHAR(32) NOT NULL,
	CVT VARCHAR(32) NOT NULL,
	fecha_venc DATE NOT NULL,
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,
	nro_ca INT(8) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Tarjeta
	PRIMARY KEY(nro_tarjeta),

	FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Caja
(
	cod_caja INT(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	
	CONSTRAINT PK_Caja
	PRIMARY KEY (cod_caja)
) ENGINE=InnoDB;

CREATE TABLE Ventanilla
(
	cod_caja INT(5) UNSIGNED ZEROFILL NOT NULL,
	nro_suc SMALLINT(3) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Ventanilla
	PRIMARY KEY (cod_caja),
	FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ATM
(
	cod_caja INT(5) UNSIGNED ZEROFILL NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	cod_postal  SMALLINT(4) UNSIGNED ZEROFILL NOT NULL,

	FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
		ON DELETE CASCADE ON UPDATE CASCADE,
	
	CONSTRAINT PK_ATM
	PRIMARY KEY (cod_caja),

	FOREIGN KEY (cod_postal) REFERENCES Ciudad(cod_postal)
		ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Transaccion
(
	nro_trans INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	monto DECIMAL(16,2) UNSIGNED NOT NULL,

	CONSTRAINT PK_Transaccion
	PRIMARY KEY (nro_trans)

) ENGINE=InnoDB;


CREATE TABLE Debito
(
	nro_trans INT(10) UNSIGNED ZEROFILL NOT NULL,
	descripcion TINYTEXT,
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,
	nro_ca INT(8) UNSIGNED ZEROFILL NOT NULL,

	FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT PK_Debito
	PRIMARY KEY (nro_trans),

	FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Transaccion_por_caja
(
	nro_trans INT(10) UNSIGNED ZEROFILL NOT NULL,
	cod_caja INT(5) UNSIGNED ZEROFILL NOT NULL,

	CONSTRAINT PK_Transaccion_Por_Caja
	PRIMARY KEY (nro_trans),
	FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Deposito
(
	nro_trans INT(10) UNSIGNED ZEROFILL NOT NULL,
	nro_ca INT(8) UNSIGNED ZEROFILL NOT NULL,

	FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT PK_Deposito
	PRIMARY KEY (nro_trans),

	FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Extraccion
(
	nro_trans INT(10) UNSIGNED ZEROFILL NOT NULL,
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,
	nro_ca INT(8) UNSIGNED ZEROFILL NOT NULL,

	FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	
	CONSTRAINT PK_Extraccion
	PRIMARY KEY (nro_trans),

	FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Transferencia
(
	nro_trans INT(10) UNSIGNED ZEROFILL NOT NULL,
	nro_cliente INT(5) UNSIGNED ZEROFILL NOT NULL,
	origen INT(5) UNSIGNED ZEROFILL NOT NULL,
	destino INT(8) UNSIGNED ZEROFILL NOT NULL,

	FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT PK_Transferencia
	PRIMARY KEY (nro_trans),

	FOREIGN KEY (nro_cliente,origen) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (destino) REFERENCES Caja_Ahorro(nro_ca)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#USUARIOS

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

#empleado y privilegios
CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado';
GRANT SELECT ON  banco.Empleado TO 'empleado'@'%';
GRANT SELECT ON  banco.Sucursal TO 'empleado'@'%';
GRANT SELECT ON  banco.Tasa_Plazo_Fijo TO 'empleado'@'%';
GRANT SELECT ON  banco.Tasa_Prestamo TO 'empleado'@'%';

GRANT SELECT,INSERT ON  banco.Prestamo TO 'empleado'@'%';
GRANT SELECT,INSERT ON  banco.Plazo_Fijo TO 'empleado'@'%';
GRANT SELECT,INSERT ON  banco.Plazo_Cliente TO 'empleado'@'%';
GRANT SELECT,INSERT ON  banco.Caja_Ahorro TO 'empleado'@'%';
GRANT SELECT,INSERT ON  banco.Tarjeta TO 'empleado'@'%';

GRANT SELECT,INSERT,UPDATE ON  banco.Cliente_CA TO 'empleado'@'%';
GRANT SELECT,INSERT,UPDATE ON  banco.Cliente TO 'empleado'@'%';
GRANT SELECT,INSERT,UPDATE ON  banco.Pago TO 'empleado'@'%';


CREATE USER 'atm'@'%' IDENTIFIED BY 'atm';


CREATE VIEW trans_depo as 
SELECT ca.nro_ca , ca.saldo, t.nro_trans, t.fecha, t.hora, "Deposito" as tipo, t.monto , t_caja.cod_caja as cod_caja ,
			NULL as nro_cliente, NULL as tipo_doc, NULL as nro_doc, NULL as nombre, NULL as apellido, NULL as destino
    FROM (((Caja_Ahorro as ca JOIN Deposito as t_d ON ca.nro_ca=t_d.nro_ca)
   		JOIN Transaccion_por_caja AS t_caja ON t_caja.nro_trans=t_d.nro_trans)
   		JOIN Transaccion As t ON t.nro_trans=t_caja.nro_trans);

CREATE VIEW trans_ext as 
SELECT ca.nro_ca , ca.saldo, t.nro_trans, t.fecha, t.hora, "Extraccion" as tipo, t.monto , t_caja.cod_caja as cod_caja ,
			c.nro_cliente as nro_cliente, c.tipo_doc as tipo_doc, c.nro_doc as nro_doc, c.nombre as nombre, c.apellido as apellido, NULL as destino
   FROM ((((Caja_Ahorro as ca JOIN Extraccion as t_e ON ca.nro_ca=t_e.nro_ca)
   		JOIN Transaccion_por_caja AS t_caja ON t_caja.nro_trans=t_e.nro_trans)
   		JOIN Transaccion As t ON t.nro_trans=t_caja.nro_trans) JOIN Cliente as c ON c.nro_cliente=t_e.nro_cliente);

CREATE VIEW trans_deb as 
SELECT ca.nro_ca , ca.saldo, t.nro_trans, t.fecha, t.hora, "Debito" as tipo, t.monto , NULL as cod_caja,
			c.nro_cliente as nro_cliente, c.tipo_doc as tipo_doc, c.nro_doc as nro_doc, c.nombre as nombre, c.apellido as apellido, NULL as destino
   FROM (((Caja_Ahorro as ca JOIN Debito as t_deb ON ca.nro_ca=t_deb.nro_ca)
   		JOIN Transaccion As t ON t.nro_trans=t_deb.nro_trans) JOIN Cliente as c ON c.nro_cliente=t_deb.nro_cliente);

CREATE VIEW trans_trans as 
SELECT ca.nro_ca , ca.saldo, t.nro_trans, t.fecha, t.hora, "Transferencia" as tipo, t.monto , t_caja.cod_caja as cod_caja ,
			c.nro_cliente as nro_cliente, c.tipo_doc as tipo_doc, c.nro_doc as nro_doc, c.nombre as nombre, c.apellido as apellido, t_t.destino as destino
   FROM ((((Caja_Ahorro as ca JOIN Transferencia as t_t ON ca.nro_ca=t_t.origen)
   		JOIN Transaccion_por_caja AS t_caja ON t_caja.nro_trans=t_t.nro_trans)
   		JOIN Transaccion As t ON t.nro_trans=t_caja.nro_trans) JOIN Cliente as c ON c.nro_cliente=t_t.nro_cliente);
 
CREATE VIEW trans_cajas_ahorro as 
SELECT * FROM trans_depo UNION select * FROM trans_ext UNION select * FROM trans_deb UNION select * from trans_trans;

GRANT SELECT ON  banco.trans_cajas_ahorro TO 'atm'@'%';
GRANT SELECT , UPDATE ON banco.Tarjeta TO 'atm'@'%';	