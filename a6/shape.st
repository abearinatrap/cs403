Object subclass: #Shape
   instanceVariableNames: 'name'

   Shape class >> new: aName
      ^ self new setName: aName; yourself


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