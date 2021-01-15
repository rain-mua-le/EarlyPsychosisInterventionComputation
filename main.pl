#include "list.pl"

%rule to get the last N weeks of a list
get_weeks(List, N, LastN) :- length(LastN, N), append(_, LastN, List).

%rule to get the first element of a list
first_element(List, First) :- append(First, _, List).

%rule to get the last element of a list
last_element(List, Last) :- append(_, [Last], List).

%rule to get range of the last N weeks of a list
range(List, N, Range) :- get_weeks(List, N, LastN), first_element(LastN, First), last_element(LastN, Last), Range is First - Last.

%rule to get the accumulated sum of a list
add([], 0).
add([H|T], Sum) :- add(T, X), Sum is X + H.

%rule to find the mean of the last N weeks of a list
mean(List, N, Average) :- get_weeks(List, N, LastN), add(LastN, Sum), Average is Sum / N.

%calculate mean and ranges for all questions over a two and four week period
two_week_mean_1(X) :- length(one, Y) >= 2, mean(one, 2, X).
two_week_range_1(X) :- length(one, Y) >= 2, range(one, 2, X).
four_week_mean_1(X) :- length(one, Y) >= 4, mean(one, 4, X).
two_week_mean_2(X) :- length(two, Y) >= 2, mean(two, 2, X).
two_week_range_2(X) :- length(two, Y) >= 2, range(two, 2, X).
four_week_mean_2(X) :- length(two, Y) >= 4, mean(two, 4, X).
two_week_mean_3(X) :- length(three, Y) >= 2, mean(three, 2, X).
two_week_range_3(X) :- length(three, Y) >= 2, range(three, 2, X).
four_week_mean_3(X) :- length(three, Y) >= 4, mean(three, 4, X).
two_week_mean_4(X) :- length(four, Y) >= 2, mean(four, 2, X).
two_week_range_4(X) :- length(four, Y) >= 2, range(four, 2, X).
four_week_mean_4(X) :- length(four, Y) >= 4, mean(four, 4, X).
two_week_mean_5(X) :- length(five, Y) >= 2, mean(five, 2, X).
two_week_range_5(X) :- length(five, Y) >= 2, range(five, 2, X).
four_week_mean_5(X) :- length(five, Y) >= 4, mean(five, 4, X).
two_week_mean_6(X) :- length(six, Y) >= 2, mean(six, 2, X).
two_week_range_6(X) :- length(six, Y) >= 2, range(six, 2, X).
four_week_mean_6(X) :- length(six, Y) >= 4, mean(six, 4, X).
two_week_mean_7(X) :- length(seven, Y) >= 2, mean(seven, 2, X).
two_week_range_7(X) :- length(seven, Y) >= 2, range(seven, 2, X).
four_week_mean_7(X) :- length(seven, Y) >= 4, mean(seven, 4, X).
two_week_mean_8(X) :- length(eight, Y) >= 2, mean(eight, 2, X).
two_week_range_8(X) :- length(eight, Y) >= 2, range(eight, 2, X).
four_week_mean_8(X) :- length(eight, Y) >= 4, mean(eight, 4, X).
two_week_mean_9(X) :- length(nine, Y) >= 2, mean(nine, 2, X).
two_week_range_9(X) :- length(nine, Y) >= 2, range(nine, 2, X).
four_week_mean_9(X) :- length(nine, Y) >= 4, mean(nine, 4, X).

%rule to determine if there is a healthy trend of no symptoms over the past four weeks
healthy_trend :- four_week_mean_1(0), four_week_mean_2(0), four_week_mean_3(0), four_week_mean_4(0), four_week_mean_5(0), four_week_mean_6(0), four_week_mean_7(0), four_week_mean_8(0), four_week_mean_9(0).

%rule to determine if person is healthy at the moment (has no symptoms the current week)
healthy_atm :- last_element(one, 0), last_element(two, 0), last_element(three, 0), last_element(four, 0), last_element(five, 0), last_element(six, 0), last_element(seven, 0), last_element(eight, 0), last_element(nine, 0).

%rule to determine if person is experiencing prodromal symptoms consistently over the last two weeks
experiencing_prodromal_symptoms_trend :- two_week_mean_1(A) > 1, two_week_mean_2(B) > 1, two_week_mean_3(C) > 1, two_week_mean_4(D) > 1, two_week_mean_5(E) > 1, two_week_mean_6(F) > 1, two_week_mean_8(G) > 1.

%rule to determine if person is experiencing prodromal symptoms at the moment in the current week
experiencing_prodromal_symptoms_atm :- last_element(one, A) > 1, last_element(two, B) > 1, last_element(three, C) > 1, last_element(four, D) > 1, last_element(five, E) > 1, last_element(six, F) > 1, last_element(eight, G) > 1.

%rule to determine if person is experiencing positive symptoms consistently over the last two weeks
positive_symptoms_trend :- two_week_mean_7(A) > 1, two_week_mean_9(B) > 1.

%rule to determine if person is experiencing positive symptoms at the moment
positive_symptoms_atm :- last_element(seven, A) > 1, last_element(nine, B) > 1.

%rule to determine if the person is experiencing a decrease in symptoms
decrease_symptoms :- two_week_range_1(A) < 0, two_week_range_2(B) < 0, two_week_range_3(C) < 0, two_week_range_4(D) < 0, two_week_range_5(E) < 0, two_week_range_6(F) < 0, two_week_range_7(G) < 0, two_week_range_8(H) < 0, two_week_range_9(I) < 0.

%rule to determine if person is in healthy phase
healthy :- healthy_trend; healthy_atm.

%rule to determine if person is in prodromal phase
prodromal :- experiencing_prodromal_symptoms_trend; experiencing_prodromal_symptoms_atm, not positive_symptoms_trend, not positive_symptoms_atm.

%rule to determine if person is in acute phase
acute :- positive_symptoms_trend; positive_symptoms_atm.

%rule to determine if person is in recovery phase
recovery :- experiencing_prodromal_symptoms_trend; experiencing prodromal_symptoms_atm, positive_symptoms_trend; positive_symptoms_atm, decrease_symptoms.

%queries
?- healthy
?- prodromal
?- acute
?- recovery
