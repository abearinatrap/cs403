" <comment: 'need to read in shapes from shapes.dat into list of shapes'>"
Shapes := LinkedList new.
"
(File named: '/home/awrenninger/cs403/a6/shapes.dat') readStreamDo: [ :in |
  | characterStream |
  characterStream := ZnCharacterReadStream on: in.
  Array streamContents: [ :out |
    [ characterStream atEnd ] whileFalse: [ out nextPut: characterStream nextLine ] ] ] printNL. 
"
f := FileStream open: '/home/awrenninger/cs403/a6/shapes.dat' mode: FileStream read.
f size printNl.
line := f nextLine.
[f atEnd] whileFalse:[
	words := line substrings.
	"smalltalk arrays are 1-indexed"
	((words at: 2) = 'box') ifTrue: [
		words printNl.
        name := (words at: 1).
        tlength := (words at: 3) asNumber.
        twidth := (words at: 4) asNumber.
        theight := (words at: 5) asNumber printNl.
        newBox := Box new. 
        newBox setName: name; setLength: tlength; setWidth: twidth; setHeight: theight.
        Shapes addLast: newBox
	].
    ((words at: 2) = 'cylinder') ifTrue: [
		words printNl
        name := (words at: 1).
        tradius := (words at: 3) asNumber.
        theight := (words at: 4) asNumber printNl.
        newCylinder := Cylinder new.
        newCylinder setName: name; setRadius: tradius; setHeight: height.
	].
    ((words at: 2) = 'torus') ifTrue: [
		words printNl
	].
    ((words at: 2) = 'sphere') ifTrue: [
		words printNl
	].
	line := f nextLine.
].

"<commend: 'then need to loop on input, doing what the user wants'>"
