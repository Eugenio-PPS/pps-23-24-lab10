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

sublist(nil, nil).
% TODO

seq(zero, _, nil).
seq(s(N), E, cons(E, T)) :- seq(N, E, T).

seqR(zero, nil).
seqR(s(N), s(zero, List)) :- seqR(N, List).
