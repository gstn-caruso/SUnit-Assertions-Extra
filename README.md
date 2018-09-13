## Semantic assertions

These are assertions (or matchers) for SUnit written for cuis Smalltalk inspired by some of the marchers of RSpec.

## Current list of assertions

### An action changes something

`self assert: [ aCollection add: 1 ] changes: [ aCollection size ]`

Also the opposite is included:

`self assert: [ aCollection sum ] doesNotChange: [ aCollection size ]`

