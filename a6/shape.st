Object subclass: Shape
   | name |

   Shape class >> new: aName [
      <category: 'instance creation'>
      | r |
      r := super new.
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