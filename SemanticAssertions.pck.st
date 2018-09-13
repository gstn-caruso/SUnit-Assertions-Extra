'From Cuis 5.0 of 7 November 2016 [latest update: #3430] on 13 September 2018 at 6:02:52 am'!
'Description Please enter a description for this package'!
!provides: 'SemanticAssertions' 1 0!
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

!SemanticAssertions methodsFor: 'assertions' stamp: 'GC 9/13/2018 05:57:14'!
assert: anAction changes: aCondition 
	|after before|
	
	before := aCondition value.
	anAction value.
	after := aCondition value.
	
	self deny: after = before! !

!SemanticAssertions methodsFor: 'assertions' stamp: 'GC 9/13/2018 06:00:41'!
assert: anAction doesNotChange: aCondition 
	|after before|
	
	before := aCondition value.
	anAction value.
	after := aCondition value.
	
	self assert: after equals: before! !
