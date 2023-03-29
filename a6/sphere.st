Shape subclass: #Sphere
   instanceVariableNames: 'radius'

   Sphere class >> new: aName radius: tempRadius
      ^ self new
         setName: aName;
         setRadius: tempRadius;
         yourself

   Sphere >> setRadius: tempval
      radius := tempval

   Sphere >> getArea
      ^ 4 * 3.14 * radius * radius

   Sphere >> getVolume
      ^ 4/3 * 3.14 * radius * radius * radius

   Sphere >> test: condlist

   Sphere >> getInfo
      ^ 'Sphere: ' , self getName , '\nRadius: ' , radius printString
