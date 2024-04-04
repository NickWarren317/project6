"commission.st"
Employee subclass: Commission[
    |rate minSalary sales|

    init: aFirstName lastname: aLastName rate: aRate minSal: aMin sales: aSales[
        super init: aFirstName lastname: aLastName.
        rate:= aRate.
        minSalary:= aMin asNumber.
        sales:= aSales asNumber.
    ]
    getEarnings[
        |earnings comish|
        comish:= (rate asNumber * sales).
        (minSalary <= comish) ifTrue:[
            earnings:= comish.
        ] ifFalse: [
            earnings:= minSalary.
        ].
        ^ earnings
    ]
    rate[
        ^ rate
    ]
    minSalary[
        ^ minSalary
    ]
    sales[
        ^ sales
    ]
    getInfo[
        |earnings comish r|
        'Commission employee: ' display.
        fname display.
        ' ' display.
        lname displayNl.
        'minimum salary: ' display.
        minSalary display.
        ', sales amount: ' display.
        sales display.
        ', commission rate: ' display.
        r:= (rate asNumber * 100).
        r display.
        '%' displayNl.
        'earned $' display.
        comish:= ((rate asNumber) * sales).
        (minSalary <= comish) ifTrue:[
            earnings:= comish.
        ] ifFalse: [
            earnings:= minSalary.
        ].
        earnings:= (((earnings asNumber) asFloat)
        asScaledDecimal: 2).
        earnings displayNl.
        '' displayNl.

    ]
    
]
