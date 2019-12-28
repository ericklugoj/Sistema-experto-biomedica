:-use_module(library(pce)).
:-use_module(library(pce_style_item)).
:-consult('hechos.pl').
:-pce_image_directory('./img').


resource(logo,image,image('logo.jpg')).
resource(logo2,image,image('logo2.jpg')).
resource(logo3,image,image('xpert1.jpg')).
resource(logo6,image,image('no.jpg')).


% --------------------------PARA EL MENU PRINCIPAL------------------------------------
start:-
    new(D, dialog),
    new(W,  window('Erick Lugo, Juan Zeron, Clarissa Tun', size(900, 500))),
    new(Imagen,label(icon,resource(logo))),

    new(BtnIni,button('Usuario',and(message(@prolog,ventanaUsuario),message(W, destroy)))),


    new(BtnAdqui,button('Experto',and(message(@prolog,ventanaAdqui),message(W, destroy)))),

    
    send(D, below, W),
		send(W,display,Imagen,point(0,0)),
		send(D,display,BtnIni,point(200,10)),
		send(D,display,BtnAdqui,point(600,10)),
    send(D, open_centered),
    !.
% ---------------------------------------------------------------------------------------





% --------------------------PARA LA VENTANA CUESTIONARIO--------------------------------- 


ventanaUsuario:-
new(D, dialog),
    new(W,  window('Sistema Experto | Modulo de usuario', size(365, 430))),
    
% SON LAS 5 PREGUNTAS GENERALES EN ETIQUETAS
new(P1,label(nombre,'1. Cual es su necesidad?')),
new(P2,label(nombre,'2. En que etapa de vida se encuentra?')),
new(P3,label(nombre,'3. Cual es su rango de peso?')),
new(P4,label(nombre,'4. Para que extremidad?')),
new(P5,label(nombre,'5. Que anomalia fisica?')),
new(P6,label(nombre,'6. Cuanta actividad fisica realiza?')),



	new(ComboNecesidad,menu('Necesidad:',cycle)),
	send_list(ComboNecesidad,append,['Protesis', 'Tejido']),

	new(ComboEtapa,menu('Etapa:',cycle)),
	send_list(ComboEtapa,append,['Nino','Adulto']),

	new(ComboPeso,menu('Peso:',cycle)),
	send_list(ComboPeso,append,['15-40kg','41-120kg']),

	new(ComboExtremidad,menu('Extremidad:',cycle)),
	send_list(ComboExtremidad,append,['Pierna baja','Arriba brazo']),

	new(ComboAnomalia,menu('Anomalia:',cycle)),
	send_list(ComboAnomalia,append,['Amputacion','Lesion', 'Corte']),

	new(ComboActividad,menu('Actividad:',cycle)),
	send_list(ComboActividad,append,['Vigorosa','Moderada', 'Leve']),

    	        
    	send(D, below, W),
	
   	
	send(W,display,P1,point(40,40)),
    	send(W,display,ComboNecesidad,point(40,65)),

    	send(W,display,P2,point(40,100)),
    	send(W,display,ComboEtapa,point(40,125)),

    	send(W,display,P3,point(40,160)),
    	send(W,display,ComboPeso,point(40,185)),

    	send(W,display,P4,point(40,220)),
    	send(W,display,ComboExtremidad,point(40,245)),

    	send(W,display,P5,point(40,280)),
    	send(W,display,ComboAnomalia,point(40,305)), 
    	
			send(W,display,P6,point(40,340)),
    	send(W,display,ComboActividad,point(40,365)), 



 	%send(W,display,Imagen2,point(420,0)),

	new(BtnAceptar,button('Continuar',and(message(@prolog,buscarResultado,ComboNecesidad?selection,ComboEtapa?selection,ComboPeso?selection,ComboExtremidad?selection,ComboAnomalia?selection,ComboActividad?selection), message(W, destroy)))),

	new(BtnRegresar,button('Regresar',and(message(@prolog, start),message(W, destroy)))),

    	
send(D,display,BtnRegresar,point(10,10)),
send(D,display,BtnAceptar,point(280,10)),

    	send(D, open_centered),
    	!.

% --------------------------PARA LA VENTANA ADQUISICION---------------------------------

ventanaAdqui:-


new(D, dialog),
    new(W,  window('Sistema Experto | Modulo de experto', size(365, 600))),
    
% SON LAS 5 PREGUNTAS GENERALES EN ETIQUETAS
new(P1,label(nombre,'1. Cual es su necesidad?')),
new(P2,label(nombre,'2. En que etapa de vida se encuentra?')),
new(P3,label(nombre,'3. Cual es su rango de peso?')),
new(P4,label(nombre,'4. Para que extremidad?')),
new(P5,label(nombre,'5. Que anomalia fisica?')),
new(P6,label(nombre,'6. Cuanta actividad fisica realiza?')),

new(P8,label(nombre,'7. Nombre del aparato biomedico')),
new(TxtVariable,text_item('Nombre')),

new(P9,label(nombre,'8. Breve descripcion')),
new(TxtDescrip,text_item('Descripcion')),

new(P10,label(nombre,'9. Explicacion completa')),
new(TxtExpli,text_item('Explicacion')),


	new(ComboNecesidad,menu('Necesidad:',cycle)),
	send_list(ComboNecesidad,append,['Protesis', 'Tejido']),

	new(ComboEtapa,menu('Etapa:',cycle)),
	send_list(ComboEtapa,append,['Nino','Adulto']),

	new(ComboPeso,menu('Peso:',cycle)),
	send_list(ComboPeso,append,['15-40kg','41-120kg']),

	new(ComboExtremidad,menu('Extremidad:',cycle)),
	send_list(ComboExtremidad,append,['Pierna baja','Arriba brazo']),

	new(ComboAnomalia,menu('Anomalia:',cycle)),
	send_list(ComboAnomalia,append,['Amputacion','Lesion', 'Corte']),

	new(ComboActividad,menu('Actividad:',cycle)),
	send_list(ComboActividad,append,['Vigorosa','Moderada', 'Leve']),

    	        
    	send(D, below, W),
   	
	send(W,display,P1,point(40,40)),
	send(W,display,ComboNecesidad,point(40,65)),

	send(W,display,P2,point(40,100)),
	send(W,display,ComboEtapa,point(40,125)),

	send(W,display,P3,point(40,160)),
	send(W,display,ComboPeso,point(40,185)),

	send(W,display,P4,point(40,220)),
	send(W,display,ComboExtremidad,point(40,245)),

	send(W,display,P5,point(40,280)),
	send(W,display,ComboAnomalia,point(40,305)), 

	send(W,display,P6,point(40,340)),
	send(W,display,ComboActividad,point(40,365)), 

	send(W,display,P8,point(40,400)),
	send(W,display,TxtVariable,point(40,425)),

	send(W,display,P9,point(40,460)),
	send(W,display,TxtDescrip,point(40,485)),

	send(W,display,P10,point(40,520)),
	send(W,display,TxtExpli,point(40,545)),

	new(BtnAceptar,button('Introducir',and(message(@prolog,generarNuevoConocimiento,ComboNecesidad?selection,ComboEtapa?selection,ComboPeso?selection,ComboExtremidad?selection,ComboAnomalia?selection,ComboActividad?selection, TxtDescrip?selection,  TxtExpli?selection, TxtVariable?selection), message(W, destroy)))),


    	
send(D,display,BtnAceptar,point(350,10)),

    	send(D, open_centered), !.


% -----------------------------BUSCAR SOLUCION BIOMEDICA-----------------------------------------------

buscarResultado(A,B,C,D,E,F):-
findall(Solucion, (necesidad(Solucion, A),
etapa(Solucion, B), 
peso(Solucion, C), 
extremidad(Solucion, D), 
anomalia(Solucion, E),
actividad(Solucion, F)), Lista), 
pasarResp(Lista), !.

buscarResultado(A, B, C, D, E, F) :- 
writeln('No se encontro ningun resultado con los siguientes parametros:'),
writeln(A), writeln(B), writeln(C), writeln(D), writeln(E), writeln(F),
respNO(A,B,C,D,E,F).

pasarResp([X|Rest]):-
(resp(X), pasarResp(Rest));true.

resp(Solucion):-
descripcion(Solucion, R),
imagen(Solucion, I),  
explicacion(Solucion, E), 
writeln(R), writeln(I), 
new(D, dialog), 
new(W,  window('Sistema Experto | Resultado', size(750, 500))), 
new(R0,label(nombre,'Usted necesita:')),
new(R1,label(nombre,R)), 
send(W,display,R0,point(40,15)),
send(W,display,R1,point(40,55)), 
mostrar(I, W, 10, 70), % medidas


new(BtnExplica,button('Leer Explicacion',and(message(@prolog, explica, E)))),

new(BtnInicio,button('Regresar',and(message(@prolog, start),message(W, destroy)))),

send(D,display,BtnExplica,point(250,10)),
send(D,display,BtnInicio,point(380,10)),

send(D, below, W),
send(D, open_centered).


mostrar(I, W, X, Y) :- 
new(Imagen, image(I)), 
new(B,bitmap(Imagen)),
new(F,figure), 
send(F,display,B), 
new(D1,device), 
send(D1,display,F), 
send(W,display,D1), 
send(W,display,D1,point(X,Y)).

explica(E):- 
new(D, dialog('Explicacion')), 
new(R0,label(nombre,'Esta es la mejor solucion por las siguientes razones:')),
new(R1,label(nombre,E)), 
send(D,display,R0,point(40,15)),
send(D,display,R1,point(40,55)), 
send(D, open_centered).

respNO(A,B,C,D,E,F):-

new(X, dialog),
new(W,  window('No se encontro ninguna coincidencia', size(750, 500))),
new(R0,label(nombre,'1. Con base a la informacion obtenida:')),
new(R1,label(nombre,A)),
new(R2,label(nombre,B)),
new(R3,label(nombre,C)),
new(R4,label(nombre,D)),
new(R5,label(nombre,E)),
new(R6,label(nombre,F)),

send(W,display,R0,point(40,15)),
send(W,display,R1,point(40,45)),
send(W,display,R2,point(40,75)),
send(W,display,R3,point(40,105)),
send(W,display,R4,point(40,135)),
send(W,display,R5,point(40,165)),
send(W,display,R6,point(40,195)),

new(Imagen6,label(icon,resource(logo6))),
send(W,display,Imagen6,point(10,10)),

%new(BtnAgregar,button('Generar nuevo conocimiento',and(message(@prolog,meterDatosNuevos,A,B,C,D,E), message(W, destroy)))),

new(BtnSalir,button('Salir',and(message(W, destroy)))),


new(BtnInicio,button('Regresar',and(message(@prolog, start),message(W, destroy)))),
    	
%send(X,display,BtnAgregar,point(10,10)),
send(X,display,BtnInicio,point(10,10)),
send(X,display,BtnSalir,point(700,10)),


send(X, below, W),
send(X, open_centered).



%-----------------------------------------------------------------------------------------




%------------------------PARA GUARDAR SOLUCION BIOMEDICA EN LA BASE DE HECHOS--------------------------

generarNuevoConocimiento(Necesidad, Etapa, Peso, Extremidad, Anomalia, Actividad, Desc, Exp, X) :-
	asserta(necesidad(X, Necesidad)), 
	asserta(etapa(X, Etapa)), 
	asserta(peso(X, Peso)), 
	asserta(extremidad(X, Extremidad)),
	asserta(anomalia(X, Anomalia)),  
	asserta(actividad(X, Actividad)), 
	asserta(descripcion(X, Desc)), 
	atom_concat(X, '.jpg', I), 
	asserta(imagen(X, I)),
	asserta(explicacion(X, Exp)),
	guardar.
	
guardar :- 
	tell('./hechos.pl'),
	listing(necesidad), 
	listing(etapa), 
	listing(peso), 
	listing(extremidad), 
	listing(anomalia), 
	listing(actividad), 
	listing(descripcion), 
	listing(imagen), 
	listing(explicacion), 
	told.

