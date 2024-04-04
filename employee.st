"employee.st"
Object subclass: Employee [
    | fname lname |

    init: aFirstName lastname: aLastName[
        <category: 'initialization'>
        fname:= aFirstName.
        lname:= aLastName.
    ]

    fname [
        ^ fname
    ]
    lname [
        ^ lname
    ]

    
]
