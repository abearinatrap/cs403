Object subclass: #Shape
   instanceVariableNames: 'name'

   Shape class >> new: aName
      | r |
      r := super new.
      r init.
      r setName: aName.
      ^r


   Shape >> setName: aString
      name := aString

   Shape >> getName
      ^ name


   Shape >> getArea
      self subclassResponsibility

   Shape >> getVolume
      self subclassResponsibility

   Shape >> test: aCondition
      self subclassResponsibility

   Shape >> getInfo
      self subclassResponsibility