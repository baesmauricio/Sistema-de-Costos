Algoritmo Sistema_de_Costos
	// Definición de variables
	Definir precioOriginal, precioConIVA, montoCantidad, precioConDescuento, precioConDescuentoCantidad, descuentoCupon, iva, costoEnvio, costoFinal Como Real
	Definir cantidad, pesoPaquete, opcionDestino, opcionPeso Como Entero
	Definir aplicarDescuento Como Caracter
	Definir detalleCompra Como Real // Mostrar el detalle de la compra
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
	
	// Leer datos del usuario
	Escribir "Ingrese el precio original del producto: $"
	Leer precioOriginal
	
	// Aplicación del IVA al precio original
	precioConIVA <- precioOriginal + (precioOriginal * iva)
	Escribir "En nuestro país, todos los productos son gravados con el IVA del 12%, por tanto el valor del producto es: $", precioConIVA
	
	// Ingreso de la cantidad
	Escribir "¿Cuál es la cantidad de productos que lleva?"
	Leer cantidad
	
	// Cálculo del precio por la cantidad
	montoCantidad <- precioConIVA * cantidad
	Escribir "Entonces el monto total del o los productos con impuestos es: $", montoCantidad
	
	// Aplicación del cupón de descuento
	Escribir "¿Tiene un cupón de descuento del 20%, lo desea utilizar? (S/N)"
	Leer aplicarDescuento
	Si aplicarDescuento = "S" Entonces
		precioConDescuento <- montoCantidad - (montoCantidad * descuentoCupon)
	Sino
		precioConDescuento <- montoCantidad
	FinSi
	Escribir "Entonces este es el valor de los productos: $", precioConDescuento
	
	// Cálculo del descuento según cantidad de productos
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
	
	precioConDescuentoCantidad <- precioConDescuento * (1 - descuento)
	Escribir "Considerando la cantidad de productos que lleva, este es el valor de su compra: $", precioConDescuentoCantidad
	
	// Cálculo de los costos de envío según peso del paquete (<2 kg y >=2kg) y destino (retiro en tienda, en RM y regiones)
	Escribir "Para calcular el costo de envio, debe ingresar el peso del paquete en kg:"
	Leer pesoPaquete
	
	Escribir "Seleccione la forma de entrega del o los productos:"
	Escribir "1. Retiro en Tienda"
	Escribir "2. Despacho en Región Metropolitana"
	Escribir "3. Despacho a Regiones"
	Leer opcionDestino
	
	// Determinar la opción de peso
	Si pesoPaquete < 2 Entonces
		opcionPeso <- 1
	Sino
		opcionPeso <- 2
	FinSi
	
	// Calcular el costo de envío basado en el peso y la ubicación
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
	
	// Calcular el costo final
	costoFinal <- costoEnvio + precioConDescuentoCantidad
		
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
FinAlgoritmo
