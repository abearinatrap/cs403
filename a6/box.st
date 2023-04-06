Shape subclass: Box [
	| length width height |

	Box class >> new: tempName length: tempLength width: tempWidth height: tempHeight [
		| r |
		r := super new.
		r setName: tempName.
		r setLength: tempLength.
        r setWidth: tempWidth.
        r setHeight: tempHeight.
		^r
	]

	setLength: tempLength [
        length := tempLength
    ]

    setWidth: tempWidth [
        width := tempWidth
    ]

    setHeight: tempHeight [
        height := tempHeight
    ]

	getLength [
		^ length
	]

    getWidth [
		^ width
	]

    getHeight [
		^ height
	]

	getArea [
		^ (2 * length * width) + (2 * length * height) + (2 * width * height)
	]

	getVolume [
		^ length * width * height
	]
		
	test: condlist [
		| sz |
		sz := condlist size.
		1 to: sz do: [:i |
			| currentCond name op val shapename bad |
			currentCond := condlist at: i.
			shapename := 'box'.
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
		^ 'Box: ' , self getName , ', Length=', length outString, ', Width=', width outString, ', Height=', height outString, '
	Surface area: ', self getArea outString, ', Volume: ', self getVolume outString
	]

]