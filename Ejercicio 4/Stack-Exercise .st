!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AJ 6/9/2021 19:14:38'!
test01EmptyPrefixIsSent
 	|finder stack|
	finder _ SentenceFinderByPrefix new.
	stack _ OOStack new.
	
	[ finder find:''inStack:stack.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = SentenceFinderByPrefix
			 prefixEmptyErrorDescription .]
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AJ 6/9/2021 19:11:07'!
test02sendPrefixWithSpace
	|finder stack|
	finder _ SentenceFinderByPrefix new.
	stack _ OOStack new.
	
	[ finder find: 'hello word' inStack: stack.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = SentenceFinderByPrefix
			 prefixWithSpaceErrorDescription .]
	
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AJ 6/9/2021 19:14:52'!
test03sendPrefixOnEmptyStack
	|finder stack list|
	finder _ SentenceFinderByPrefix new.
	stack _ OOStack new.
	list _ finder find: 'hola' inStack: stack.
	self assert: list size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AJ 6/9/2021 19:15:09'!
test04sendPrefixThatIsNotOnTheStack
	| finder stack firstPushedObject secondPushedObject list|
	finder _ SentenceFinderByPrefix new.
	stack _ OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	stack push: firstPushedObject .
	stack push: secondPushedObject.
	list _ finder find: 'hola' inStack: stack.
	self assert: (list size) = 0.
	self assert: (stack pop) = secondPushedObject.
	self assert: (stack pop) = firstPushedObject.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AJ 6/9/2021 19:15:18'!
test05sendPrefixThatIsInTheWholeStack
	| finder stack firstPushedObject secondPushedObject list|
	finder _ SentenceFinderByPrefix new.
	stack _ OOStack new.
	firstPushedObject := 'hola mundo'.
	secondPushedObject := 'hola mundo verde'.
	stack push: firstPushedObject .
	stack push: secondPushedObject.
	list _ finder find: 'hola' inStack: stack.
	self assert: (list size) = 2.
	self assert: (list at: 2) = firstPushedObject.
	self assert: (list at: 1) = secondPushedObject .
	self assert: (stack pop) = secondPushedObject.
	self assert: (stack pop) = firstPushedObject.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'juan 6/7/2021 19:33:00'!
initialize

	contents _ OrderedCollection new.! !


!OOStack methodsFor: 'testing' stamp: 'juan 6/7/2021 19:40:19'!
isEmpty
	^contents  isEmpty 
	! !

!OOStack methodsFor: 'testing' stamp: 'juan 6/7/2021 20:45:36'!
notEmpty
	^contents notEmpty.! !


!OOStack methodsFor: 'flag' stamp: 'AJ 6/6/2021 16:04:16'!
flagThatStackIsEmpty
	
	self error: self class stackEmptyErrorDescription ! !


!OOStack methodsFor: 'condition' stamp: 'juan 6/7/2021 20:09:03'!
condition
	^ OOStackConditions conditionFor: self.! !


!OOStack methodsFor: 'operations' stamp: 'AJ 6/6/2021 11:43:08'!
pop
	| top |
	
	top := self top.
	contents removeLast.
	
	^ top.! !

!OOStack methodsFor: 'operations' stamp: 'AJ 6/6/2021 11:40:55'!
push: anObject

	contents add: anObject.! !

!OOStack methodsFor: 'operations' stamp: 'juan 6/7/2021 20:49:22'!
top
	^self condition top.! !

!OOStack methodsFor: 'operations' stamp: 'AJ 6/9/2021 19:17:28'!
topWhenEmpty
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operations' stamp: 'AJ 6/9/2021 19:17:07'!
topWhenNotEmpty
	^ contents last.! !


!OOStack methodsFor: 'accessing' stamp: 'juan 6/7/2021 19:37:06'!
size

	^ contents size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackConditions category: 'Stack-Exercise'!
Object subclass: #OOStackConditions
	instanceVariableNames: 'Stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackConditions methodsFor: 'initialization' stamp: 'juan 6/7/2021 20:00:27'!
initializeFor: stack
	Stack _ stack.

    ! !


!OOStackConditions methodsFor: 'operations' stamp: 'juan 6/7/2021 20:05:47'!
top
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackConditions class' category: 'Stack-Exercise'!
OOStackConditions class
	instanceVariableNames: ''!

!OOStackConditions class methodsFor: 'as yet unclassified' stamp: 'juan 6/7/2021 19:56:55'!
canHandle: stack
	self subclassResponsibility.! !

!OOStackConditions class methodsFor: 'as yet unclassified' stamp: 'juan 6/7/2021 20:07:54'!
conditionFor: stack

    ^(self subclasses detect: 
	[:aStackConditionsClass | aStackConditionsClass canHandle: stack ]) for: stack! !

!OOStackConditions class methodsFor: 'as yet unclassified' stamp: 'juan 6/7/2021 19:58:33'!
for: stack

    ^self new initializeFor: stack! !


!classDefinition: #OOStackEmptyConditions category: 'Stack-Exercise'!
OOStackConditions subclass: #OOStackEmptyConditions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmptyConditions methodsFor: 'operations' stamp: 'AJ 6/9/2021 19:17:28'!
top
	^Stack topWhenEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmptyConditions class' category: 'Stack-Exercise'!
OOStackEmptyConditions class
	instanceVariableNames: ''!

!OOStackEmptyConditions class methodsFor: 'as yet unclassified' stamp: 'juan 6/7/2021 19:55:18'!
canHandle: stack
	^stack isEmpty.
	! !


!classDefinition: #OOStackNotEmptyConditions category: 'Stack-Exercise'!
OOStackConditions subclass: #OOStackNotEmptyConditions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmptyConditions methodsFor: 'operations' stamp: 'AJ 6/9/2021 19:17:07'!
top
	^Stack topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmptyConditions class' category: 'Stack-Exercise'!
OOStackNotEmptyConditions class
	instanceVariableNames: ''!

!OOStackNotEmptyConditions class methodsFor: 'as yet unclassified' stamp: 'juan 6/7/2021 19:55:57'!
canHandle: stack
	^stack notEmpty.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'AJ 6/9/2021 19:08:32'!
find: aPrefix inStack: aStack
       |list|
	aPrefix isEmpty ifTrue: [self emptyPrefixSignal].
	(self prefixWithEmptySpaces: aPrefix) ifTrue:[self prefixSignalSpace ].
	list _ self searchIn: aStack thePrefix: aPrefix. 
	
	^list.
	
	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'juan 6/9/2021 03:36:49'!
prefixWithEmptySpaces: prefix
	|prefixTop index thereIsSpace|
	prefixTop _ prefix size.
	index _ 1.
	thereIsSpace _ false.
	[index <= prefixTop]whileTrue: [
		(prefix at: index) isSeparator ifTrue:[thereIsSpace := true.].
		index _ index + 1.
		].
	^thereIsSpace.
	
	 
	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'juan 6/9/2021 04:57:27'!
reorder: stack basedOn: stackAuxiliary
	|sentence|
	[stackAuxiliary isEmpty]whileFalse:[
		sentence _ stackAuxiliary pop.
		stack push: sentence.
		]! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'juan 6/9/2021 04:37:45'!
searchIn: stack thePrefix: prefix
	|list stackAuxiliary sentence topPrefix|
	list _ OrderedCollection new.
	stackAuxiliary _ OOStack new.
	topPrefix _ prefix size.
	[stack isEmpty]whileFalse:[
		sentence _ stack pop.
		((sentence commonPrefixWith: prefix) = topPrefix) ifTrue:[
			list add: sentence].
		stackAuxiliary push: sentence.
		].
	self reorder: stack basedOn: stackAuxiliary.
	^list.
	
	! !


!SentenceFinderByPrefix methodsFor: 'signal errors' stamp: 'juan 6/9/2021 03:04:11'!
emptyPrefixSignal
	self error: self class prefixEmptyErrorDescription.! !

!SentenceFinderByPrefix methodsFor: 'signal errors' stamp: 'juan 6/9/2021 03:13:48'!
prefixSignalSpace
	self error: self class prefixWithSpaceErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'juan 6/9/2021 02:42:45'!
prefixEmptyErrorDescription
	^'the prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'juan 6/9/2021 02:43:50'!
prefixWithSpaceErrorDescription
	^'in the prefix there is space'! !
