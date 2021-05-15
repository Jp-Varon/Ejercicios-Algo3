!classDefinition: #Caja category: 'ejercicio_Factorio'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'ejercicio_Factorio'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:42:38'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:08:26'!
cantidadDeMenas
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:26:06'!
cantidadDeMenasDeCarbon
	^contenido count: [:cadaMena | cadaMena = 'una mena de carbon']! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:26:22'!
cantidadDeMenasDeHierro
	^contenido count: [:cadaMena | cadaMena = 'una mena de hierro']! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'juan 5/8/2021 11:34:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; add: 'una mena de hierro'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:09:06'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaA category: 'ejercicio_Factorio'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'ejercicio_Factorio'!
CintaA class
	instanceVariableNames: 'Contenido destino'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:15'!
agregarMenas: aCollectionOfMenas
	^Contenido addAll: aCollectionOfMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:15'!
cantidadDeMenas
	^Contenido size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:16:51'!
cantidadDeMenasDeCarbon
	^Contenido count: [:cadaMena | cadaMena = 'una mena de carbon']! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:26:47'!
cantidadDeMenasDeHierro
	^Contenido count: [:cadaMena | cadaMena = 'una mena de hierro']! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:16'!
destino: aContenedor 
	destino := aContenedor.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'juan 5/8/2021 11:34:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Contenido := ((OrderedCollection new)).
	destino := Caja.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:41:03'!
transportar
	|contenidoCinta |
	contenidoCinta := Contenido.
	self vaciar.
	^destino agregarMenas: (contenidoCinta).! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:16'!
vaciar
	Contenido := OrderedCollection new.! !


!classDefinition: #CintaB category: 'ejercicio_Factorio'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'ejercicio_Factorio'!
CintaB class
	instanceVariableNames: 'Contenido destino'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:29'!
agregarMenas: aCollectionOfMenas
	^Contenido addAll: aCollectionOfMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:29'!
cantidadDeMenas
	^Contenido size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:38:13'!
cantidadDeMenasDeCarbon
	^Contenido count: [:cadaMena | cadaMena = 'una mena de carbon']! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:37:04'!
cantidadDeMenasDeHierro
	^Contenido count: [:cadaMena | cadaMena = 'una mena de hierro']! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:29'!
destino: aContenedor 
	destino := aContenedor.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'juan 5/8/2021 11:34:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	Contenido := ((OrderedCollection new)).
	destino := CintaA.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:42:33'!
transportar
	| contenidoCinta |
	contenidoCinta := Contenido.
	self vaciar.
	^destino agregarMenas: (contenidoCinta).! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AJ 5/6/2021 19:03:29'!
vaciar
	Contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'ejercicio_Factorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'ejercicio_Factorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'AJ 4/17/2021 20:14:36'!
costoExtraccionPorMena

	^ 5 * joule! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'AJ 4/17/2021 20:14:36'!
energiaParaExtraerTodasLasMenasPosibles: cantidadDeMenas
	
	^(cantidadDeMenas * self costoExtraccionPorMena ).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'juan 5/8/2021 11:34:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaA.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'ejercicio_Factorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'ejercicio_Factorio'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:01'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:32'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:01'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:01'!
costoExtraccionPorMena

	^ 5 * joule! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
energiaActual

	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
energiaParaExtraerTodasLasMenasPosibles: cantidadDeMenas
	
	^(cantidadDeMenas * self costoExtraccionPorMena ).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:12:06'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'juan 5/8/2021 11:34:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AJ 5/8/2021 09:11:02'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'ejercicio_Factorio'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'ejercicio_Factorio'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'ejercicio_Factorio'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio_Factorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'ejercicio_Factorio'!
PruebasDeFactorio class
	instanceVariableNames: ''!


!PruebasDeFactorio class methodsFor: 'tests' stamp: 'SF 5/2/2021 19:43:17'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'tests' stamp: 'juan 5/8/2021 11:32:33'!
testEscenarioExtractorCinta
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	
	CintaA vaciar.
	Caja vaciar.
	
	ExtractorDeCarbon destino: CintaA.
	CintaA destino: Caja.
	
	ExtractorDeCarbon extraer.
	Assert that: CintaA cantidadDeMenas isEqualTo: 1.
	Assert that: CintaA cantidadDeMenasDeHierro isEqualTo: 0.
	Assert that: CintaA cantidadDeMenasDeCarbon isEqualTo: 1.
	CintaA transportar.
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'tests' stamp: 'juan 5/8/2021 11:34:10'!
testEscenarioTres

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeHierro ponerEnCeroLaEnergia.
	CintaA vaciar.
	CintaB vaciar.
	Caja vaciar.
	
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro  destino: CintaB.
	CintaB destino: CintaA.
	CintaA destino: Caja.
	
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeHierro agregarEnergia: 5*joule.
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	
	Assert that: CintaB cantidadDeMenas isEqualTo: 1.
	Assert that: CintaB cantidadDeMenasDeCarbon isEqualTo: 0.
	Assert that: CintaB cantidadDeMenasDeHierro isEqualTo: 1.
	
	CintaB transportar.
	CintaA transportar.
	
	Assert that: CintaA cantidadDeMenas isEqualTo: 0.
	Assert that: CintaB cantidadDeMenas isEqualTo: 0.
	Assert that: Caja cantidadDeMenas isEqualTo: 2.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 1.
	! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!