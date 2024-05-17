search(X, cons(X, _ )).
search(X, cons(_ , Xs)) :- search (X, Xs).

search_anytwo(X, cons(X, T)) :- search(X, T).
search_anytwo(X, cons(_, T)) :- search_anytwo(X, T).

size(nil, zero).
size(cons(_, T), s(X)) :- size(T, X).
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

max(L, N) :- max(L, zero, N).
max(nil, P, P).
max(cons(E, T), P, N) :- greater(E, P), max(T, E, N).
max(cons(E, T), P, N) :- max(T, P, N).
