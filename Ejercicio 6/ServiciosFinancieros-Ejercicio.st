!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 20:51:22'!
test01EmptyPortfolioHasBalance0
	|portfolio|
	portfolio  _ Portfolio new.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:24:45'!
test02AddAnAccountToEmptyPortfolio
	|portfolio account|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	portfolio add: account.
	
	self assert: 1 equals: portfolio accounts.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:27:43'!
test03BalanceOfAPortfolioAccount
	|portfolio account|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio add: account.
	
	self assert: (100 * peso) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:30:32'!
test04BalanceWithSomeAccountsInPortfolio
	|portfolio account account2 deposit deposit2|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	portfolio add: account.
	deposit2 _ Deposit register: 100 * peso on: account2.
	portfolio add: account2.
	
	self assert: (200 * peso) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:31:37'!
test05SavePortfolioToPortfolio
	|portfolio portfolio2|
	portfolio  _ Portfolio new.
	portfolio2  _ Portfolio new.
	portfolio add: portfolio2 .
	
	self assert: 1 equals: portfolio accounts.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:34:53'!
test06CalculateBalanceWithAccountAndEmptyPortfolio
	|portfolio account portfolio2|
	portfolio  _ Portfolio new.
	portfolio2  _ Portfolio new.
	account  _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio add: account.
	portfolio2  add: account.
	
	self assert: (100 * peso) equals: portfolio2 balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:35:45'!
test07CalculateBalanceWithFullAccountAndPortfolio
	|portfolio account account2 transfer|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio add: account.
	Deposit register: 100 * peso on: account2.
	portfolio add: account2.
	transfer:=Transfer register: 100 * peso on: account to: account2.
	
	self assert: (200 * peso) equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:36:43'!
test08SearchPortfolioTransaction
	|portfolio account deposit|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:38:25'!
test09SearchForNonExistentTransactionInPortfolio
	|portfolio account account2 deposit deposit2|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	portfolio add: account.
	deposit2 _ Deposit register: 100 * peso on: account2.
	
	
	self deny: (portfolio hasRegistered: deposit2).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:41:41'!
test10ASingleTransactionInTotalWithinThePortfolio
	|portfolio account deposit|
	portfolio  _ Portfolio new.
	account  _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	portfolio add: account.
	
	self assert: 1 equals: portfolio transactions size.
	self assert: (portfolio transactions includes: deposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:42:26'!
test11SeveralTransactionsInTotalWithinThePortfolio
	|portfolio account portfolio2 deposit account2|
	portfolio  _ Portfolio new.
	portfolio2  _ Portfolio new.
	account  _ ReceptiveAccount new.
	account2  _ ReceptiveAccount new.
	deposit _ Deposit register: 100 * peso on: account.
	portfolio add: account.
	Deposit register: 100 * peso on: account2.
	portfolio2 add: account2.
	portfolio add: portfolio2.
	
	self assert: 2 equals: portfolio transactions size.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AJ 7/4/2021 11:40:55'!
test01ATransferDiminishesBalanceFromSendingAccount


	| account anotherAccount |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Transfer register: 100 * peso on: account to: anotherAccount.
		
	self assert: -100 * peso equals: account balance .
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AJ 7/4/2021 11:41:02'!
test02ATransferAddsBalanceToReceivingAccount


	| account anotherAccount |
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	Transfer register: 100 * peso on: account to: anotherAccount.
		
	self assert: 100 * peso equals: anotherAccount balance .
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AJ 7/4/2021 11:41:09'!
test03ATransferSavesTransferValue


	| account anotherAccount transfer|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	
	transfer:=Transfer register: 100 * peso on: account to: anotherAccount.
		
	self assert: 100 * peso equals: transfer value .
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'juan 7/4/2021 12:16:53'!
test04ATransferSavesSendingOperation


	| account anotherAccount transfer withdraw|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	withdraw := Withdraw register: 100 * peso on: account.
	transfer:=Transfer register: 100 *peso on: account to: anotherAccount.
	
	 self assert: (transfer sending  isKindOf: Withdraw).
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'juan 7/4/2021 12:42:51'!
test05ATransferSavesSendingOperatio


	| account anotherAccount transfer withdraw|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	withdraw := Withdraw register: 100 * peso on: account.
	transfer:=Transfer register: 100 *peso on: account to: anotherAccount.
	
	 self assert: (transfer sending  isKindOf: Withdraw).
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'juan 7/4/2021 12:46:16'!
test06SendingCounterpart


	| account anotherAccount transfer|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	transfer:=Transfer register: 100 *peso on: account to: anotherAccount.
	
	 self assert: (transfer sending counterpart isKindOf: Deposit).
	! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'juan 7/4/2021 12:47:11'!
test07ReceptionCounterpart


	| account anotherAccount transfer|
	
	account := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	transfer:=Transfer register: 100 *peso on: account to: anotherAccount.
	
	 self assert: (transfer reception counterpart isKindOf: Withdraw ).
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AJ 7/4/2021 10:50:27'!
affectBalance: aBalance

	self subclassResponsibility .! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'AJ 7/4/2021 10:50:05'!
affectBalance: aBalance

	^aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #DepositTransfer category: 'ServiciosFinancieros-Ejercicio'!
Deposit subclass: #DepositTransfer
	instanceVariableNames: 'withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 19:57:16'!
counterpart
	^withdraw.! !

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 19:57:26'!
myCounterpart:acounterpart
	withdraw := acounterpart.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'AJ 7/4/2021 10:50:17'!
affectBalance: aBalance

	^aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawTransfer category: 'ServiciosFinancieros-Ejercicio'!
Withdraw subclass: #WithdrawTransfer
	instanceVariableNames: 'deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 19:58:05'!
counterpart
	^deposit .! !

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 19:57:56'!
myCounterpart:acounterpart
	deposit := acounterpart.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'Accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/5/2021 20:51:20'!
accounts
	^Accounts size.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/5/2021 20:51:00'!
add: aAccount
	Accounts add: aAccount.
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:21:39'!
addTransactionTo: atransactions
	Accounts do: [ :anAccount | anAccount addTransactionTo: atransactions]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/5/2021 21:00:28'!
balance
	^Accounts sum: [ :aTransaction | aTransaction balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/5/2021 21:26:43'!
hasRegistered: aTransaction
	^Accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/5/2021 20:50:42'!
initialize
	Accounts _ OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 21:16:40'!
transactions
	| transactions |

    	transactions := OrderedCollection new.
	Accounts do: [ :anAccount | anAccount addTransactionTo: transactions ].
    	^transactions! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'juan 7/7/2021 21:18:25'!
addTransactionTo:atransactions
	atransactions addAll: self transactions.
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AJ 7/4/2021 10:51:37'!
balance
	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value sending reception'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'juan 7/4/2021 12:37:41'!
initializeFor: anAmount withSending: aTransferSending withReceiving: aTranserReceiving
	
	
	value := anAmount.
	sending := aTransferSending.
	reception := aTranserReceiving.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AJ 7/4/2021 11:31:49'!
reception
	^reception ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AJ 7/4/2021 11:31:58'!
sending
	^sending .! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AJ 7/4/2021 11:31:40'!
value
	^value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'juan 7/7/2021 19:58:39'!
register: anAmount on: aSenderAccount to: aReceiverAccount 
	
	
	| transaction sending receiving  |
	
	
	transaction := self new.
	sending:= WithdrawTransfer  register: anAmount on: aSenderAccount.
	receiving:= DepositTransfer register: anAmount on: aReceiverAccount.
	sending myCounterpart: receiving.
	receiving  myCounterpart: sending.
	transaction := transaction initializeFor: anAmount withSending: sending withReceiving: receiving.
	^ transaction! !
