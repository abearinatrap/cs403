Object subclass: ShapeList [
    | shapes |

    ShapeList class >> new [
        | r |
        r := super new.
        r initShapes.
        ^r
    ]

    initShapes [
        shapes := List new
    ]
]