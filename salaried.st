"salaried.st"
Employee subclass: Salaried[
    |salary|

    init: aFirstName lastname: aLastName sal: aSalary[
        super init: aFirstName lastname: aLastName.
        salary:= aSalary.
    ]
    getInfo[
        |earnings|
        'Salaried employee: ' display.
        fname display.
        ' ' display.
        lname displayNl.
        'weekly salary: ' display.
        salary displayNl.
        'earned $' display.
        salary displayNl.
        earnings:= (((salary asNumber) asFloat)
        asScaledDecimal: 2).
        '' displayNl.
    ]
    getEarnings[
        ^ salary
    ]
]

