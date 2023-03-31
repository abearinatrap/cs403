Shape subclass: Box [
	| length width height |

	Box class >> new: tempName length: tempLength width: tempWidth height: tempHeight [
		| r |
		r := super new.
		r setName: tempName.
		r setLength: tempLength.
        r setWidth: tempWidth.
        r setHeight tempHeight.
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
		^ 2 * length * width + 2 * length * height + 2 * width * height
	]

	getVolume [
		^ length * width * height
	]
		
	test: condlist [

	]

	getInfo [
		^ 'Box: ' , self getName , ', Length=', length printString, ', Width=', width printString, ', Height=', height printString
	]

]