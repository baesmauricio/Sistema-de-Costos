
# Proyecto 1: Sistema de Costos

# Descripcion:

Este proyecto busca generar una herramienta sencilla para interactuar con el cliente de una forma clara y eficiente. Lo que destaca a este proyecto, es el detalle de cada uno de los costos asociados a la compra, los descuentos aplicados por diferentes conceptos y el detalle de la compra, de tal forma que el cliente no tenga duda acerca de que va a pagar finalmente. 

## Autor
Mauricio Baes Gutierrez

- mabaes.dwfs15@bootcampudd.cl
- baesmauricio@gmail.com



## Feedback

Si tienes alguna duda o si quieres contribuir a mejorar el codigo, por favor no dudes en contactarme. baesmauricio@gmail.com

## Proyecto 1: Demo

En este demo observaremos como se lleva a cabo una compra de productos a los cuales hay que aplicar impuestos, descuentos y calcular los costos de envio. El proyecto fue realizado con el programa "PSeint". 

A continuación, te explico el planteamiento, los requerimientos y la solución paso a paso. 

### Planteamiento
Un local comercial requiere de un programa que calcule los precios segun diferentes condiciones o situaciones que se dan de la interaccion con el cliente. Finalmente, se obtendra un detalle de cada uno de los precios con tal ser lo mas claro y preciso mejorando la satisfaccion del cliente.

### Requerimientos

- El cliente debe ingresar el precio del producto.
- Recordamos que todos los productos en nuestro pais deben pagar un impuesto del 12%
- El cliente debe ingresar la cantidad de productos que desea llevar.
- A continuacion el cliente nos indica si quiere hacer efectivo un cupon de descuento por un 20%. Debe responder S o N (con mayuscula).
- Dependiendo de la cantidad de productos que lleva es posible optar a un descuento adicional (10% - 30%).
- Para calcular el costo de envio, solicitamos el peso del paquete y la forma de entrega del producto.
- Finalmente se realiza un detalle de la compra para que no quede duda de cada uno de los costos y descuentos aplicados.  
- Finalmente se realiza un detalle de la compra para que no quede duda de cada uno de los costos y descuentos aplicados.  

### Solución explicada paso a paso

1. Primero se definen cada una de las variables utilizadas en el programa y luego se inicializan. 
``` 
Definir precioOriginal, precioConIVA, montoCantidad, precioConDescuento, precioConDescuentoCantidad, descuentoCupon, iva, costoEnvio, costoFinal Como Real
Definir cantidad, pesoPaquete, opcionDestino, opcionPeso Como Entero
Definir aplicarDescuento Como Caracter
Definir detalleCompra Como Real 
Dimension detalleCompra[7]
Definir i Como Entero
// Inicialización de variables
descuentoCupon <- 0.20
iva <- 0.12
costoEnvioFijo <- 1000
costoPorKgRMMenor2 <- 1000
costoPorKgRMMayorIgual2 <- 2000
costoPorKgRegionesMenor2 <- 3000
costoPorKgRegionesMayorIgual2 <- 4000
```

2. Se solicita al cliente que ingrese el precio del producto.
3. Se muestra un mensaje  en la pantalla solicitando el precio del producto. el precio se lee y se guarda en la variable precioOriginal.
```
Escribir "Ingrese el precio original del producto: $"
Leer precioOriginal
```
    
4. Luego se aplica al precio original el iva del 12%, 
```
precioConIVA <- precioOriginal + precioOriginal * iva)
```
5. Se solicita al cliente la cantidad de productos que lleva mediante un mensaje en pantalla. Se lee la cantidad y se guarda en la variable cantidad.
```
Escribir "¿Cuál es la cantidad de productos que lleva?"
Leer cantidad
```
    
6. Luego se calcula el precio de los productos con iva segun la cantidad:
```
montoCantidad <- precioConIVA * cantidad
```

7. A continuacion se despliega un mensaje preguntando si desea utilizar un cupon de descuento del 20% en el valor de compra. el cliente responde solo con las iniciales S o N (Si o No). 
```
Escribir "¿Tiene un cupón de descuento del 20%, lo desea utilizar? (S/N)"
Leer aplicarDescuento
```
8. Para aplicar el cupon de descuento se utilizo la funcion Si Entonces
```
Si aplicarDescuento = "S" Entonces
		precioConDescuento <- montoCantidad - (montoCantidad * descuentoCupon)
	Sino
		precioConDescuento <- montoCantidad
	FinSi
	Escribir "Entonces este es el valor de los productos: $", precioConDescuento
```

9. Tambien realizamos un descuento por la cantidad de productos que lleva (Si >=20 productos 30%; si >=10 items un 20%; Si >=5 solo un 10%; Si <5 no aplica descuento). Para ello tambien utilizamos la funcion Si Entonces.
```
descuento <- 0
	Si cantidad < 5 Entonces
		Escribir "No hay descuento adicional por la cantidad de productos que lleva"
	SiNo
		Si cantidad >= 20 Entonces
			descuento <- 0.3
		SiNo
			Si cantidad >= 10 Entonces
				descuento <- 0.2
			SiNo
				Si cantidad >= 5 Entonces
					descuento <- 0.1
				FinSi
			FinSi
		FinSi
	FinSi
```

10. Luego se despliega un mensaje indicando el monto considerando el iva, si uso o no cupon de descuento y si es que aplica un descuento por la cantidad de productos que lleva.
```
precioConDescuentoCantidad <- precioConDescuento * (1 - descuento)
Escribir "Considerando la cantidad de productos que lleva, este es el valor de su compra: $", precioConDescuentoCantidad
```
11. Ahora viene el calculo del costo de envio. Para ello solicitamos al cliente que ingrese el peso del paquete en kilos 

```
Escribir "Ingrese el peso del paquete en kg:"
Leer pesoPaquete
```
 y la forma de entrega del o los productos
 ```
 Escribir "Seleccione la forma de entrega del o los productos:"
Escribir "1. Retiro en Tienda"
Escribir "2. Despacho en Región Metropolitana"
Escribir "3. Despacho a Regiones"
Leer opcionDestino
```
con ambas variables se procedea calcular el costo de envio utilizando la estructura Segun Hacer
```
Segun opcionDestino Hacer
		1: costoEnvio <- 0  // Retiro en Tienda
		2: Segun opcionPeso Hacer // Metropolitana
				1: costoEnvio <- costoEnvioFijo + (costoPorKgRMMenor2 * pesoPaquete) // Peso menor a 2 kg
				2: costoEnvio <- costoEnvioFijo + (costoPorKgRMMayorIgual2 * pesoPaquete) // Peso mayor o igual a 2 kg
			FinSegun
		3: Segun opcionPeso Hacer // Regiones
				1: costoEnvio <- costoEnvioFijo + (costoPorKgRegionesMenor2 * pesoPaquete) // Peso menor a 2 kg
				2: costoEnvio <- costoEnvioFijo + (costoPorKgRegionesMayorIgual2 * pesoPaquete) // Peso mayor o igual a 2 kg
			FinSegun
		De Otro Modo:
			Escribir "Destino no válido. Intente de nuevo."
			costoEnvio <- 0
	FinSegun
```
12.Finalmente se realiza un arreglo para detallar los montos calculados y el precio final que debe pagar el cliente.
```
    detalleCompra[1] <- precioOriginal
	detalleCompra[2] <- precioConIVA
	detalleCompra[3] <- montoCantidad
	detalleCompra[4] <- precioConDescuento
	detalleCompra[5] <- precioConDescuentoCantidad
	detalleCompra[6] <- costoEnvio
	detalleCompra[7] <- costoFinal
	
	Escribir "Detalle de la compra:"
	Escribir "Precio Original: $", detalleCompra[1]
	Escribir "Precio con IVA: $", detalleCompra[2]
	Escribir "Precio considerando la cantidad de productos: $", detalleCompra[3]
	Escribir "Precio con el descuento adicional, si es que aplica: $", detalleCompra[4]
	Escribir "Precio con Descuento por la cantidad de productos que lleva: $", detalleCompra[5]
	Escribir "Costo de Envío: $", detalleCompra[6]
	Escribir "Costo final del producto: $", detalleCompra[7]
```
## 🚀 About Me

Mi nombre es Mauricio, kinesiologo intensivista, intelectualmente inquieto y con un profundo interes en mejorar los procesos asistenciales mediante la generacion de nuevo conocimiento. Apasionado por aquellas preguntas de investigacion que son relevantes para la institucion y los pacientes. Estoy convencido de que este Bootcamp UDD en desarrollo web contribuira a mejorar la gestion, los procesos de atencion e inevitablemente la calidad de vida de los pacientes tanto a corto como a largo plazo. Sera una nueva forma de seguir contribuyendo a las salud de las personas. 