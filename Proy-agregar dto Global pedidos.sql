Proyecto para agregar Descuento global a pedidos especificos:
1. se debe modificar programa VALORARPED para agregar plugin.
2. Crear programa para lecturar los pedidos y aconndicionar para que pueda cambiar el dscto Global.
3. Crear consulta para saber cuantas UEN estan en ese pedido.
4. Mostrar advertencia en el programa que existen mas de una UEN en el pedeido.
5. Agregar campo para adicionar el descuento GLOBAL que se agregará.
6. Generar sql para aplicar al pedido y cargar el descuento.

/****************************************************/
1. se debe modificar programa VALORARPED para agregar plugin.
Se ha realizado las modificaciones al porgrama agregando un plugin "key_g"  para llamar al programa creado.
https://github.com/emercadogarcia/Proy_Agregar_dto_global.git

/****************************************************/
2. Crear programa para lecturar los pedidos y aconndicionar para que pueda cambiar el dscto Global.
Se ha creado el programa "BOL_METADATOS"  el cual esta como base para lecutrar los pedidos y agregar el descuento global.


/****************************************************/
3. Crear consulta para saber cuantas UEN estan en ese pedido.
select UEN,COUNT(*) CANT
from (select pedidos_ventas_lin.*, (selEct DESCRIPCION FROM FAMILIAS f WHERE f.codigo_empresa=Pedidos_ventas_lin.EMPRESA and f.codigo_familia=(select codigo_estad5 from articulos a where a.codigo_empresa=pedidos_ventas_lin.Empresa and a.codigo_articulo=pedidos_ventas_lin.articulo) ) UEN FROM PEDIDOS_VENTAS_LIN) PL
where ejercicio=2016 and  numero_pedido=7701  and numero_serie='010' and empresa='004'
GROUP BY UEN

pARA LOS LABORATORIOS: 
SELECT codigo_familia c1, rowid rowid_lov FROM familias
codigo_empresa = :global.codigo_empresa AND numero_tabla = 3

SELECT CODIGO_FAMILIA,DESCRIPCION,numero_tabla
FROM FAMILIAS
WHERE codigo_empresa = '004' AND CODIGO_FAMILIA LIKE '040%'

:SF:pk_va_articulos.get_campo_descripcion_fam(p_empresa=>:global.codigo_empresa,p_usuario=>:global.usuario,p_alias=>'familias'):EF: c2, 

/****************************************************/
4. Mostrar advertencia en el programa que existen mas de una UEN en el pedeido.
/****************************************************/
5. Agregar campo para adicionar el descuento GLOBAL que se agregará.
/****************************************************/
6. Generar sql para aplicar al pedido y cargar el descuento.
