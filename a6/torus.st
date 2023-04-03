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
		^ 2 * 2 * Float pi * Float pi * bigradius * smallradius
	]

	getVolume [
		^ 2 * Float pi * Float pi * smallradius * smallradius * bigradius
	]
		
	test: condlist [
		| sz |
		sz := condlist size.
		1 to: sz do: [:i |
			| currentCond name op val shapename bad |
			currentCond := condlist at: i.
			shapename := 'torus'.
			name := currentCond at: 1.
			op := currentCond at: 2.
			val := currentCond at: 3.
			bad := false.
			(name = 'type') ifTrue: [
				(op = '==') ifTrue: [
					(shapename = val) ifFalse: [
						^ false
					]
				].
				(op = '~=') ifTrue: [
					(shapename ~= val) ifFalse: [
						^ false
					]
				].
				(op = '<') ifTrue: [
					(shapename < val) ifFalse: [
						^ false
					]
				].
				(op = '>') ifTrue: [
					(shapename > val) ifFalse: [
						^ false
					]
				].
				(op = '<=') ifTrue: [
					(shapename <= val) ifFalse: [
						^ false
					]
				].
				(op = '>=') ifTrue: [
					(shapename >= val) ifFalse: [
						^ false
					]
				].
			].
			val := val asNumber.
			(name = 'area') ifTrue: [
				(op = '==') ifTrue: [
					(self getArea = val) ifFalse: [
						^ false
					]
				].
				(op = '~=') ifTrue: [
					(self getArea ~= val) ifFalse: [
						^ false
					]
				].
				(op = '<') ifTrue: [
					(self getArea < val) ifFalse: [
						^ false
					]
				].
				(op = '>') ifTrue: [
					(self getArea > val) ifFalse: [
						^ false
					]
				].
				(op = '<=') ifTrue: [
					(self getArea <= val) ifFalse: [
						^ false
					]
				].
				(op = '>=') ifTrue: [
					(self getArea >= val) ifFalse: [
						^ false
					]
				].
			].
			(name = 'volume') ifTrue: [
				(op = '==') ifTrue: [
					(self getVolume = val) ifFalse: [
						^ false
					]
				].
				(op = '~=') ifTrue: [
					(self getVolume ~= val) ifFalse: [
						^ false
					]
				].
				(op = '<') ifTrue: [
					(self getVolume < val) ifFalse: [
						^ false
					]
				].
				(op = '>') ifTrue: [
					(self getVolume > val) ifFalse: [
						^ false
					]
				].
				(op = '<=') ifTrue: [
					(self getVolume <= val) ifFalse: [
						^ false
					]
				].
				(op = '>=') ifTrue: [
					(self getVolume >= val) ifFalse: [
						^ false
					]
				].
			].
		].
		^ true
	]

	getInfo [
		^ 'Torus: ' , self getName , ', Small Radius=' , smallradius printString, ', Big Radius=' , bigradius printString, '
	Surface area: ', self getArea printString, ', Volume: ', self getVolume printString
	]

]