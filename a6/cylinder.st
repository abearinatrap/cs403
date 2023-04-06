Shape subclass: Cylinder[
   | radius height |

   Cylinder class >> new: tempName radius: tempRadius height: tempHeight [
      | r |
      r := super new.
      r setName: tempName.
      r setRadius: tempRadius.
      r setHeight: tempHeight.
      ^r
   ]

   setRadius: tempRadius [
      radius := tempRadius
   ]

   getRadius [
      ^ radius
   ]

   setHeight: tempHeight [
      height := tempHeight
   ]

   getHeight [
      ^ height
   ]

   getArea [
      ^ (2 * Float pi * radius * height) + (2 * Float pi * radius * radius)
   ]

   getVolume [
      ^ Float pi * radius * radius * height
   ]
      
   test: condlist [
      | sz |
		sz := condlist size.
		1 to: sz do: [:i |
			| currentCond name op val shapename bad |
			currentCond := condlist at: i.
			shapename := 'cylinder'.
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
      ^ 'Cylinder: ' , self getName , ', Radius=' , radius outString, ', Height=', height outString, '
	Surface area: ', self getArea outString, ', Volume: ', self getVolume outString
   ]

]