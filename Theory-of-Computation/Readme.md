### Theory of Computation:

Computational problems : Eg. Graph reachability problem
Computational devices : CPU, GPU, calc: What problems can be solved / cannot be solved. Mathematical proofs
Computational model:

Automaton (Singular) - Automata (Plural)
1. Finite Automata: Finite states/memory ---> Electric switch - finite states <br>
-----> Fan regulator --- multiple states, but still finite <br>
-----> Strings L = {x | x is binary string div by 4} ---> create finite automata with four states 00, 01, 10, 11

**Deterministic Finite Automaton (DFA)**: 5 tuple represented by (Q, Σ, δ, q0, F)
 where Q is the set of all possible states
 Σ is the alphabet, δ is the transition function [Q * Σ ----> Q], q0 is the starting state, F is the set of all accept states(from Q) <br>
 
A DFA 'M' = (Q, Σ, δ, q0, F) accepts a string 'w' if starting at the start state q0, the DFA ends at an accept state on reading the string<br>
The DFA 'M' accepts a language 'L' if every string in 'L' is accepted by the DFA and no more (there should not be other strings not part of 'L' that are accepted by 'M')
ALso called as 'M recognizes L'

Notes: For a language 'L', there can be infinitely many DFAs accepting it. But every DFA accepts exactly one language. <br>
-----> Transition function (q [state], a [symbol]) --> q' new state. This is why its called DETERMINISTIC! <br>
-----> The set of states in a DFA partitions the set of strings in the language. The set of states is finite <br>

L is regular if there exists a DFA M such that M accepts L <br>
Are there languages that are not regular ---> Are there languages that do not have a DFA accepting it? yes, but Prove this mathematically! <br>
Eg. L = {0^n 1^n | n>= 0} is not regular <br>

Dump state - State from where an automaton cannot reach an accept state





* **Non-Regular Languages**: There does not exist an NFA accepting the language.
  * Pumping Lemma: If L is a regular language, then there exists 'p' >= 0, S.T. for all strings 'w' in L with |w| >= p, there exists a partition w = xyz, s.t. |xy| <= p and |y| > 0, and for all 'i' --> xy<sup>i</sup>z belongs to L  
