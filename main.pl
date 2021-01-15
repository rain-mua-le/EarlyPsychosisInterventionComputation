%rule to find length of list
len([], 0).
len([Head|Tail], N) :- len(Tail, M), N is M + 1.

%rule to get the first element of a list
first_element([Head|Tail], Head).

%rule to get the last element of a list
last_element([X], X).
last_element([Head|Tail], Last) :- last_element(Tail, Last).

%rule to get range of of a list
range(List, Range) :- first_element(List, First), last_element(List, Last), Range is First - Last.

%rule to get the accumulated sum of a list
add([], 0).
add([H|T], Sum) :- add(T, X), Sum is X + H.

%rule to find the mean of the of a list
mean(List, Average) :- len(List, N), add(List, Sum), Average is Sum / N.

%calculate mean and ranges for all questions over a two and four week period
two_week_mean_1(X) :- one_2(Z), mean(Z, X).
two_week_range_1(X) :- one_2(Z), range(Z, X).
four_week_mean_1(X) :- one_4(Z), mean(Z, X).
two_week_mean_2(X) :- two_2(Z), mean(Z, X).
two_week_range_2(X) :- two_2(Z), range(Z, X).
four_week_mean_2(X) :- two_4(Z), mean(Z, X).
two_week_mean_3(X) :- three_2(Z), mean(Z, X).
two_week_range_3(X) :- three_2(Z), range(Z, X).
four_week_mean_3(X) :- three_4(Z), mean(Z, X).
two_week_mean_4(X) :- four_2(Z), mean(Z, X).
two_week_range_4(X) :- four_2(Z), range(Z, X).
four_week_mean_4(X) :- four_4(Z), mean(Z, X).
two_week_mean_5(X) :- five_2(Z), mean(Z, X).
two_week_range_5(X) :- five_2(Z), range(Z, X).
four_week_mean_5(X) :- five_4(Z), mean(Z, X).
two_week_mean_6(X) :- six_2(Z), mean(Z, X).
two_week_range_6(X) :- six_2(Z), range(Z, X).
four_week_mean_6(X) :- six_4(Z), mean(Z, X).
two_week_mean_7(X) :- seven_2(Z), mean(Z, X).
two_week_range_7(X) :- seven_2(Z), range(Z, X).
four_week_mean_7(X) :- seven_4(Z), mean(Z, X).
two_week_mean_8(X) :- eight_2(Z), mean(Z, X).
two_week_range_8(X) :- eight_2(Z), range(Z, X).
four_week_mean_8(X) :- eight_4(Z), mean(Z, X).
two_week_mean_9(X) :- nine_2(Z), mean(Z, X).
two_week_range_9(X) :- nine_2(Z), range(Z, X).
four_week_mean_9(X) :- nine_4(Z), mean(Z, X).

%rule to determine if there is a healthy trend of no symptoms over the past four weeks
healthy_trend :- four_week_mean_1(1), four_week_mean_2(1), four_week_mean_3(1), four_week_mean_4(1), four_week_mean_5(1), four_week_mean_6(1), four_week_mean_7(1), four_week_mean_8(1), four_week_mean_9(1).

%rule to determine if person is healthy at the moment (has no symptoms the current week)
healthy_atm :- one(A), last_element(A, 1), two(B), last_element(B, 1), three(C), last_element(C, 1), four(D), last_element(D, 1), five(E), last_element(E, 1), six(F), last_element(F, 1), seven(G), last_element(G, 1), eight(H), last_element(H, 1), nine(I), last_element(I, 1).

%rule to determine if person is experiencing prodromal symptoms consistently over the last two weeks
experiencing_prodromal_symptoms_trend :- two_week_mean_1(A), A > 1, two_week_mean_2(B), B > 1, two_week_mean_3(C), C > 1, two_week_mean_4(D), D > 1, two_week_mean_5(E), E > 1, two_week_mean_6(F), F > 1, two_week_mean_8(G), G > 1.

%rule to determine if person is experiencing prodromal symptoms at the moment in the current week
experiencing_prodromal_symptoms_atm :- one(AA), last_element(AA, A), A > 1, two(BB), last_element(BB, B), B > 1, three(CC), last_element(CC, C), C > 1, four(DD), last_element(DD, D), D > 1, five(EE), last_element(EE, E), E > 1, six(FF), last_element(FF, F), F > 1, eight(GG), last_element(GG, G), G > 1.

%rule to determine if person is experiencing positive symptoms consistently over the last two weeks
positive_symptoms_trend :- two_week_mean_7(A), A > 1, two_week_mean_9(B), B > 1.

%rule to determine if person is experiencing positive symptoms at the moment
positive_symptoms_atm :- seven(AA), last_element(AA, A), A > 1, nine(BB), last_element(BB, B), B > 1.

%rule to determine if the person is experiencing a decrease in symptoms
decrease_symptoms :- two_week_range_1(A), A > 0, two_week_range_2(B), B > 0, two_week_range_3(C), C > 0, two_week_range_4(D), D > 0, two_week_range_5(E), E > 0, two_week_range_6(F), F > 0, two_week_range_7(G), G > 0, two_week_range_8(H), H > 0, two_week_range_9(I), I > 0.

%rule to determine if person is in healthy phase
healthy :- healthy_trend, write('In healthy phase').
healthy :- healthy_atm, write('In healthy phase').

%rule to determine if person is in prodromal phase
prodromal :- experiencing_prodromal_symptoms_trend, not positive_symptom_trend, write('In prodromal phase').
prodromal :- experiencing_prodromal_symptoms_atm, not positive_symptoms_atm, write('In prodromal phase').

%rule to determine if person is in acute phase
acute :- positive_symptoms_trend, write('In acute phase').
acute :- positive_symptoms_atm, write('In acute phase').

%rule to determine if person is in recovery phase
recovery :- experiencing_prodromal_symptoms_trend, positive_symptoms_trend, decrease_symptoms, write('In recovery phase').

%queries
%?- healthy.
%?- prodromal.
%?- acute.
?- recovery.
