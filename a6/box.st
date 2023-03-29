Shape subclass: #Box
   instanceVariableNames: 'length width height'

   Box class >> new: aName length: tempLength width: tempWidth height: tempHeight 
      ^ self new
         setName: aName;
         setLength: tempLength
         setWidth: tempWidth
         setHeight: tempHeight
         yourself

   Box >> setLength: tempLength
      height := tempLength

   Box >> setWidth: tempWidth
      width := tempWidth

   Box >> setHeight: tempHeight
      height := tempHeight

   Box >> getArea
      ^ 2 * length * width + 2 * length * height + 2 * width * height

   Box >> getVolume
      ^ length * width * height

   Box >> test: condlist

   Box >> getInfo
      ^ 'Box: ' , self getName , ', Lenght=', length printString, ', Width=', width printString, ', Height=', height printString
