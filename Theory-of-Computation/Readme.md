### Theory of Computation:

Computational problems : Eg. Graph reachability problem
Computational devices : CPU, GPU, calc: What problems can be solved / cannot be solved. Mathematical proofs
Computational model:

Automaton (Singular) - Automata (Plural)
1. Finite Automata: Finite states/memory ---> Electric switch - finite states <br>
-----> Fan regulator --- multiple states, but still finite <br>
-----> Strings L = {x | x is binary string div by 4} ---> create finite automata with four states 00, 01, 10, 11

* **Deterministic Finite Automaton (DFA)**: 5 tuple represented by (Q, Σ, δ, q0, F)
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

* Dump state - State from where an automaton cannot reach an accept state

* Regular Operations: Let A, B belong to Σ*
  * Union Operation: A U B = {x | x  belongs to A or x belongs to B} (Binary Operation)
  * Concatenation Operation: A.B = {xy | x belongs to A and y belongs to B} (Binary Operation)
  * Star Operation: A* = {x1x2 --- xk | k >= 0 and xi belongs to A for all i}(Unary Operation) --> Set of all strings! Will lead to an infinite language

* Non Determinism: 
  * The automaton can reach multiple states from a particular state
  * Computation happens simultaneously along each path
  * ε Transitions: Even without looking at the next input bit, different paths are created to different states. Also to its current state
  * The transitions in an NFA are labelled with symbols from the alphabet along with ε
  * Acceptance Criteria: If there is some computed path that leads to an accept state
  * Non-Deterministic Systems cannot be implemented in reality, but they still help in solving some problems in a more efficient manner

* Additionally, we can compare DFA and NFA to see which of these is better at computing solutions to problems. Difference between DFA and NFA:
  * Single state vs multiple state
  * Single vs Multiple computations
  * Epsilon Transitions in NFA
  * Accept states differ. In NFA, any path should reach accept state

* **Formal Defn of NFA**: 
  * Five tuple (Q, Σ, δ, q0, F) similar to DFA, where the transition function is the one that differs
  * Transition Function for NFA : Q X Σ ----> 2^q (Power set of Q - set of subsets of Q) 
* We say that an NFA 'N' accepts an input 'w' = a1a2...an, if we can write 'w' as w = b1b2...bm, where bi belongs to Σ U {epsilon}
and there exists a sequence of states r0r1....rm (may not be distinct) such that
  * r0 = q0 ----> Initial condition
  * ri belongs to δ(ri-1, bi) for all i = 1...m ----> Transition condition
  * rm belongs to F ----> Acceptance Condition
  * Acceptance of a language L =====> L(N) = {'w' belonging to Σ* | N accepts 'w' }  
* Every DFA is also an NFA! They just don't use their non-determinism
* Construction of DFA from NFA. The number of possible states in the corresponding DFA is higher. There are "Dead states" as well, which cannot be reached from the start state.
* Regular Operations: Refer video
* Regular Expressions: R is said to be a regular expression(RE) if it has one of the following forms: Proof by induction
* GNFA: Generalized NFA - an NFA with transitions marked using Regular Expressions
  * Without loss of generality we may assume that a GNFA has the following properties:
    * GNFA has a unique accept state
    * There are no incoming transitions to the start state and no outgoing transitions from the accept state. Use Epsilon transitions for this purpose
    * There are transitions from the start state to every other state and from every state to the accept state
    * There exists a transition from any non-start and non-accept states in the GNFA

#### **Week 3**:
More closure properties of regular languages
1. Complement of a language
2. Intersection of languages
3. Set Difference
4. Homomorphism - Mapping from an alphabet to a new(or same) alphabet
5. Reverse of a language - Reverse all strings. The DFA is also reversed. This gives an NFA as the result, with new start and accept states.
6. Inverse Homomorphism 
* **Non-Regular Languages**: There does not exist an NFA accepting the language.
  * Pumping Lemma: If L is a regular language, then there exists 'p' >= 0, S.T. for all strings 'w' in L with |w| >= p, there exists a partition w = xyz, s.t. |xy| <= p and |y| > 0, and for all 'i' --> xy<sup>i</sup>z belongs to L  
  * Pumping Lemma Proof: Refer Video (Using DFA and Pigeonhole Principle)
* **DFA Minimization**: Constructing equivalent DFAs which are smaller(have a smaller number of states) 
  * Construct a table of all {p, q} pairs where p and q are valid states in the DFA
  * Mark a pair {p, q} if p is an accept state and q is not (and vice versa)
  * Repeat the following until no more pairs can be marked: **Mark** {p, q} if {δ(p, a), δ(q, a)} is marked for some a belonging to the alphabet
  * Two or more states are equivalent if they are not marked!
  
### Context Free Grammars
* Models that accept regular as well as non-regular languages
* **Terminal Symbols** (Alphabet), **Variable Symbols** (can be replaced with variables and terminal symbols), **Production Rules** (Rules describing how the variables are replaced), **Start Variable** (Start point of the computation)
* **Formal Defintion of a Context Free Grammar**: A CFG is a 4-tuple (V, Σ, P, S), where V is the non-empty set of variables, Σ is the set of terminal symbols, P is a subset of V X {V U Σ}* (production rules), S belonging to V is the start variable
* **Production Rule Defn**: If A -> W is a production rule and u, v belong to {V U Σ}<sup>*</sup>, then we say that the string uAv yields uWv in one step
* For u, v belonging to {V U Σ}<sup>*</sup>, we say that u yields v if either u = v or if there exists a sequence of strinfs u0, u1, u2, ..., uK where **u0 = u, uk = v and ui-1 yields ui in one step**

### **Read Chapter 1 from Sipser**


