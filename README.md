## SUnit extra assertions

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

### A float number is equal to another float number with a precision value
`self assert: (0.3) isNearTo: (0.1 + 0.2)`

`self assert: originalNumber isNearTo: newValue withPrecision: precision`

Also you have the negative assertions:

`self assert: originalNumber isNotNearTo: newValue`

`self assert: originalNumber isNotNearTo: newValue withPrecision: precision`

### A collection includes an element

`self assert: #() includes: 1`

Will raise a nice error message
