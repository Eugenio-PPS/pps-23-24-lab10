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
