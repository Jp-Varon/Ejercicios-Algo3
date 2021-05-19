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

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 19:56:30'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook name|
	
	customerBook := CustomerBook new.
	name := 'John Lennon'.
	
	self checkThat: [customerBook addCustomerNamed: name] 
		  isDoneInLessThan: 50*millisecond.

	
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 20:29:14'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook name |
	
	name := 'Paul McCartney'.
	customerBook := self createBookWithCustomer:  name.
	
	self checkThat: [customerBook removeCustomerNamed: name] 
		isDoneInLessThan: 100*millisecond.
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 20:13:32'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	 
	self checkThat:[ customerBook addCustomerNamed: ''. ]  
		throwsException: Error  
		whenError: 	[ :anError | 
				self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 20:13:32'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook name |
			
	name := 'John Lennon'.
	customerBook := self createBookWithCustomer: name.
	
	self checkThat:[ customerBook removeCustomerNamed: 'Paul McCartney'.]  
		throwsException: NotFound 
		whenError: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: name) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 20:51:39'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createBookWithCustomerAndSuspend: paulMcCartney.
	
	self checkThatBook: customerBook shouldHaveThisManyActiveCustomers: 0 andSuspendedCustomers: 1  andTotalCustomers:  1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 20:51:39'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createBookWithCustomerAndSuspend: paulMcCartney.
	
	customerBook removeCustomerNamed: paulMcCartney.

	self checkThatBook: customerBook shouldHaveThisManyActiveCustomers: 0 andSuspendedCustomers: 0  andTotalCustomers:  0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 21:04:35'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr|
		
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	customerBook := self createBookWithCustomer: johnLennon.
	
	self checkThat: ringoStarr 
		cantBeSuspendedIn: customerBook 
		andShouldInclude: johnLennon.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AJ 5/17/2021 20:21:01'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook:= self createBookWithCustomerAndSuspend: johnLennon.
	
	self checkThat: johnLennon 
		cantBeSuspendedIn: customerBook 
		andShouldInclude: johnLennon.
! !


!CustomerBookTest methodsFor: 'helpers' stamp: 'AJ 5/17/2021 21:06:14'!
checkThat: aCustomer cantBeSuspendedIn: aCustomerBook andShouldInclude: anotherCustomer

    self checkThat:[ aCustomerBook suspendCustomerNamed: aCustomer. ] 
		 throwsException: CantSuspend 
		 whenError:  [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: anotherCustomer ) ]! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'AJ 5/17/2021 21:03:02'!
checkThat:codeBlock isDoneInLessThan: time

	|timeToExecuteCode|
	timeToExecuteCode := Time millisecondsToRun: codeBlock.
	self assert: (timeToExecuteCode) < (time)
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'AJ 5/17/2021 20:16:10'!
checkThat: codeBlock throwsException: exceptionCode whenError: anAssertBlock

[ codeBlock value.
	self fail ]
		on: exceptionCode 
		do: anAssertBlock 
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'AJ 5/17/2021 20:52:49'!
checkThatBook:aCustomerBook shouldHaveThisManyActiveCustomers: activeCustomers andSuspendedCustomers:suspendedCustomers andTotalCustomers: totalCustomers

	self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalCustomers equals: aCustomerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'AJ 5/17/2021 20:05:52'!
createBookWithCustomer: customerName

	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: customerName.
	^customerBook.

! !

!CustomerBookTest methodsFor: 'helpers' stamp: 'AJ 5/17/2021 20:06:12'!
createBookWithCustomerAndSuspend: customerName

	| customerBook |
	customerBook := self createBookWithCustomer: customerName.
	customerBook suspendCustomerNamed: customerName.
	^customerBook.

! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'AJ 5/17/2021 20:33:48'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AJ 5/17/2021 19:58:50'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent:[
			^NotFound signal.]
		].
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AJ 5/17/2021 21:10:47'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'AJ 5/17/2021 20:22:02'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.
	! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'AJ 5/17/2021 21:11:24'!
isEmpty
	^self numberOfCustomers <= 0
	
	"^active isEmpty and: [ suspended isEmpty ]"! !


!CustomerBook methodsFor: 'signal errors' stamp: 'juan 5/19/2021 17:25:38'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'juan 5/19/2021 17:25:48'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage.
	! !

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
