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

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:09:41'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook Name|
	
	customerBook := CustomerBook new.
	Name := 'John Lennon'.
	self CodigoQueSeRealiza: [customerBook addCustomerNamed: Name] 
	MenosQue: 50.
	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:10:19'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook Name |
	
	customerBook := CustomerBook new.
	Name := 'Paul McCartney'.
	
	customerBook addCustomerNamed: Name.
	  
	self CodigoQueSeRealiza: [customerBook removeCustomerNamed: Name] 
	MenosQue: 100.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:17:50'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	 

	self seRealiza:[ customerBook addCustomerNamed: ''. ]  causa: Error  condiciones: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:19:46'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook Name |
			
	customerBook := CustomerBook new.
	Name := 'John Lennon'.
	customerBook addCustomerNamed: Name.
	self seRealiza:[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]  causa: NotFound condiciones: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: Name) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:28:24'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self CreacionLibro: paulMcCartney.
	
	
	self Validaciones: customerBook segundo: 0 tercero: 1 cuarto: 1. 
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:29:56'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self CreacionLibro: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self Validaciones: customerBook segundo: 0 tercero:0  cuarto: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:40:34'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr|
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	customerBook addCustomerNamed: johnLennon.
	self verificoQue: ringoStarr noPuedeSerSuspendidaEn: customerBook 
	yDeberiaIncuirA: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'juan 5/15/2021 15:41:04'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	self verificoQue: johnLennon noPuedeSerSuspendidaEn: customerBook 
	yDeberiaIncuirA: johnLennon.
! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'juan 5/15/2021 15:07:11'!
CodigoQueSeRealiza:bloqueDeCodigo MenosQue: tiempo
|millisecondsBeforeRunning millisecondsAfterRunning|
        millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	bloqueDeCodigo value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (tiempo * millisecond)
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'juan 5/15/2021 15:28:05'!
CreacionLibro: nombre

	| customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: nombre.
	customerBook suspendCustomerNamed: nombre.
	^customerBook.

! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'juan 5/15/2021 15:22:30'!
Validaciones:primero segundo:segundo tercero:tercero cuarto:cuarto
	self assert: segundo equals: primero numberOfActiveCustomers.
	self assert: tercero equals: primero numberOfSuspendedCustomers.
	self assert: cuarto equals: primero numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'juan 5/15/2021 15:18:04'!
seRealiza: codigoDelError causa: identificadorDeError condiciones: codigoCondicion

[ codigoDelError value.
	self fail ]
		on: identificadorDeError 
		do: codigoCondicion 
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'juan 5/15/2021 15:38:24'!
verificoQue: unaPersona noPuedeSerSuspendidaEn: unCustomerBook yDeberiaIncuirA: unaPersonaIncluida
    self seRealiza:[ unCustomerBook suspendCustomerNamed: unaPersona. ]  causa: CantSuspend condiciones:  [ :anError | 
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
