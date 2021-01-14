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
two_week_mean_1(A) :- mean(one, 2, A).
two_week_range_1(B) :- range(one, 2, B).
four_week_mean_1(C) :- mean(one, 4, C).
four_week_range_1(D) :- range(one, 4, D).
two_week_mean_2(E) :- mean(two, 2, E).
two_week_range_2(F) :- range(two, 2, F).
four_week_mean_2(G) :- mean(two, 4, G).
four_week_range_2(H) :- range(two, 4, H).
two_week_mean_3(I) :- mean(three, 2, I).
two_week_range_3(J) :- range(three, 2, J).
four_week_mean_3(K) :- mean(three, 4, K).
four_week_range_3(L) :- range(three, 4, L).
two_week_mean_4(M) :- mean(four, 2, M).
two_week_range_4(N) :- range(four, 2, N).
four_week_mean_4(O) :- mean(four, 4, O).
four_week_range_4(P) :- range(four, 4, P).
two_week_mean_5(Q) :- mean(five, 2, Q).
two_week_range_5(R) :- range(five, 2, R).
four_week_mean_5(S) :- mean(five, 4, S).
four_week_range_5(T) :- range(five, 4, T).  
two_week_mean_6(U) :- mean(six, 2, U).
two_week_range_6(V) :- range(six, 2, V).
four_week_mean_6(W) :- mean(six, 4, W).
four_week_range_6(X) :- range(six, 4, X).
two_week_mean_7(Y) :- mean(seven, 2, Y).
two_week_range_7(Z) :- range(seven, 2, Z).
four_week_mean_7(AA) :- mean(seven, 4, AA).
four_week_range_7(AB) :- range(seven, 4, AB).
two_week_mean_8(AC) :- mean(eight, 2, AC).
two_week_range_8(AD) :- range(eight, 2, AD).
four_week_mean_8(AE) :- mean(eight, 4, AE).
four_week_range_8(AF) :- range(eight, 4, AF).
two_week_mean_9(AG) :- mean(nine, 2, AG).
two_week_range_9(AH) :- range(nine, 2, AH).
four_week_mean_9(AI) :- mean(nine, 4, AI).
four_week_range_9(AJ) :- range(nine, 4, AJ).
