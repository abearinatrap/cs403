Shape subclass: Torus [
	| smallradius bigradius |

	Torus class >> new: tempName smallradius: tempRadius bigradius: tempRadiusb [
		| r |
		r := super new.
		r setName: tempName.
		r setSmallRadius: tempRadius.
      r setBigRadius: tempRadiusb.
		^r
	]

	setSmallRadius: tempRadius [
		smallradius := tempRadius
	]

	getSmallRadius [
		^ smallradius
	]

   setBigRadius: tempRadius [
		bigradius := tempRadius
	]

	getBigRadius [
		^ bigradius
	]

	getArea [
		^ 2 * 2 * 3.14 * 3.14 * bigradius * smallradius
	]

	getVolume [
		^ 2 * 3.14 * 3.14 * smallradius * smallradius * bigradius
	]
		
	test: condlist [

	]

	getInfo [
		^ 'Torus: ' , self getName , ', Small Radius=' , smallradius printString, ', Big Radius=' , bigradius printString
	]

]