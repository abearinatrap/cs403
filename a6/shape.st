Object subclass: Shape [
	| name |

	Shape class >> new: tempName [
		<category: 'instance creation'>
		| r |
		r := super new.
		r setName: tempName.
		^r
	]

	setName: aString [
		name := aString
	]

	getName [
		^ name
	]

	getArea [
		self subclassResponsibility
	]

	getVolume [
		self subclassResponsibility
	]

	test: aCondition [
		self subclassResponsibility
	]

	getInfo [
		self subclassResponsibility
	]
	
]