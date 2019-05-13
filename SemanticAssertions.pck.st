'From Cuis 5.0 of 7 November 2016 [latest update: #3741] on 13 May 2019 at 12:40:33 am'!
'Description Please enter a description for this package'!
!provides: 'SemanticAssertions' 1 5!
SystemOrganization addCategory: #'SemanticAssertions-Test'!


!classDefinition: #SemanticAssertionsTest category: #'SemanticAssertions-Test'!
TestCase subclass: #SemanticAssertionsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemanticAssertions-Test'!
!classDefinition: 'SemanticAssertionsTest class' category: #'SemanticAssertions-Test'!
SemanticAssertionsTest class
	instanceVariableNames: ''!


!SemanticAssertionsTest methodsFor: 'changes' stamp: 'GC 9/13/2018 05:58:35'!
test01assertABlockDoesNotChangesAnAssertion

	|aCollection|

	aCollection := OrderedCollection with: 1.
	
	self assert: [ aCollection sum ] doesNotChange: [ aCollection size ]! !

!SemanticAssertionsTest methodsFor: 'changes' stamp: 'GC 9/13/2018 05:59:29'!
test02assertABlockChangesAnAssertion

	|aCollection|

	aCollection := OrderedCollection new.
	
	self assert: [ aCollection add: 1 ] changes: [ aCollection size ]! !

!SemanticAssertionsTest methodsFor: 'changes' stamp: 'GC 9/13/2018 06:28:34'!
test03assertABlockChangesAnAssertionByAnAmount

	|aCollection|

	aCollection := OrderedCollection new.
	
	self assert: [ aCollection add: 1; add: 2 ] changes: [ aCollection size ] by: 2! !

!SemanticAssertionsTest methodsFor: 'changes' stamp: 'GC 9/13/2018 06:34:47'!
test04assertABlockChangesAnAssertionFromAnAmountToAnotherAmount

	|aCollection|

	aCollection := OrderedCollection with: 1.
	
	self assert: [ aCollection add: 2 ] changes: [ aCollection size ] from: 1 to: 2! !

!SemanticAssertionsTest methodsFor: 'assert is near to' stamp: 'GC 9/22/2018 13:44:29'!
test05assertAFloatIsNearToAnotherFloatWithSameValue
	
	self assert: 1.5 isNearTo: 1.5! !

!SemanticAssertionsTest methodsFor: 'assert is near to' stamp: 'GC 9/22/2018 15:23:59'!
test06assertAFloatIsNearToAnotherFloatWithSameValueAsResultOfASum
	
	self assert: (0.3) isNearTo: (0.1 + 0.2)! !

!SemanticAssertionsTest methodsFor: 'assert is near to' stamp: 'GC 9/22/2018 15:49:09'!
test07assertAFloatIsNearToAnotherFloatWithSameValuePlusANumberSmallerThanAGivenPrecision
	
	|precision newValue originalNumber |
	
	precision _ 0.1.
	originalNumber _ 0.3.
	newValue _ originalNumber + 0.01.
	
	self assert: originalNumber isNearTo: newValue withPrecision: precision! !

!SemanticAssertionsTest methodsFor: 'assert is near to' stamp: 'GC 9/22/2018 15:51:58'!
test08assertAFloatIsNotNearToAnotherFloatWithSameValuePlusANumberGreaterThanAGivenPrecision
	
	|precision newValue originalNumber |
	
	precision _ 0.1.
	originalNumber _ 0.3.
	newValue _ originalNumber + (precision + 0.001).
	
	self assert: originalNumber isNotNearTo: newValue withPrecision: precision! !

!SemanticAssertionsTest methodsFor: 'includes' stamp: 'GC 5/10/2019 02:17:26'!
test09assertEmptyCollectionDoesNotIncludeAnyElement
	
	| collection anElement |
	
	anElement _ 1.
	collection _ #().
	
	self should: [ self assert: collection includes: anElement ] 
		 raise: TestFailure 
		 withMessageText: collection asString, ' does not include ', anElement asString! !

!SemanticAssertionsTest methodsFor: 'includes' stamp: 'GC 5/10/2019 02:23:17'!
test10assertEmptyCollectionDoesNotIncludeNil
	
	| collection anElement |
	
	anElement _ nil.
	collection _ #().
	
	self should: [ self assert: collection includes: anElement ] 
		 raise: TestFailure 
		 withMessageText: collection asString, ' does not include ', anElement asString! !

!SemanticAssertionsTest methodsFor: 'includes' stamp: 'GC 5/10/2019 02:24:08'!
test11assertIncludesPassWhenTheCollectionContainsTheExpectedElement
	
	| collection anElement |
	
	anElement _ 1.
	collection _ Array with: anElement.
	
	self shouldnt: [ self assert: collection includes: anElement ] 
		 raise: TestFailure! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/13/2018 06:40:38'!
assert: anAction changes: aCondition 
	|after before|
	
	before := aCondition value.
	anAction value.
	after := aCondition value.
	
	self deny: after = before! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/13/2018 06:41:06'!
assert: anAction changes: aCondition by: anAmount 
	|after before|
	
	before := aCondition value.
	anAction value.
	after := aCondition value.
	
	self assert: after equals: before + anAmount! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/13/2018 06:41:16'!
assert: anAction changes: aCondition from: anInitialAmount to: aFinalAmount 
	|after before|
	
	before := aCondition value.
	anAction value.
	after := aCondition value.
	
	self assert: before equals: anInitialAmount.
	self assert: after equals: aFinalAmount! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/13/2018 06:41:22'!
assert: anAction doesNotChange: aCondition 
	|after before|
	
	before := aCondition value.
	anAction value.
	after := aCondition value.
	
	self assert: after equals: before! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 5/10/2019 02:22:15'!
assert: aCollection includes: anObject 
	
	^ [ self assert: (aCollection includes: anObject) ]
		on: TestFailure 
		do: [ self failWith: aCollection asString, ' does not include ', anObject asString ]! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/22/2018 15:50:34'!
assert: aFloatNumber isNearTo: anotherFloatNumber 
	| aPrecisionValue |
	
	aPrecisionValue _ 0.002.
	
	self assert: aFloatNumber isNearTo: anotherFloatNumber withPrecision: aPrecisionValue ! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/22/2018 15:55:15'!
assert: aFloatNumber isNearTo: anotherFloatNumber withPrecision: aPrecisionValue 
	self assert: (self is: aFloatNumber biggerThan: anotherFloatNumber withPrecision: aPrecisionValue)! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/22/2018 15:54:55'!
assert: aFloatNumber isNotNearTo: anotherFloatNumber 
	|aPrecisionValue|
	
	aPrecisionValue _ 0.002.
	
	self assert: aFloatNumber isNotNearTo: anotherFloatNumber withPrecision: aPrecisionValue! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/22/2018 15:54:23'!
assert: aFloatNumber isNotNearTo: anotherFloatNumber withPrecision: aPrecisionValue 

	self deny: (self is: aFloatNumber biggerThan: anotherFloatNumber withPrecision: aPrecisionValue)
! !

!TestCase methodsFor: '*SemanticAssertions' stamp: 'GC 9/22/2018 15:53:58'!
is: aFloatNumber biggerThan: anotherFloatNumber withPrecision: aPrecisionValue

	^ (aFloatNumber - anotherFloatNumber) abs < (aPrecisionValue * (aFloatNumber abs max: anotherFloatNumber abs))! !
