Object subclass: Main [
  Main class >> new [
    | r |
    r := super new.
    ^r
  ]

  help [
    '        count
        *** print the number of all shapes
        countN
        *** print the number of all shapes that satisfy all N conditions specified below
        *** for example: count3
        print
        *** print all shapes
        printN
        *** print all shapes that satisfy all N conditions specified below
        *** for example: print4
        min
        *** find the minimum surface area and volume of all shapes
        minN
        *** find the minimum surface area and volume of all shapes that satisfy all N conditions specified below
        *** for example: min2
        max
        *** find the maximum surface area and volume of all shapes
        maxN
        *** find the maximum surface area and volume of all shapes that satisfy all N conditions specified below
        *** for example: max3
        total
        *** find the tatal surface area and volume of all shapes
        totalN
        *** find the total surface area and volume of all shapes that satisfy all N conditions specified below
        *** for example: total4
        avg
        *** find the average surface area and volume of all shapes
        avgN
        *** find the average surface area and volume of all shapes that satisfy all N conditions specified below
        *** for example: avg2
        quit
        *** quit this program
        help
        *** print this list

Each condition shall be entered in one line and of the following format:

        name op value

        *** for example: type != box
                         area <= 1000
                         volume > 100.5

        The valid names:
                type
                area
                volume

        The valid operators:
                ==
                !=
                >=
                <=
                >
                <' displayNl.
  ]

  getAction: input [
    | j action sz |
    sz := input size.
    "get index of first digit"
    "1 to: sz do: [:x | ((input at: x) isDigit) ifTrue: [^x] ifFalse: [j := x]]."
    j := input findFirst: [:char | char isDigit].
    (j=0) ifTrue: [
      ^ input
    ].
    "numIn := (1 to: (input size) do: [:x | ((input at: x) isDigit) ifTrue: [^self]])."
    action := input copyFrom: 1 to: j-1.
    ^ action
  ]

  getNum: input [
    | j num sz |
    j := 1.
    sz := input size.
    "1 to: sz do: [:x | ((input at: x) isDigit) ifTrue: [^x] ifFalse: [j := x]]."
    j := input findFirst: [:char | char isDigit].

    (j=0) ifTrue: [
      ^ 0
    ].

    num := input copyFrom: j to: input size.
    ^ num asNumber
  ]

  condShapes: shapes conditions: conds [
    | sz endList csz |
    sz := shapes size.
    csz := conds size.
    (csz = 0) ifTrue: [
      ^ shapes
    ].
    endList := OrderedCollection new.
    1 to: sz do: [:e |
      | current add |
      current := shapes at: e.
      add := current test: conds.
      
      "
      add displayNl.
      1 to: csz do: [:j |
        | ccount |
        ' here too ' printNl.
        ccount := conds at: j.
        ccount printNl.
      ]."

      (add) ifTrue: [
        endList add: current
      ]
    ].
    ^ endList
  ]

  min: shapes [
    | minArea minVolume sz |
    sz := shapes size.
    (sz = 0) ifTrue: [
      'There are no shapes satisfying the condition(s)' displayNl.
      ^ false
    ].
    minArea := (shapes at: 1) getArea.
    minVolume := (shapes at: 1) getVolume.
    2 to: sz do: [:i |
      | cArea cVolume |
      cArea := (shapes at: i) getArea.
      (minArea > cArea) ifTrue: [
        minArea := cArea
      ].
      cVolume := (shapes at: i) getVolume.
      (minVolume > cVolume) ifTrue: [
        minVolume := cVolume
      ].
    ].
    ('min(Surface Area)=', minArea printString, '
min(Volume)=', minVolume printString) displayNl.
  ]

  max: shapes [
    | maxArea maxVolume sz |
    sz := shapes size.
    (sz = 0) ifTrue: [
      'There are no shapes satisfying the condition(s)' displayNl.
      ^ false
    ].
    maxArea := (shapes at: 1) getArea.
    maxVolume := (shapes at: 1) getVolume.
    2 to: sz do: [:i |
      | cArea cVolume |
      cArea := (shapes at: i) getArea.
      (maxArea < cArea) ifTrue: [
        maxArea := cArea
      ].
      cVolume := (shapes at: i) getVolume.
      (maxVolume < cVolume) ifTrue: [
        maxVolume := cVolume
      ].
    ].
    ('max(Surface Area)=', maxArea printString, '
max(Volume)=', maxVolume printString) displayNl.
  ]

  total: shapes [
    | totalArea totalVolume sz |
    totalArea := 0.
    totalVolume := 0.
    sz := shapes size.
    (sz = 0) ifTrue: [
      'There are no shapes satisfying the condition(s)' displayNl.
      ^ false
    ].
    1 to: sz do: [:i |
      | cArea cVolume |
      cArea := (shapes at: i) getArea.
      cVolume := (shapes at: i) getVolume.
      totalArea := totalArea + cArea.
      totalVolume := totalVolume + cVolume.
    ].
    ('total(Surface Area)=', totalArea printString, '
total(Volume)=', totalVolume printString) displayNl.
  ]

  avg: shapes [
    | totalArea totalVolume sz |
    totalArea := 0.
    totalVolume := 0.
    sz := shapes size.
    (sz = 0) ifTrue: [
      'There are no shapes satisfying the condition(s)' displayNl.
      ^ false
    ].
    1 to: sz do: [:i |
      | cArea cVolume |
      cArea := (shapes at: i) getArea.
      cVolume := (shapes at: i) getVolume.
      totalArea := totalArea + cArea.
      totalVolume := totalVolume + cVolume.
    ].
    ('avg(Surface Area)=', (totalArea / sz ) printString, '
avg(Volume)=', (totalVolume / sz) printString) displayNl.
  ]

  countShapes: shapes [
    ^ shapes size
  ]

  printCountShapes: shapes [
    ^ 'There are ', shapes size printString, ' shapes.'
  ]

  print: shapes [
    shapes do: [:each | each getInfo displayNl.]
  ]
]
" <comment: 'need to read in shapes from shapes.dat into list of shapes'>"
Shapes := OrderedCollection new.
"
(File named: '/home/awrenninger/cs403/a6/shapes.dat') readStreamDo: [ :in |
  | characterStream |
  characterStream := ZnCharacterReadStream on: in.
  Array streamContents: [ :out |
    [ characterStream atEnd ] whileFalse: [ out nextPut: characterStream nextLine ] ] ] printNL. 
"
f := FileStream open: 'shapes.dat' mode: FileStream read.
"f size printNl."
[f atEnd] whileFalse:[
  | l w h r br |
  line := f nextLine.
	words := line substrings.
  type := (words at: 2).
	"smalltalk arrays are 1-indexed"
  "words printNl."
	(type = 'box') ifTrue: [
        name := (words at: 1).
        l := (words at: 3) asNumber.
        w := (words at: 4) asNumber.
        h := (words at: 5) asNumber.
        newBox := Box new: name length: l width: w height: h.
        Shapes add: newBox
	].
  (type = 'sphere') ifTrue: [
    name := (words at: 1).
    r := (words at: 3) asNumber.
    newSphere := Sphere new: name radius: r.
    Shapes add: newSphere
	].
  (type = 'cylinder') ifTrue: [
    name := (words at: 1).
    r := (words at: 3) asNumber.
    h := (words at: 4) asNumber.
    newCylinder := Cylinder new: name radius: r height: h.
    Shapes add: newCylinder
	].
  (type = 'torus') ifTrue: [
    name := (words at: 1).
    r := (words at: 3) asNumber.
    br := (words at: 4) asNumber.
    newTorus := Torus new: name smallradius: r bigradius: br.
    Shapes add: newTorus
	].
  
].
"
(Shapes at: 2) getInfo displayNl.
(Shapes at: 3) getInfo displayNl.
(Shapes at: 4) getInfo displayNl.
(Shapes at: 5) getInfo displayNl.
(Shapes at: 6) getInfo displayNl.
(Shapes at: 7) getInfo displayNl.
"

"Shapes printNl"
"<commend: 'then need to loop on input, doing what the user wants'>"
m := Main new.

"
m min: Shapes.
m max: Shapes.
m total: Shapes.
m avg: Shapes.
condd := OrderedCollection new. condd add: 'volume'. condd add: '>='. condd add: '5'. condlist := OrderedCollection new. condlist add: condd.
conddt := OrderedCollection new. conddt add: 'volume'. conddt add: '<'. conddt add: '5'. condlist add: conddt.
condlist printNl.
a := (Shapes at: 7) test: condlist.
a displayNl.
"

[ 
  'Enter a command: ' display.
  userInput := stdin nextLine.
  userInput ~= 'quit'
]  whileTrue: [
  | ui action num tcond actualShapes goodcommand |
  ui := userInput.
  tcond := OrderedCollection new.
  action := m getAction: ui.
  num := m getNum: ui.
  goodcommand := false.
  (num = 0) ifFalse: [
    | a parts arr |
    1 to: num do: [:x | ('Enter test condition #', x printString, ': ') display. a := stdin nextLine. parts := a substrings. tcond add: parts]
  ].

  actualShapes := m condShapes: Shapes conditions: tcond.
  actualShapes displayNl.

  "select on input here"
  ( action = 'count') ifTrue: [
    goodcommand := true.
    (m printCountShapes: actualShapes) displayNl.
  ].
  ( action = 'print') ifTrue: [
    goodcommand := true.
    m print: actualShapes
  ].
  ( action = 'min') ifTrue: [
    goodcommand := true.
    m min: actualShapes.
  ].
  ( action = 'max') ifTrue: [
    goodcommand := true.
    m max: actualShapes.
  ].
  ( action = 'total') ifTrue: [
    goodcommand := true.
    m total: actualShapes.
  ].
  ( action = 'avg') ifTrue: [
    goodcommand := true.
    m avg: actualShapes.
  ].
  ( action = 'help') ifTrue: [
    goodcommand := true.
    m help.
  ].
  (goodcommand) ifFalse: [
    (action, ': invalid action
Valid actions: print count min max total avg
Enter help for help') displayNl.

  ].
]
