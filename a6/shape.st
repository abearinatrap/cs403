Object subclass: #Shape
   | name |

   Shape class >> new: aName [
      | r |
      r := super new.
      r init.
      r setName: aName.
      ^r
   ]

   setName: aString [
      name := aString
   ]

   getArea [
      self subclassResponsibility
   ]

   getVolume [
      self subclassResponsibility
   ]

   test: aCondition [
      self subclassResponsibility
   ]

   getInfo [
      self subclassResponsibility
   ]