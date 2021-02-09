### Theory of Computation:

Computational problems : Eg. Graph reachability problem
Computational devices : CPU, GPU, calc: What problems can be solved / cannot be solved. Mathematical proofs
Computational model:

Automaton (Singular) - Automata (Plural)
1. Finite Automata: Finite states/memory ---> Electric switch - finite states <br>
-----> Fan regulator --- multiple states, but still finite <br>
-----> Strings L = {x | x is binary string div by 4} ---> create finite automata with four states 00, 01, 10, 11

alphabet, language, 

**Deterministic Finite Automaton (DFA)**: 5 tuple represented by (Q, Σ, δ, q0, F)
 where Q is the set of all possible states
 Σ is the alphabet, δ is the transition function [Q * Σ ----> Q], q0 is the starting state, F is the set of all accept states(from Q)
 
A DFA 'M' = (Q, Σ, δ, q0, F) accepts a string 'w' if starting at the start state q0, the DFA ends at an accept state on reading the string
The DFA 'M' accepts a language 'L' if every string in 'L' is accepted by the DFA and no more (there should not be other strings not part of 'L' that are accepted by 'M')
ALso called as 'M recognizes L'

Notes: For a language 'L', there can be infinitely many DFAs accepting it. But every DFA accepts exactly one language.
-----> Transition function (q [state], a [symbol]) --> q' new state. This is why its called DETERMINISTIC!
-----> The set of states in a DFA partitions the set of strings in the language. The set of states is finite

L is regular if there exists a DFA M such that M accepts L
Are there languages that are not regular ---> Are there languages that do not have a DFA accepting it? yes, but Prove this mathematically!
Eg. L = {0^n 1^n | n>= 0} is not regular

Dump state - State from where an automaton cannot reach an accept state
