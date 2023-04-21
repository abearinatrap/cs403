pay(First, Last, Pay) :- salaried(First, Last, Salary),
    Pay is Salary.

pay(First, Last, Pay) :- hourly(First, Last, Hours, Rate),
    (Hours =< 40 -> Pay is Hours * Rate ;
    Hours =< 50 -> Pay is 40 * Rate + (Hours - 40) * Rate * 1.5;
    Pay is 40 * Rate + 10 * Rate * 1.5 + (Hours - 50) * Rate * 2).

pay(First, Last, Pay) :- commission(First, Last, Min_Salary, Sales, Rate),
    Commission is Sales * Rate,
    (Commission < Min_Salary -> Pay is Min_Salary; Pay is Commission).