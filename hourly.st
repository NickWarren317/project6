"hourly.st"
Employee subclass: Hourly[
    |rate hours|


    init: aFirstName lastname: aLastName rate: aRate hours: aHour[
        super init: aFirstName lastname: aLastName.
        rate:= aRate asNumber.
        hours:= aHour asNumber.

    ]
    getEarnings[
        |earnings num|
        (hours <= 40) ifTrue:[
            earnings:= (rate asNumber * hours).
        ] ifFalse:[
            (hours <= 50) ifTrue:[
            earnings:= (rate * 40).
            num:=hours-40.
            earnings:= earnings + (rate asNumber * num * 1.5).
            ].

            (hours > 50) ifTrue:[
            earnings:= (rate * 40).
            earnings:= earnings + (rate asNumber * 10 * 1.5).
            num:=hours-50.
            earnings:= earnings + (rate asNumber * num * 2).
            ].
        ].
        
         ^ earnings
        
    ]
    rate[
        ^ rate
    ]
    hours[
        ^ hours
    ]
    getInfo[
        |earnings h r|
        'Hourly employee: ' display.
        fname display.
        ' ' display.
        lname displayNl.
        'hours worked: ' display.
        h:= (((hours asNumber) asFloat)
        asScaledDecimal: 2).
        h display.
        ', hourly rate: ' display.
        r:= (((rate asNumber) asFloat)
        asScaledDecimal: 2).
        r displayNl.
        'earned $' display.
        earnings:= self getEarnings.
        earnings:= (((earnings asNumber) asFloat)
        asScaledDecimal: 2).
        earnings displayNl.
        '' displayNl.

    ]
]
