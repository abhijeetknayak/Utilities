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
* **Context Free Languages**:
  * The language of a context free Grammar G is defined as **L(G) = { w belonging to Σ* | S -->* w }**
  * A language L is said to be a **Context Free Language** if there exists a CFG that accepts the language. That is, **L = L(G)**
  * **Regular Languages are also Context Free**
### Parse Trees
* Every internal node is a variable
* Every leaf node is either a terminal or Epsilon. If it is an epsilon, then it is the only child of its parent
* If R is an internal node and A1, A2,..., Ak are the children from left to right then R --> A1A2...Ak is a rule in the grammar G
* Concatenation of the leaves of the parse tree from left to right gives the string w accepted by the grammar G
* There may exist multiple parsee trees for a string with respect to a Grammar G. There may be grammars that have unique parsee trees for every string in the language
* **Derivations** are a sequence of substitutions that yields the string w
  * **Leftmost Derivation**: Derivation in which the leftmost variable is replaced in each step
  * A string belonging to a language is said to be ambiguous if it has 2 or more leftmost derivations (or if there exists multiple parse trees)
  * A grammar is ambiguous if there exists atleast one ambiguous string belonging to L(G)
  * A CFL is inherently ambiguous if all CFGs accepting L are ambiguous
### Chomsky Normal Form:
* If all production rules in a CFG is of the form 'A --> XY' (RHS Two variables) or 'A --> a' (RHS one symbol) where 'A', 'X', 'Y' are variables and 'a' belongs to the alphabet
* If the start variable is never on the RHS of any production rule
* The rule 'S --> Epsilon' is available depending on if the Context free Language contains Epsilon (Exception to first point) 

#### **Every Context Free Language has a Context Free Grammar that is in the Chomsky Normal Form**
### Non CFLs and Pumping Lemma:
* **Pumping Lemma:** Let L be a CFL, then there exists a 'p' >= 0 such that for all strings 'w' with |w| >=p, there exists a partition w = 'uvxyz', where |vxy| <= p and |vy| > 0, such that for all i >= 0, uv<sup>i</sup>xy<sup>i</sup>z belongs to L
* Set p = d<sup>|V| + 1</sup>, where V is the number of variables and d is the max number of symbols on the RHS of a production rule
### Pushdown Automata:
* Epsilion-NFA + Stack: A pushdoen automata has an input tape, a finite set of states and an unbounded stack
* At any point, the NFA is in state 'p' and the top-most element of the stack is 'X'. The stack has its own alphabet --> Called Stack alphabet
* After reading an input bit, the state transitions to 'q' and the to-most element of the stack can be changed to 'Y' 
* Formal Definition: A PDA is a 6 Tuple(same as NFA, includes stack alphabet as well), where the transition function is represented by (p, ai, X) --> set of (q, Y). This provides a set of such pairs because of the non-determinism of the NFA
  * There exists a set of inputs a1 ... am (belonging to alphabet<sup>* </sup>), a set of states r0 ... rm (belonging to Q) and a set of strings s0 ... sm (belonging to stack alphabet<sup>* </sup>) such that w = a1a2...am, r0 = q0, s0 = empty string (start state), rm belongs to F and (r<sub>i</sub>, Y) belongs to δ(r<sub>i - 1</sub>, ai, X), si-1 = Xt and si = Yt, where t belongs to (belonging to stack alphabet<sup>* </sup>)
* The class of languages accepted by a PDA and a CFG is the same! A language is a CFL iff there exists a PDA P such that L = L(P)
* CFGs are not closed under Intersection, Complement and Set Difference
### **Read Chapter 1 from Sipser**


