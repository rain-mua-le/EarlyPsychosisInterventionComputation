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
