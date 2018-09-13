'From Cuis 5.0 of 7 November 2016 [latest update: #3430] on 13 September 2018 at 6:41:53 am'!
'Description Please enter a description for this package'!
!provides: 'SemanticAssertions' 1 2!
SystemOrganization addCategory: #SemanticAssertions!


!classDefinition: #SemanticAssertions category: #SemanticAssertions!
TestCase subclass: #SemanticAssertions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SemanticAssertions'!
!classDefinition: 'SemanticAssertions class' category: #SemanticAssertions!
SemanticAssertions class
	instanceVariableNames: ''!


!SemanticAssertions methodsFor: 'testing' stamp: 'GC 9/13/2018 05:58:35'!
test01assertABlockDoesNotChangesAnAssertion

	|aCollection|

	aCollection := OrderedCollection with: 1.
	
	self assert: [ aCollection sum ] doesNotChange: [ aCollection size ]! !

!SemanticAssertions methodsFor: 'testing' stamp: 'GC 9/13/2018 05:59:29'!
test02assertABlockChangesAnAssertion

	|aCollection|

	aCollection := OrderedCollection new.
	
	self assert: [ aCollection add: 1 ] changes: [ aCollection size ]! !

!SemanticAssertions methodsFor: 'testing' stamp: 'GC 9/13/2018 06:28:34'!
test03assertABlockChangesAnAssertionByAnAmount

	|aCollection|

	aCollection := OrderedCollection new.
	
	self assert: [ aCollection add: 1; add: 2 ] changes: [ aCollection size ] by: 2! !

!SemanticAssertions methodsFor: 'testing' stamp: 'GC 9/13/2018 06:34:47'!
test04assertABlockChangesAnAssertionFromAnAmountToAnotherAmount

	|aCollection|

	aCollection := OrderedCollection with: 1.
	
	self assert: [ aCollection add: 2 ] changes: [ aCollection size ] from: 1 to: 2! !

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
