!classDefinition: #TestMarsRover category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:14:01'!
test01AffirmThatTheLogKeptTheCorrectCoordinate
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #North.
	log _ MarsRoversLog new.
	marsRovers addPositionObservers: log.
	marsRovers processCommands: 'b'.
	
	self assert: '0@-1' equals: log first.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:15:44'!
test02AffirmThatTheLogKeptTheNorthCardinalPoint
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #West.
	log _ MarsRoversLog new.
	marsRovers addHeadObservers: log.
	marsRovers processCommands: 'r'.
	
	self assert: 'North' equals: log first.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:16:54'!
test03AffirmThatTheLogKeptTheSouthCardinalPoint
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #East.
	log _ MarsRoversLog new.
	marsRovers addHeadObservers: log.
	marsRovers processCommands: 'r'.
	
	self assert: 'South' equals: log first.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:17:32'!
test04AffirmThatTheLogKeptTheEastCardinalPoint
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #North.
	log _ MarsRoversLog new.
	marsRovers addHeadObservers: log.
	marsRovers processCommands: 'r'.
	
	self assert: 'East' equals: log first.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:18:02'!
test05AffirmThatTheLogKeptTheWestCardinalPoint
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #South.
	log _ MarsRoversLog new.
	marsRovers addHeadObservers: log.
	marsRovers processCommands: 'r'.
	
	self assert: 'West' equals: log first.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:18:55'!
test06AffirmThatTheLogKeptTheCardinalPointAndTheCoordinate
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #South.
	log _ MarsRoversLog new.
	marsRovers addHeadObservers: log.
	marsRovers addPositionObservers: log.
	marsRovers processCommands: 'fr'.
	
	self assert: '0@-1' equals: log first.
	self assert: 'West' equals: log second.! !

!TestMarsRoverLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:24:40'!
test07AffirmThatTheLogDidNotSaveAnythingIfTheMarsRoverDidNotMove
	|marsRovers log|
	marsRovers _ MarsRover startingAt: 0@0 heading: #South.
	log _ MarsRoversLog new.
	marsRovers addHeadObservers: log.
	marsRovers addPositionObservers: log.
	marsRovers processCommands: ''.
	
	self assert: 0 equals: log showLog size.! !


!classDefinition: #TestMarsRoverWindows category: 'MarsRover-ElRegreso'!
TestCase subclass: #TestMarsRoverWindows
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:25:39'!
test01AffirmThatTheWindowsKeptTheCorrectCoordinate
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #North.
	windows _ MarsRoversWindows new.
	marsRovers  addPositionObservers:  windows.
	marsRovers processCommands: 'f'.
	
	self assert: '0@1' equals: windows positions.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:29:14'!
test02AssertThatHeadFacingNorthAndTurnLeftWindowShowsWest
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #North.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'l'.
	
	self assert: 'West' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:31:05'!
test03AssertThatHeadFacingWestAndTurnLeftWindowShowsSouth
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #West.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'l'.
	
	self assert: 'South' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:30:16'!
test04AssertThatHeadFacingEastAndTurnLeftWindowShowsNorth
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #East.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'l'.
	
	self assert: 'North' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:31:56'!
test05AssertThatHeadFacingSouthAndTurnLeftWindowShowsEast
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #South.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'l'.
	
	self assert: 'East' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:33:12'!
test06AffirmThatHeadFacingNorthAndTurnRightWindowShowsEast
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #North.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'r'.
	
	self assert: 'East' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:33:51'!
test07AffirmThatHeadFacingEastAndTurnRightWindowShowsSouth
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #East.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'r'.
	
	self assert: 'South' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:34:35'!
test08AffirmThatHeadFacingWestAndTurnRightWindowShowsNorth
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #West.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'r'.
	
	self assert: 'North' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:35:02'!
test09AffirmThatHeadFacingSouththAndTurnRightWindowShowsWest
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #South.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers processCommands: 'r'.
	
	self assert: 'West' equals: windows headState.! !

!TestMarsRoverWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 16:35:58'!
test10AffirmWhichWindowShowsPositionAndHead
	|marsRovers windows|
	marsRovers _ MarsRover startingAt: 0@0 heading: #North.
	windows _ MarsRoversWindows new.
	marsRovers  addHeadObservers: windows.
	marsRovers  addPositionObservers:  windows.
	marsRovers processCommands: 'fl'.
	self assert: '0@1' equals: windows positions.
	self assert: 'West' equals: windows headState.! !


!classDefinition: #MarsRover category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionObservers headingObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRover methodsFor: 'initialization' stamp: 'juan 7/22/2021 00:06:49'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := aPosition.
	head := MarsRoverHead of: self facing: aCardinalPoint.
	positionObservers _ OrderedCollection new.
	headingObservers  _ OrderedCollection new.
	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'juan 7/21/2021 21:10:11'!
moveDown
	self updateRecordsAndUpdatePositionAdding: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'juan 7/21/2021 21:10:11'!
moveLeft
	self updateRecordsAndUpdatePositionAdding: (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'juan 7/21/2021 21:10:11'!
moveRight
	self updateRecordsAndUpdatePositionAdding: (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'juan 7/21/2021 21:10:11'!
moveUp
	self updateRecordsAndUpdatePositionAdding: (0@1).
! !

!MarsRover methodsFor: 'dd - moving' stamp: 'juan 7/22/2021 16:09:47'!
updateRecordsAndUpdatePositionAdding: coordinate
	position := position + coordinate.
	positionObservers do:[:externalposition | externalposition positionChangeTo: position].
	
! !


!MarsRover methodsFor: 'dd - heading' stamp: 'juan 7/22/2021 16:00:48'!
headEast

	head := MarsRoverHeadFacingEast of: self.
	self updateRecords! !

!MarsRover methodsFor: 'dd - heading' stamp: 'juan 7/22/2021 16:00:42'!
headNorth

	head := MarsRoverHeadFacingNorth of: self.
	self updateRecords! !

!MarsRover methodsFor: 'dd - heading' stamp: 'juan 7/22/2021 16:00:36'!
headSouth

	head := MarsRoverHeadFacingSouth of: self.
	self updateRecords! !

!MarsRover methodsFor: 'dd - heading' stamp: 'juan 7/22/2021 16:00:23'!
headWest

	head := MarsRoverHeadFacingWest of: self.
	self updateRecords! !

!MarsRover methodsFor: 'dd - heading' stamp: 'juan 7/22/2021 16:00:23'!
updateRecords
	headingObservers do:[:aHeadingObservers | aHeadingObservers headingChangeTo: head].! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 12:56:04'!
addHeadObservers: aLogger
	headingObservers add: aLogger.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 13:00:01'!
addPositionObservers: aLogger
	positionObservers add: aLogger.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-ElRegreso'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-ElRegreso'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-ElRegreso'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-ElRegreso'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoversLog category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoversLog
	instanceVariableNames: 'registers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoversLog methodsFor: 'as yet unclassified' stamp: 'juan 7/21/2021 23:44:05'!
first
	^registers first asString.! !

!MarsRoversLog methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 00:11:58'!
headingChangeTo: aHead
	(aHead isKindOf: MarsRoverHeadFacingEast) ifTrue: [^registers add: 'East'].
	(aHead isKindOf: MarsRoverHeadFacingNorth) ifTrue: [^registers add: 'North'].
	(aHead isKindOf: MarsRoverHeadFacingSouth) ifTrue: [^registers add: 'South'].
	^registers add: 'West'.! !

!MarsRoversLog methodsFor: 'as yet unclassified' stamp: 'juan 7/19/2021 20:37:52'!
initialize
	registers _ OrderedCollection new.! !

!MarsRoversLog methodsFor: 'as yet unclassified' stamp: 'juan 7/21/2021 23:53:50'!
positionChangeTo: aCoordinate
	registers add: aCoordinate.! !

!MarsRoversLog methodsFor: 'as yet unclassified' stamp: 'juan 7/21/2021 23:44:17'!
second
	^registers second asString.! !

!MarsRoversLog methodsFor: 'as yet unclassified' stamp: 'juan 7/19/2021 20:39:39'!
showLog
	^registers.! !


!classDefinition: #MarsRoversWindows category: 'MarsRover-ElRegreso'!
Object subclass: #MarsRoversWindows
	instanceVariableNames: 'marsRoverPosition marsRoverhead'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-ElRegreso'!

!MarsRoversWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/21/2021 21:03:26'!
headState
	^marsRoverhead.! !

!MarsRoversWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/22/2021 00:10:49'!
headingChangeTo: aHead
	(aHead isKindOf: MarsRoverHeadFacingEast) ifTrue: [^marsRoverhead _ 'East'].
	(aHead isKindOf: MarsRoverHeadFacingNorth) ifTrue: [^marsRoverhead _ 'North'].
	(aHead isKindOf: MarsRoverHeadFacingSouth) ifTrue: [^marsRoverhead _ 'South'].
	^marsRoverhead _ 'West'.! !

!MarsRoversWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/21/2021 23:54:18'!
positionChangeTo: aPosition
	marsRoverPosition _ aPosition asString.! !

!MarsRoversWindows methodsFor: 'as yet unclassified' stamp: 'juan 7/21/2021 20:52:37'!
positions
	^marsRoverPosition.! !
