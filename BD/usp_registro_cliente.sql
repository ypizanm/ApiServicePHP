CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registro_cliente`(
	
    p_paterno varchar(25),
    p_materno varchar(25),
    p_nombre varchar(30),
    p_dni char(8),
    p_ciudad varchar(30),
    p_direccion varchar(50)
)
BEGIN

	DECLARE cont int;
    
	-- Iniciar Transacción
	start transaction;
    
    
    -- get clieCodigo to assign
    -- SELECT SQL_CALC_FOUND_ROWS * FROM cliente ;
	-- SET cont = FOUND_ROWS();
    -- set cont = LPAD(cont+1, 5, '0');
    select chr_cliecodigo into cont from cliente order by chr_cliecodigo desc limit 1;
	
    
    -- Registrar el cliente		
	insert into cliente(chr_cliecodigo,vch_cliepaterno,vch_cliematerno,vch_clienombre,chr_cliedni,vch_clieciudad,vch_cliedireccion)
		values(cont+1,p_paterno,p_materno,p_nombre,p_dni,p_ciudad,p_direccion);
    
    
    -- Confirma Transacción
	commit;

	-- Retorna el estado
	select 1 as state, 'Cliente registrado' as message;
END