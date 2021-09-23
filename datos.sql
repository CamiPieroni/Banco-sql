USE banco;

# Inserto 2 ciudades Buenos Aires, Bahia Blanca

INSERT INTO ciudad(cod_postal,Nombre) VALUES (1000, 'Buenos Aires');
INSERT INTO ciudad(cod_postal,Nombre) VALUES (8000, 'Bahia Blanca'); 

# Inserto 2 Sucursales, ciudad: Buenos Aires
INSERT INTO sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
    VALUES (1,'Suc4-BA', 'Dir Suc1-BA', '1111111111', 'lu. a vi. de 10 a 15 hs.', 1000); 
INSERT INTO sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
    VALUES (2,'Suc5-BA', 'Dir Suc2-BA', '2222222222', 'lu. a vi. de 10 a 15 hs.', 1000); 

# Inserto 3 Sucursales, ciudad: Bahia Blanca
INSERT INTO sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal)
    VALUES (3,'Suc3-BB', 'Dir Suc3-BB', '3333333333', 'lu. a vi. de 10 a 15 hs.', 8000); 
INSERT INTO sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
    VALUES (4,'Suc4-BB', 'Dir Suc4-BB', '4444444444', 'lu. a vi. de 10 a 15 hs.', 8000); 
INSERT INTO sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
    VALUES (5,'Suc5-BB', 'Dir Suc4-BB', '5555555555', 'lu. a vi. de 10 a 15 hs.', 8000);  

# Inserto Empleados: empleado legajo=X, documento=XX, sucursal=X

INSERT INTO empleado(legajo, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) 
    VALUES (1, 'Nombre_Emp1', 'Apellido_Emp1', 'DNI', 11, 'Dir_Emp1', '0111111111', 'Gerente', md5('emp1'), 1);
INSERT INTO empleado(legajo, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) 
    VALUES (2, 'Nombre_Emp2', 'Apellido_Emp2', 'DNI', 22, 'Dir_Emp2', '0222222222', 'Cajero', md5('emp2'), 2);
INSERT INTO empleado(legajo, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) 
    VALUES (3, 'Nombre_Emp3', 'Apellido_Emp3', 'DNI', 33, 'Dir_Emp3', '0333333333', 'Cajero', md5('emp3'), 3);
INSERT INTO empleado(legajo, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) 
    VALUES (4, 'Nombre_Emp4', 'Apellido_Emp4', 'DNI', 44, 'Dir_Emp4', '0444444444', 'Gerente', md5('emp4'), 4);
INSERT INTO empleado(legajo, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, cargo, password, nro_suc) 
    VALUES (5, 'Nombre_Emp5', 'Apellido_Emp5', 'DNI', 55, 'Dir_Emp5', '0555555555', 'Cajero', md5('emp5'), 5);

# Inserto Clientes 
 
INSERT INTO cliente(nro_cliente, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, fecha_nac) 
    VALUES (1, 'Nombre_Cli1', 'Apellido_Cli1', 'DNI', 11111111, 'Dir_Cli1', '0011111111', '1981-01-01');
INSERT INTO cliente(nro_cliente, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, fecha_nac) 
    VALUES (2, 'Nombre_Cli2', 'Apellido_Cli2', 'DNI', 22222222, 'Dir_Cli2', '0022222222', '1982-02-02');
INSERT INTO cliente(nro_cliente, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, fecha_nac) 
    VALUES (3, 'Nombre_Cli3', 'Apellido_Cli3', 'DNI', 33333333, 'Dir_Cli3', '0033333333', '1983-03-03');
INSERT INTO cliente(nro_cliente, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, fecha_nac) 
    VALUES (4, 'Nombre_Cli4', 'Apellido_Cli4', 'DNI', 44444444, 'Dir_Cli4', '0044444444', '1984-04-04');
INSERT INTO cliente(nro_cliente, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, fecha_nac) 
    VALUES (5, 'Nombre_Cli5', 'Apellido_Cli5', 'DNI', 55555555, 'Dir_Cli5', '0055555555', '1985-05-05');
INSERT INTO cliente(nro_cliente, nombre, apellido, tipo_doc, nro_doc, direccion, telefono, fecha_nac) 
    VALUES (6, 'Nombre_Cli6', 'Apellido_Cli6', 'DNI', 66666666, 'Dir_Cli6', '0066666666', '1986-06-06');


# prestamos del cliente 1 (y empleado 1)
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente) 
    VALUES (1, '2020-6-6', 6, 2000, 17, 0, 0, 1, 1);  # esta pago
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota,legajo, nro_cliente) 
    VALUES (2, '2021-4-4', 6, 9000, 20, 0, 0, 1, 1);  # moroso

# prestamos del cliente 2 (y empleado 2)
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota,legajo, nro_cliente)
    VALUES (3, '2020-4-4', 6, 5000, 20, 0, 0, 2, 2);   # esta pago
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota,legajo, nro_cliente)
    VALUES (4, '2021-4-5', 6, 20000, 24, 0, 0, 2, 2); # moroso

# prestamos del cliente 3 (y empleado 3)
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente)
    VALUES (5, '2015-9-9', 6, 20000, 24, 0, 0, 3, 3); # esta pagado
INSERT INTO prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente)
    VALUES (6, '2021-9-20', 6, 1000, 17, 0, 0, 3, 3); # cuotas impagas, pero al dia

#Corrigo los valor_couta e intereses  de cada prestamo
UPDATE prestamo set interes=(monto * tasa_interes * cant_meses)/1200; 
UPDATE prestamo set valor_cuota=(monto+interes)/cant_meses;

# Pagos

# Prestamo 1 (esta pagado)
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (1, 1, '2020-7-6', '2020-7-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (1, 2, '2020-8-6', '2020-8-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (1, 3, '2020-9-6', '2020-9-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (1, 4, '2020-10-6', '2020-10-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (1, 5, '2020-11-6', '2020-11-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (1, 6, '2020-12-6', '2020-12-4'); 

# Prestamo 2 (couta 4 y 5 vencida, cuota 6 impaga)
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (2, 1, '2021-5-4', '2021-5-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (2, 2, '2021-6-4', '2021-6-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (2, 3, '2021-7-4', '2021-7-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (2, 4, '2021-8-4', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (2, 5, '2021-9-4', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (2, 6, '2021-10-4', NULL); 

# Prestamo 3 (esta pagado)
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (3, 1, '2020-5-4', '2020-5-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (3, 2, '2020-6-4', '2020-6-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (3, 3, '2020-7-4', '2020-7-4'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (3, 4, '2020-8-4', '2020-8-6'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (3, 5, '2020-9-4', '2020-9-6'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (3, 6, '2020-10-4', '2020-10-6'); 

# Prestamo 4 (tiene la cuota 6 impaga)
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (4, 1, '2021-5-5', '2021-5-5'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (4, 2, '2021-6-5', '2021-6-5'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (4, 3, '2021-7-5', '2021-7-5'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (4, 4, '2021-8-5', '2021-8-5'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (4, 5, '2021-9-5', '2021-9-5'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (4, 6, '2021-10-5', NULL); 

# Prestamo 5 (esta pagado)
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (5, 1, '2015-10-9', '2015-10-9'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (5, 2, '2015-11-9', '2015-11-9'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (5, 3, '2015-12-9', '2015-12-9'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (5, 4, '2016-1-9', '2016-1-9'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (5, 5, '2016-2-9', '2016-2-9'); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (5, 6, '2016-3-9', '2016-3-9'); 

# Prestamo 6 (tiene cuotas impagas, pero esta al día)
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (6, 1, '2021-10-20', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (6, 2, '2021-11-20', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (6, 3, '2021-12-20', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (6, 4, '2022-1-20', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (6, 5, '2022-2-20', NULL); 
INSERT INTO pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago) VALUES (6, 6, '2022-3-20', NULL); 

# Tasas Prestamos del enunciado 1
 
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (6,0,2999,17);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (6,3000,9999,20);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (6,10000,30000,24);  

INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (12,0,2999,18.5);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (12,3000,9999,21.5);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (12,10000,30000,25.5);    

INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (24,0,2999,20);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (24,3000,9999,23);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (24,10000,30000,27);  

INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (60,0,2999,25);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (60,3000,9999,28);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (60,10000,30000,32);  

INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (120,0,2999,30);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (120,3000,9999,33);  
INSERT INTO tasa_prestamo(periodo, monto_inf, monto_sup, tasa) VALUES (120,10000,30000,37);  

# Cajas de ahorro
 
INSERT INTO caja_ahorro(nro_ca,CBU, saldo) VALUES (1,111,1000);  
INSERT INTO caja_ahorro(nro_ca,CBU, saldo) VALUES (2,222,2000);  
INSERT INTO caja_ahorro(nro_ca,CBU, saldo) VALUES (3,333,3000);  
INSERT INTO caja_ahorro(nro_ca,CBU, saldo) VALUES (4,444,4000); 

# Caja 1 de cliente 1
INSERT INTO Cliente_CA(nro_cliente, nro_ca) VALUES (1,1);  
# Caja 2 de cliente 2 
INSERT INTO Cliente_CA(nro_cliente, nro_ca) VALUES (2,2); 
# Caja 3 de cliente 3 
INSERT INTO Cliente_CA(nro_cliente, nro_ca) VALUES (3,3);  
# Caja 4 de cliente 4,5 y 6
INSERT INTO Cliente_CA(nro_cliente, nro_ca) VALUES (4,4);  
INSERT INTO Cliente_CA(nro_cliente, nro_ca) VALUES (5,4);  
INSERT INTO Cliente_CA(nro_cliente, nro_ca) VALUES (6,4);  
 
# Tarjeta nro_tarjeta=X, pin=XXXX, nro_cliente=X, nro_caja=(segun cliente_CA)
 
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES(1,md5('1111'),md5('111'),'2025-6-6',1,1);
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES(2,md5('2222'),md5('222'),'2025-6-6',2,2);
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES(3,md5('3333'),md5('333'),'2025-6-6',3,3);
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES(4,md5('4444'),md5('444'),'2025-6-6',4,4);
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES(5,md5('5555'),md5('555'),'2025-6-6',5,4);
INSERT INTO tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
    VALUES(6,md5('6666'),md5('666'),'2025-6-6',6,4);


# cajas

# 7 Ventanillas, una por sucursal
INSERT INTO caja VALUES(1);
INSERT INTO caja VALUES(2);
INSERT INTO caja VALUES(3);
INSERT INTO caja VALUES(4);
INSERT INTO caja VALUES(5);

# 4 ATM
INSERT INTO caja VALUES(10);
INSERT INTO caja VALUES(11);
INSERT INTO caja VALUES(12);

# Ventanilla cod_caja=X, nro_suc=X
 
INSERT INTO ventanilla(cod_caja, nro_suc) VALUES(1,1);
INSERT INTO ventanilla(cod_caja, nro_suc) VALUES(2,2);
INSERT INTO ventanilla(cod_caja, nro_suc) VALUES(3,3);
INSERT INTO ventanilla(cod_caja, nro_suc) VALUES(4,4);
INSERT INTO ventanilla(cod_caja, nro_suc) VALUES(5,5);

# ATMs de Bahia Blanca
INSERT INTO ATM(cod_caja, cod_postal, direccion) VALUES(10,8000,'Dir ATM 10-BB');
INSERT INTO ATM(cod_caja, cod_postal, direccion) VALUES(11,8000,'Dir ATM 11-BB');
# ATMs de Buenos Aires
INSERT INTO ATM(cod_caja, cod_postal, direccion) VALUES(12,1000,'Dir ATM 12-BA');

# transacciones

# debito de 40p  caja ahorro 1 cliente 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto)
    VALUES(1001,'2020-11-1','00:00:00',40); 
INSERT INTO debito(nro_trans, descripcion, nro_cliente, nro_ca)
    VALUES(1001,'Pago Servicios',1,1); 

# deposito de 1000 caja = 2, caja_ahorro 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto)
    VALUES(1002,'2020-11-2','00:00:00',1000); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1002,2); 
INSERT INTO deposito(nro_trans, nro_ca) VALUES(1002,1);

# extracion por caja = 10 (ATM), caja_ahorro = 1, cliente 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto)
    VALUES(1003,'2020-11-3','00:00:00',100); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1003,10); 
INSERT INTO extraccion(nro_trans, nro_cliente, nro_ca) VALUES(1003,1,1);

# transferencia por caja = 11 (ATM), de la caja_ahorro 1 hacia la 2, cliente 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1004,'2020-11-4','00:00:00',500); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1004,11); 
INSERT INTO transferencia(nro_trans, nro_cliente, origen, destino) VALUES(1004,1,1,2); 

# deposito por caja= 3, caja_ahorro = 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1005,'2020-11-6','00:00:00',1000); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1005,3); 
INSERT INTO deposito(nro_trans, nro_ca) VALUES(1005,1);

# extraccion por caja 12 (ATM), caja_ahorro 1, cliente 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1006,'2020-11-7','00:00:00',300); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1006,12); 
INSERT INTO extraccion(nro_trans, nro_cliente, nro_ca) VALUES(1006,1,1);

# transferencia por caja = 13 (ATM), desde caja_ahorro 1  hacia 3, cliente 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1007,'2020-11-8','00:00:00',700); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1007,13); 
INSERT INTO transferencia(nro_trans, nro_cliente, origen, destino) VALUES(1007,1,1,3);

# debito caja_ahorro 1, cliente 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1008,'2020-11-9','00:00:00',60); 
INSERT INTO debito(nro_trans, descripcion, nro_cliente, nro_ca) 
VALUES(1008,'Varios',1,1); 

# deposito por caja =2, caja_ahorro 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1009,'2020-11-10','00:00:00',1003);
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1009,2);  
INSERT INTO deposito(nro_trans, nro_ca) VALUES(1009,1);

# extraccion por caja=10 (ATM) cliente 1, caja_ahorro 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1010,'2020-11-11','00:00:00',103); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1010,10);  
INSERT INTO extraccion(nro_trans, nro_cliente, nro_ca) VALUES(1010,1,1);

# debito cliente 1 , caja_ahorro=1
INSERT INTO transaccion(nro_trans, fecha, hora, monto)
    VALUES(1012,'2020-11-13','00:00:00',70.50); 
INSERT INTO debito(nro_trans, descripcion, nro_cliente, nro_ca) 
VALUES(1012,'Pago servicios',1,1); 

# deposito caja 2, caja_ahorro 1, 
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1012,'2020-11-14','00:00:00',1004); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1012,2);  
INSERT INTO deposito(nro_trans, nro_ca) VALUES(1012,1);

# extraccion del cliente 1, caja 12 (atm), caja_ahorro 1
INSERT INTO transaccion(nro_trans, fecha, hora, monto) 
    VALUES(1013,'2020-11-15','00:00:00',104); 
INSERT INTO transaccion_por_caja(nro_trans, cod_caja) VALUES(1013,12);  
INSERT INTO extraccion(nro_trans, nro_cliente, nro_ca) VALUES(1013,1,1);
