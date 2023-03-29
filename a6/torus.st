Shape subclass: #Torus
   instanceVariableNames: 'sradius bradius'

   Torus class >> new: aName sradius: tempsRadius bradius: tempbRadius
      ^ self new
         setName: aName;
         setSRadius: tempsRadius;
         setBRadius: tempbRadius;
         yourself

   Torus >> setSRadius: tempRadius
      radius := tempRadius

   Torus >> setBRadius: tempRadius
      radius := tempRadius


   Torus >> getArea
      ^ 2 * 2 * 3.14 * 3.14 * bradius * sradius

   Torus >> getVolume
      ^ 2 * 3.14 * 3.14 * sradius * sradius * bradius

   Torus >> test: condlist

   Torus >> getInfo
      ^ 'Torus: ' , self getName , ', Small Radius=' , sradius printString, ', Big Radius=' , bradius printString
