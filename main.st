"main.st"
"A program to print 'Hello World!' to the terminal."
emps:= OrderedCollection new.
count:=0.
numArgs:= Smalltalk arguments size.
valid:= true.
employeesFile:=''.
(numArgs = 1) ifTrue:[
    employeesFile := Smalltalk arguments at: 1.
] ifFalse: [
    (numArgs = 2) ifTrue:[
        employeesFile := Smalltalk arguments at: 1.
        action := Smalltalk arguments at: 2.
    ] ifFalse: [
        (numArgs = 4) ifTrue:[
            employeesFile := Smalltalk arguments at: 1.
            action := Smalltalk arguments at: 2.
            sign := Smalltalk arguments at: 3.
            threshold := Smalltalk arguments at: 4.
        ] ifFalse: [
            valid:=false.
        ].
    ]
].
(valid) ifTrue:[
        f:= FileStream open: employeesFile mode: #read.
        b:= f nextLine.
        [f atEnd] whileFalse:
            [
                tokens:= b subStrings.
                count:= count + 1.
                ((tokens at: 1) = 'salaried') ifTrue: [
                    emps add: (Salaried new init: (tokens at: 2) 
                                            lastname: (tokens at: 3) 
                                            sal: (tokens at: 4) asNumber).
                ] ifFalse: [
                    ((tokens at: 1) = 'hourly') ifTrue: [
                    emps add: (Hourly new 
                                init: (tokens at: 2) 
                                lastname: (tokens at: 3) 
                                rate: (tokens at: 5) asNumber 
                                hours: (tokens at: 4) asNumber).
                    ] ifFalse: [
                        ((tokens at: 1) = 'commission') ifTrue: [
                        emps add: (Commission new 
                                    init: (tokens at: 2) 
                                    lastname: (tokens at: 3) 
                                    rate: (tokens at: 6)
                                    minSal: (tokens at: 4) asNumber 
                                    sales: (tokens at: 5) asNumber).
                        ].
                    ]
                ].
                b := f nextLine.
            ].

    (numArgs=2) ifTrue:[
        (action ='count') ifTrue:[
            'There are 'display.
            count display.
            ' employees' displayNl.
        ].
        (action='print') ifTrue:[
            emps do:[:emp |
                emp getInfo.
            ].
        ].
        (action='min') ifTrue:[
            min:= (emps at: 1) getEarnings.
            minworker:= emps at:1.
            emps do:[:emp |
                val:= emp getEarnings.
                (min > val) ifTrue:[
                    min:=val.
                    minworker:=emp.
                ].
            ].
            minworker getInfo.
        ].
        (action='max') ifTrue:[
            max:= (emps at: 1) getEarnings.
            maxworker:= emps at:1.
            emps do:[:emp |
                val:= emp getEarnings.
                (max < val) ifTrue:[
                    max:=val.
                    maxworker:=emp.
                ].
            ].
            maxworker getInfo.
        ].
        (action='total') ifTrue:[
            val:= 0.0.
            emps do:[:emp |
                val:= val asNumber + (emp getEarnings asNumber).
            ].
            'Total payment is $' display.
            val:= (((val asNumber) asFloat)
            asScaledDecimal: 2).
            val displayNl.
        ].
        (action='avg') ifTrue:[
            |avg|
            val:= 0.0.
            emps do:[:emp |
                val:= (val asNumber) + emp getEarnings.
            ].
            avg:= ((val asNumber) / (count asNumber)).
            'Average payment per employee is $' display.
            avg:= (((avg asNumber) asFloat)
                asScaledDecimal: 2).
            avg displayNl.

        ].
    ] ifFalse:[
        (numArgs=4) ifTrue:[
            validEmps:= OrderedCollection new.
            (sign = 'eq') ifTrue:[
                count:=0.
                emps do:[:emp |
                    ((emp getEarnings) = threshold asNumber) ifTrue:[
                        validEmps add: emp.
                        count:= (count asNumber) + 1.
                    ].
                ].
            ].
            (sign = 'ne') ifTrue:[
                count:=0.
                emps do:[:emp |
                    ((emp getEarnings) ~= threshold asNumber) ifTrue:[
                        validEmps add: emp.
                        count:= (count asNumber) + 1.
                    ].
                ].
            ].
            (sign = 'gt') ifTrue:[
                count:=0.
                emps do:[:emp |
                    ((emp getEarnings) > threshold asNumber) ifTrue:[
                        validEmps add: emp.
                        count:= (count asNumber) + 1.
                    ].
                ].
            ].
            (sign = 'ge') ifTrue:[
                count:=0.
                emps do:[:emp |
                    ((emp getEarnings) >= threshold asNumber) ifTrue:[
                        validEmps add: emp.
                        count:= (count asNumber) + 1.
                    ].
                ].
            ].
            (sign = 'lt') ifTrue:[
                count:=0.
                emps do:[:emp |
                    ((emp getEarnings) < threshold asNumber) ifTrue:[
                        validEmps add: emp.
                        count:= (count asNumber) + 1.
                    ].
                ].
            ].
            (sign = 'le') ifTrue:[
                count:=0.
                emps do:[:emp |
                    ((emp getEarnings) <= threshold asNumber) ifTrue:[
                        validEmps add: emp.
                        count:= (count asNumber) + 1.
                    ].
                ].
            ].
        (count > 0) ifTrue:[
            (action ='count') ifTrue:[
                'There are 'display.
                count display.
                ' employees' displayNl.
            ].
            (action='print') ifTrue:[
                validEmps do:[:emp |
                    emp getInfo.
                ].
            ].
            (action='min') ifTrue:[
                min:= (validEmps at: 1) getEarnings.
                minworker:= validEmps at:1.
                emps do:[:emp |
                    val:= emp getEarnings.
                    (min > val) ifTrue:[
                        min:=val.
                        minworker:=emp.
                    ].
                ].
                minworker getInfo.
            ].
            (action='max') ifTrue:[
                max:= (validEmps at: 1) getEarnings.
                maxworker:= validEmps at:1.
                validEmps do:[:emp |
                    val:= emp getEarnings.
                    (max < val) ifTrue:[
                        max:=val.
                        maxworker:=emp.
                    ].
                ].
                maxworker getInfo.
            ].
            (action='total') ifTrue:[
                val:= 0.0.
                validEmps do:[:emp |
                    val:= val asNumber + (emp getEarnings asNumber).
                ].
                'Total payment is $' display.
                val:= (((val asNumber) asFloat)
                asScaledDecimal: 2).
                val displayNl.
            ].
            (action='avg') ifTrue:[
                |avg|
                val:= 0.0.
                validEmps do:[:emp |
                    val:= (val asNumber) + emp getEarnings.
                ].
                avg:= (val / count).
                'Average payment per employee is $' display.
                avg:= (((avg asNumber) asFloat)
                asScaledDecimal: 2).
                avg displayNl.

            ].
         ] ifFalse: [
            'No employees match criteria!' displayNl.
         ].
        ] ifFalse:[
            'There is nothing to do!, add an action!' displayNl.
        ]
    ]
] ifFalse:[
    'Unable to open ' display.
    employeesFile display.
    ' for reading' displayNl.
].    

