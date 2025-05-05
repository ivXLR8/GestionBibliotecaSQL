CREATE DEFINER=`root`@`localhost` FUNCTION `MENSAJE_SANCION`(CODIGO INT, NOM_COMPL VARCHAR (100), FECHA_PRES  DATE, DIAS_PENA INTEGER, ESTADO VARCHAR (10)) RETURNS varchar(300) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
BEGIN
    
	DECLARE MSG VARCHAR (300);
    
    IF (ESTADO = 'ACTIVO') THEN 
		SET MSG= 'Sin sanciones';
	ELSEIF (ESTADO = 'GRAVE') THEN
		SET MSG = CONCAT('Estimado usuario ', NOM_COMPL,', el pasado día ',FECHA_PRES,' realizó un prestamo en nuestra biblioteca
		con código ',CODIGO,' y ha superado la fecha de entrega prevista en ',DIAS_PENA,' dias , por lo que le corresponde una sancion ',ESTADO);
	ELSEIF (ESTADO = 'MUY GRAVE') THEN
		SET MSG = CONCAT('Estimado usuario ', NOM_COMPL,', el pasado día ',FECHA_PRES,' realizó un prestamo en nuestra biblioteca
		con código ',CODIGO,' y ha superado la fecha de entrega prevista en ',DIAS_PENA,' dias , por lo que le corresponde una sancion ',ESTADO);
	else
		SET MSG = 'ERROR';
	END IF;
 
RETURN MSG;
END