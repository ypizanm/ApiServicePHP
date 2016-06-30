CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_registro_sucursal`(
	p_nombre varchar(30),
    p_ciudad char(8),
    p_direccion varchar(30)
)
BEGIN
	DECLARE cont int;
    
	-- Iniciar Transacción
	start transaction;
        
    select chr_sucucodigo into cont from sucursal order by chr_sucucodigo desc limit 1;
	
    
    -- Registrar la sucursal	
	insert into sucursal(chr_sucucodigo,vch_sucunombre,vch_sucuciudad,vch_sucudireccion,int_sucucontcuenta)
		values(cont+1,p_nombre,p_ciudad,p_direccion,0);
    
    
    -- Confirma Transacción
	commit;

	-- Retorna el estado
	select 1 as state, 'Sucursal registrada' as message;
END