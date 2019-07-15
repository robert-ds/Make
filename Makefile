#Archivo Make Principal
#Autor Robert Vasquez

#Uso de Variables
OBJS =  main.o salida.o \ 
	calculadora.o

#Imprimir Contenido de Variables Solo una Vez
S = Saludos!, Estamos Para Ayudarte, Solo Debes Revisar el la Ayuda de Usuario.

#Esta Regla Une el Código Objeto, Regla Principal
programa: $(OBJS)
	gcc -o soft main.o salida.o calculadora.o
#Existen Reglas Implicitas, Estas quieren decir que no es necesario, Aveces, Pasar el compilador
#y las Banderas a un objetivo en make, el programa es lo suficientemente inteligente para elegir
#la herramienta adecuada (gcc y las bandera "flags").

main.o: main.c functions.h
	gcc -c main.c

salida.o: salida.c functions.h
	gcc -c salida.c

calculadora: calculadora.c functions.h
	gcc -c calculadora.c

limpiar:
	rm -f soft $(OBJS)

#EL @ se Utiliza Para que no Imprima la Instrucción 'echo'
imprimir:
	@echo $(S)

#Si tenemos un elemento(Variable,Objetivo,Dependencia,Instruccion) que se salga de los margenes de la pantalla o display
#Podemos Utilizar el \ y escribir en la linea siguiente, make lo leera como si fuese una sola linea.
#Por Ejemplo la variable Que declarada OBJS
