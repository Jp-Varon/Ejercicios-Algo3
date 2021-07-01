!classDefinition: #MarsRoversTests category: 'MarsRovers-Exercise'!
TestCase subclass: #MarsRoversTests
	instanceVariableNames: 'marsroversNorte marsroversSur marsroversOeste marsroversEste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:10:31'!
setUp
	marsroversNorte _ MarsRovers En: 5@5 ApuntandoA: Norte new.
	marsroversSur _ MarsRovers En: 5@5 ApuntandoA: Sur new.
	marsroversOeste _ MarsRovers En: 5@5 ApuntandoA: Oeste new.
	marsroversEste  _ MarsRovers En: 5@5 ApuntandoA: Este new.! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:16:14'!
test01AvanzarNorte
	marsroversNorte leerComandos: 'f'.
	
	self assert: (marsroversNorte estaEn: 5@6 apuntandoAl: Norte)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:16:31'!
test02RetrocederNorte
	marsroversNorte leerComandos: 'b'.
	
	self assert: (marsroversNorte estaEn: 5@4 apuntandoAl: Norte)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:16:43'!
test03GirarIzquierdaNorte
	marsroversNorte leerComandos: 'l'.
	
	self assert: (marsroversNorte estaEn: 5@5 apuntandoAl: Oeste)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:16:58'!
test04GirarDerechaNorte
	marsroversNorte leerComandos: 'r'.
	
	self assert: (marsroversNorte estaEn: 5@5 apuntandoAl: Este)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:17:09'!
test05AvanzarSur
	marsroversSur leerComandos: 'f'.
	
	self assert: (marsroversSur estaEn: 5@4 apuntandoAl: Sur)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:19:31'!
test06RetrocederSur
	marsroversSur leerComandos: 'b'.
	
	self assert: (marsroversSur estaEn: 5@6 apuntandoAl: Sur)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:21:01'!
test07GirarIzquierdaSur
	marsroversSur leerComandos: 'l'.
	
	self assert: (marsroversSur estaEn: 5@5 apuntandoAl: Este)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:24:00'!
test08GirarDerechaSur
	marsroversSur leerComandos: 'r'.
	
	self assert: (marsroversSur estaEn: 5@5 apuntandoAl: Oeste)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:28:50'!
test09AvanzarEste
	marsroversEste leerComandos: 'f'.
	
	self assert: (marsroversEste estaEn: 6@5 apuntandoAl: Este)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:33:53'!
test10RetrocederEste
	marsroversEste leerComandos: 'b'.
	
	self assert: (marsroversEste estaEn: 4@5 apuntandoAl: Este)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:35:54'!
test11GirarIzquierdaEste
	marsroversEste leerComandos: 'l'.
	
	self assert: (marsroversEste estaEn: 5@5 apuntandoAl: Norte)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:38:23'!
test12GirarDerechaEste
	marsroversEste leerComandos: 'r'.
	
	self assert: (marsroversEste estaEn: 5@5 apuntandoAl: Sur)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:39:38'!
test13AvanzarOeste
	marsroversOeste leerComandos: 'f'.
	
	self assert: (marsroversOeste estaEn: 4@5 apuntandoAl: Oeste)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:41:53'!
test14RetrocederOeste
	marsroversOeste leerComandos: 'b'.
	
	self assert: (marsroversOeste estaEn: 6@5 apuntandoAl: Oeste)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:43:47'!
test15GirarIzquierdaOeste
	marsroversOeste leerComandos: 'l'.
	
	self assert: (marsroversOeste estaEn: 5@5 apuntandoAl: Sur)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:44:36'!
test16GirarDerechaOeste
	marsroversOeste leerComandos: 'r'.
	
	self assert: (marsroversOeste estaEn: 5@5 apuntandoAl: Norte)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:51:08'!
test17ComandoInvalido	
	self 
		should: [ marsroversOeste leerComandos: 'j' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unError |
			self assert: unError messageText equals: marsroversOeste
			 ErrorDeComandoNoValido.
			self assert: (marsroversOeste estaEn: 5@5 apuntandoAl: Oeste) ]
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 03:00:17'!
test18VariosComandos
	marsroversNorte leerComandos: 'ffflbrb'.
	
	self assert: (marsroversNorte estaEn: 6@7 apuntandoAl: Norte)
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 03:03:36'!
test19VariosComandosConErrorEnMedio
	self 
		should: [marsroversNorte leerComandos: 'fff lbrb'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unError |
			self assert: unError messageText equals: marsroversNorte
			 ErrorDeComandoNoValido.
			self assert: (marsroversNorte estaEn: 5@8 apuntandoAl: Norte) ]
	
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/30/2021 20:53:54'!
test20NoSeLeEnviaUnStringAMarsRovers
	
	self 
		should: [ marsroversOeste leerComandos: marsroversSur. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unError |
			self assert: unError messageText equals: marsroversOeste
			 ErrorDeComandoNoValido.
			self assert: (marsroversOeste estaEn: 5@5 apuntandoAl: Oeste) ]
	! !

!MarsRoversTests methodsFor: 'as yet unclassified' stamp: 'juan 6/30/2021 21:00:54'!
test21ComandoVacio
	marsroversOeste leerComandos: ''.
	self assert: (marsroversOeste estaEn: 5@5 apuntandoAl: Oeste).
	! !


!classDefinition: #MarsRovers category: 'MarsRovers-Exercise'!
Object subclass: #MarsRovers
	instanceVariableNames: 'Posicion PuntoCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!MarsRovers methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:54:29'!
ErrorDeComandoNoValido
	^'Solo se pueden usar f, b, r, l'.! !

!MarsRovers methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:52:43'!
ProcesarComando: UnaOperacion
	UnaOperacion = $f ifTrue: [^Posicion := PuntoCardinal avanzar:Posicion].
	UnaOperacion = $b ifTrue: [^Posicion := PuntoCardinal retroceder:Posicion].
	UnaOperacion = $l ifTrue: [^PuntoCardinal := PuntoCardinal girarIzquierda].
	UnaOperacion = $r ifTrue: [^PuntoCardinal := PuntoCardinal girarDerecha].
	
	^self señalDeOperacionInvalida.
	! !

!MarsRovers methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 01:57:37'!
estaEn: posicion apuntandoAl: puntoCardinal
	^Posicion = posicion and: [ PuntoCardinal isKindOf: puntoCardinal]! !

!MarsRovers methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 01:16:54'!
inicializarEn: posicion ApuntandoA:Puntocardinal.
	Posicion := posicion .
	PuntoCardinal := Puntocardinal.
	! !

!MarsRovers methodsFor: 'as yet unclassified' stamp: 'juan 6/30/2021 20:59:24'!
leerComandos: string
	(string isKindOf: String) ifFalse: [^self señalDeOperacionInvalida].
	string do: [:UnaOperacion | self ProcesarComando: UnaOperacion].! !

!MarsRovers methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:53:36'!
señalDeOperacionInvalida
	self error: self ErrorDeComandoNoValido.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRovers class' category: 'MarsRovers-Exercise'!
MarsRovers class
	instanceVariableNames: ''!

!MarsRovers class methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 01:05:33'!
En: posicion ApuntandoA: PuntoCardinal.
	^self new inicializarEn: posicion ApuntandoA:PuntoCardinal.! !


!classDefinition: #PuntosCardinales category: 'MarsRovers-Exercise'!
Object subclass: #PuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:01:09'!
avanzar: posicion.
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:00:27'!
girarDerecha
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:00:09'!
girarIzquierda
	self subclassResponsibility.! !

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:03:22'!
retroceder:posicion
	self subclassResponsibility.! !


!classDefinition: #Este category: 'MarsRovers-Exercise'!
PuntosCardinales subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!Este methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:32:22'!
avanzar: posicion.
	^posicion +(1@0).	! !

!Este methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:38:51'!
girarDerecha
	^Sur new.! !

!Este methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:36:23'!
girarIzquierda
	^Norte new.! !

!Este methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:34:47'!
retroceder:posicion
	^posicion  +(-1@0)! !


!classDefinition: #Norte category: 'MarsRovers-Exercise'!
PuntosCardinales subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!Norte methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:02:35'!
avanzar:posicion
	^posicion + (0@1).! !

!Norte methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:25:26'!
girarDerecha
	^Este new.
	! !

!Norte methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:22:51'!
girarIzquierda
	^Oeste new.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:04:12'!
retroceder:posicion
	^posicion + (0@-1).
	! !


!classDefinition: #Oeste category: 'MarsRovers-Exercise'!
PuntosCardinales subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:40:22'!
avanzar: posicion.
	^posicion + (-1@0)! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:44:58'!
girarDerecha
	^Norte new.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:44:08'!
girarIzquierda
	^Sur new.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:43:02'!
retroceder:posicion.
	^posicion + (1@0).! !


!classDefinition: #Sur category: 'MarsRovers-Exercise'!
PuntosCardinales subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRovers-Exercise'!

!Sur methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:12:27'!
avanzar:posicion
	^posicion + (0@-1).! !

!Sur methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:25:42'!
girarDerecha
	^Oeste new.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:23:10'!
girarIzquierda
	^Este new.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'juan 6/29/2021 02:12:51'!
retroceder:posicion
	^posicion + (0@1).! !
