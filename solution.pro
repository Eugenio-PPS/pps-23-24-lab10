search(X, cons(X, _)).
search(X, cons(_, Xs)) :- search(X, Xs).

search2 (X , cons (X , cons (X , _ ) ) ).
search2 (X , cons (_ , Xs ) ) :- search2 (X , Xs ).

search_two (X , cons (X , cons (_ , cons(X, _) ) ) ).
search_two (X , cons (_ , Xs ) ) :- search_two (X , Xs ).

search_anytwo (X , cons (X , T )) :- search(X, T).
search_anytwo (X , cons (_ , Xs ) ) :- search_anytwo (X , Xs ).

size(nil, zero).
size(cons(_, T), s(N)) :- size(T, N).
% It allows for a pure relational behaviour: size(L, s(s(s(zero)))). -> L / cons(_1195,cons(_1197,cons(_1199,nil)))

sum_list(nil, zero).
sum_list(cons(zero, T), X) :- sum_list(T, X).
sum_list(cons(s(N), T), s(X)) :- sum_list(cons(N, T), X).

count(L, E, N) :- count(L, E, zero, N).
count(nil, _, P, P).
count(cons(E, T), E, P, N) :- count(T, E, s(P), N).
count(cons(E, L), E2, N, M) :- E \= E2, count(L , E2 , N , M ).

greater(s(zero), zero).
greater(s(A), s(B)) :- greater(A, B).
greater(s(A), B) :- greater(A, B).

max(cons(H, T), N) :- max(T, H, N).
max(nil, P, P).
max(cons(E, T), P, N) :- greater(E, P), max(T, E, N).
max(cons(E, T), P, N) :- greater(P, E), max(T, P, N).

min(cons(H, T), N) :- min(T, H, N).
min(nil, P, P).
min(cons(E, T), P, N) :- greater(P, E), min(T, E, N).
min(cons(E, T), P, N) :- greater(E, P), min(T, P, N).

min-max(L, Ma, Mi) :- min(L, Mi), max(L, Ma).

same(nil, nil).
same(cons(X, A), cons(Y, B)) :- X=Y, same(A, B).

all_bigger(nil, nil).
all_bigger(cons(X, A), cons(Y, B)) :- greater(X, Y), all_bigger(A, B).

sublist(nil, _).
sublist(cons(H, T), L) :- search(H, L), sublist(T, L).

seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).

seqR(zero, nil).
seqR(s(N), cons(N, List)) :- seqR(N, List).

isnil(nil).

appendlast(nil, A, cons(A, nil)).
appendlast(cons(H, T), A, cons(H, cons(A, nil))) :- isnil(T), appendlast(T, A, cons(A, nil)).
appendlast(cons(H, T), A, cons(H, T1)) :- appendlast(T, A, T1).

% Does not work!
seqR2(zero, nil).
seqR2(s(N), cons(N, List)) :- appendlast(List, N, X), seqR2(N, X).

% ____            _     ____
%|  _ \ __ _ _ __| |_  | ___|
%| |_) / _` | '__| __| |___ \
%|  __| (_| | |  | |_   ___) |
%|_|   \__,_|_|   \__| |____/

% last(L, X) is true if the list L ends with X
last(cons(X, nil), X).
last(cons(H, T), X) :- last(T, X).
% last(cons(a, cons(b, nil)), b) -> yes
% last(cons(a, cons(b, nil)), a) -> no
% last(cons(a, cons(b, nil)), X) -> yes, X/b

% add_one(L, M) M is a list with all elements in L incremented by one
add_one(nil, nil).
add_one(cons(s(N), T), cons(s(s(N)), T)) :- add_one(T, T).
% add_one(cons(s(zero), nil), cons(s(s(zero)), nil)) -> yes
% last(nil, _) -> no

is_not_zero(s(_)).

% filter_not_zero(L, M) M is a sublist of L without elements <= 0
filter_not_zero(nil, nil).
filter_not_zero(cons(LH, LT), cons(LH, MT)) :- is_not_zero(LH), filter_not_zero(LT, MT).
filter_not_zero(cons(LH, LT), M) :- filter_not_zero(LT, M).
% filter_not_zero(cons(zero, cons(s(zero), nil)), cons(s(zero), nil))

% count_greater_zero(L, N) N is the number of elements in L > 0
count_greater_zero(L, N) :- filter_not_zero(L, M), size(M, N).
% count_greater_zero(cons(zero, cons(s(zero), nil)), s(zero))

% find_greater_zero(L, X) X is an element in L | X > 0
find_greater_zero(cons(H, T), X) :- find_greater_zero(T, X).
find_greater_zero(cons(H, T), H) :- is_not_zero(H).
% find_greater_zero(cons(s(zero), cons(zero, cons(s(s(zero)), nil))), X) -> yes, X/s(zero), X/s((s(zero))
