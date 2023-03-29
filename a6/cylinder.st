Shape subclass: #Cylinder
   instanceVariableNames: 'radius height'

   Cylinder class >> new: aName radius: tempRadius height: tempHeight
      ^ self new
         setName: aName;
         setRadius: tempRadius;
         setHeight: tempHeight
         yourself

   Cylinder >> setRadius: tempRadius
      radius := tempRadius

   Cylinder >> setHeight: tempHeight
      height := tempHeight

   Cylinder >> getArea
      ^ 2 * 3.14 * radius * height + 2 * 3.14 * radius * radius

   Cylinder >> getVolume
      ^ 3.14 * radius * radius * height

   Cylinder >> test: condlist

   Cylinder >> getInfo
      ^ 'Cylinder: ' , self getName , ', Radius=' , radius printString, ', Height=', height printString
