!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:03:18'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook name|
	
	customerBook := CustomerBook new.
	name := 'John Lennon'.
	
	self codigoQueSeRealiza: [customerBook addCustomerNamed: name]   menosTiempoQue: 50.

	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:11:07'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook name |
	
	name := 'Paul McCartney'.
	customerBook := self creacionLibroConNombre:  name.
	
	self codigoQueSeRealiza: [customerBook removeCustomerNamed: name] 
		menosTiempoQue: 100.
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:11:57'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	 
	self seRealiza:[ customerBook addCustomerNamed: ''. ]  
		causa: Error  
		condiciones: 	[ :anError | 
				self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:05:56'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook name |
			
	name := 'John Lennon'.
	customerBook := self creacionLibroConNombre: name.
	
	self seRealiza:[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]  
		causa: NotFound 
		condiciones: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: name) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:20:00'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self creacionLibroConNombreYSuspender: paulMcCartney.
	
	self unLibroAValidar: customerBook primerValor: 0 segundoValor: 1  tercerValor:  1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:20:24'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self creacionLibroConNombreYSuspender: paulMcCartney.
	
	customerBook removeCustomerNamed: paulMcCartney.

	self unLibroAValidar: customerBook primerValor: 0 segundoValor: 0  tercerValor:  0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:07:12'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr|
			
	
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	customerBook := self creacionLibroConNombre: johnLennon.
	
	self verificoQue: ringoStarr 
		noPuedeSerSuspendidaEn: customerBook 
		yDeberiaIncuirA: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/15/2021 16:08:00'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook:= self creacionLibroConNombreYSuspender: johnLennon.
	
	self verificoQue: johnLennon 
		noPuedeSerSuspendidaEn: customerBook 
		yDeberiaIncuirA: johnLennon.
! !


!CustomerBookTest methodsFor: 'ayudantes' stamp: 'AJ 5/15/2021 16:00:36'!
codigoQueSeRealiza:bloqueDeCodigo menosTiempoQue: tiempo

	|millisecondsBeforeRunning millisecondsAfterRunning|
        millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	bloqueDeCodigo value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (tiempo * millisecond)
! !

!CustomerBookTest methodsFor: 'ayudantes' stamp: 'AJ 5/15/2021 16:02:16'!
creacionLibroConNombre: nombre

	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: nombre.
	^customerBook.

! !

!CustomerBookTest methodsFor: 'ayudantes' stamp: 'AJ 5/15/2021 16:08:43'!
creacionLibroConNombreYSuspender: nombre

	| customerBook |
	customerBook := self creacionLibroConNombre: nombre.
	customerBook suspendCustomerNamed: nombre.
	^customerBook.

! !

!CustomerBookTest methodsFor: 'ayudantes' stamp: 'juan 5/15/2021 15:18:04'!
seRealiza: codigoDelError causa: identificadorDeError condiciones: codigoCondicion

[ codigoDelError value.
	self fail ]
		on: identificadorDeError 
		do: codigoCondicion 
! !

!CustomerBookTest methodsFor: 'ayudantes' stamp: 'AJ 5/15/2021 16:19:18'!
unLibroAValidar:unLibro primerValor: primero segundoValor:segundo tercerValor: tercero

	self assert: primero equals: unLibro numberOfActiveCustomers.
	self assert: segundo equals: unLibro numberOfSuspendedCustomers.
	self assert: tercero equals: unLibro numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'ayudantes' stamp: 'AJ 5/15/2021 15:59:52'!
verificoQue: unaPersona noPuedeSerSuspendidaEn: unCustomerBook yDeberiaIncuirA: unaPersonaIncluida

    self seRealiza:[ unCustomerBook suspendCustomerNamed: unaPersona. ] 
		 causa: CantSuspend 
		 condiciones:  [ :anError | 
			self assert: unCustomerBook numberOfCustomers = 1.
			self assert: (unCustomerBook includesCustomerNamed: unaPersonaIncluida ) ]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
