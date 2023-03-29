Shape subclass: Sphere [
	| radius |

	Sphere class >> new: tempName radius: tempRadius [
		| r |
		r := super new.
		r setName: tempName.
		r setRadius: tempRadius.
		^r
	]

	setRadius: tempRadius [
		radius := tempRadius
	]

	getRadius [
		^ radius
	]

	getArea [
		^ 4 * 3.14 * radius * radius
	]

	getVolume [
		^ 4/3 * 3.14 * radius * radius * radius
	]
		
	test: condlist [

	]

	getInfo [
		^ 'Sphere: ' , self getName , ' Radius=' , radius printString
	]

]