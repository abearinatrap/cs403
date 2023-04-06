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
		^ 4 * Float pi * radius * radius
	]

	getVolume [
		^ 4/3 * Float pi * radius * radius * radius
	]
		
	test: condlist [
		| sz |
		sz := condlist size.
		1 to: sz do: [:i |
			| currentCond name op val shapename bad |
			currentCond := condlist at: i.
			shapename := 'sphere'.
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
		^ 'Sphere: ' , self getName , ' Radius=' , radius outString, '
	Surface area: ', self getArea outString, ', Volume: ', self getVolume outString.
	]

]