% Facts
edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').

edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Makkah', 'Riyadh').

edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').

edge('Taif', 'Dammam').

edge('Al-Qatif', 'Madinah').
edge('Al-Qatif', 'Dammam').
edge('Dammam', 'Al-Qatif').

edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').

% Rules
travel(From, To, Path) :-
    path(From, To, [From], ReversePath),
    reverse(ReversePath, Path).

path(From, To, Visited, [To|Visited]) :-
    edge(From, To).

path(From, To, Visited, Path) :-
    edge(From, Next),
    not(member(Next, Visited)),
    path(Next, To, [Next|Visited], Path).