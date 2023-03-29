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
      ^ 2 * 3.14 * radius * height + 2 * 3.14 * radius * radius
   ]

   getVolume [
      ^ 3.14 * radius * radius * height
   ]
      
   test: condlist [

   ]

   getInfo [
      ^ 'Cylinder: ' , self getName , ', Radius=' , radius printString, ', Height=', height printString
   ]

]