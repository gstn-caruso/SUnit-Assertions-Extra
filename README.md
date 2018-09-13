## Semantic assertions

These are assertions (or matchers) for SUnit written for cuis Smalltalk inspired by some of the marchers of RSpec.

## How to use it

Just import it, these matchers extends TestCase.

## Current list of assertions

### An action changes something

`self assert: [ aCollection add: 1 ] changes: [ aCollection size ]`

Also the opposite is included:

`self assert: [ aCollection sum ] doesNotChange: [ aCollection size ]`

And the parametric versions:

`self assert: [ aCollection add: 1; add: 2 ] changes: [ aCollection size ] by: 2`

```
aCollection := OrderedCollection with: 1.
self assert: [ aCollection add: 2 ] changes: [ aCollection size ] from: 1 to: 2
```