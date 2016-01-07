# Merge Rules for Feature Models

Verification of the rules for merging feature models using [Alloy](http://alloy.mit.edu/alloy/).

### What is this ?

This project includes a set of alloy models (.als files) used to verify rules to merge feature models.
[Alloy](http://alloy.mit.edu/alloy/) is a formal language used to model and analyze different kinds of systems.
We use it to represent each one of the merge rules and validate their semantics.

### Semantics for Merging Feature Models 

In scenarios where each stakeholder model the variability in product family of her concern, it is necessary to provide mechanisms to merge (compose or combine) these concern-specific feature models to produce a model for the whole product line.
Severals proposal have been defined to perform these compositions.

Semantics for a Feature Model is the set of configurations that are compliant to the constraints defined in the model[1].
According to Schobbens et al.[1], semantics for merging feature models can be defined in terms of the semantics of the constituent models:
the resulting feature model may represent (a) _the strict union_ or (b) _the intersection_ of the sets of valid configurations of the input models.
We have defined a set of rules for merging feature models supporting both semantics.

### Differences to existing merge rules

Several authors have proposed merge rules for feature models.
However, they have defined different semantics for merging:
Segura et al.[2] proposed a set of rules, but their rules aims to produce a feature model that represent, as a minimum, the union of the products of both models.
This means that their approach do not produce a _strict union_ feature model and may include configurations that are not valid in any of the constituent models.
Mannion et al.[3] defined a different set of rules aimed to merge feature models using a different semantics.
These rules were later revisited by Aydin et al.[4][5] that correct some rules and proposed automatic solutions that the previous approach cannot solve.
In contrast to these works, our proposal provides correct merging rules supporting both semantics (_strict union_ and _intersection_).

Mannion et al.[3] proposed a set of _conflict resolution rules_: rules that apply to merge feature models when they are different one to the other.
While many of these rules correspond to a merge operation with _intersection_ semantics, the other rules aims to a merge operation with different semantics.
Our rules for _intersection_ merge are different for those defined by Mannion et al. labeled as: 3(ii), 3(iii), 3(iv), 5(ii), 5(iii), 5(iv), 5(v), 5(vi), 5(vii), 5(ix) and 5(x).
In addition, the rules labeled as 3(i), 4(ii), 4(iii), 5(iv), 5(v) and 5(vii) are modified to show that the _iif_ does not distribute over the _and_ operation.

Regarding the rules proposed by Aydin et al.[4][5], we have different merge rules for _intersection_ semantics for those labeled as 3(ii), 3(iii), 3(iv), 3(v), 5(ii), 5(iii), 5(iv), 5(v), 5(vi) and 5(ix).
In addition, we have defined merge rules for _strict union_ semantics.
This project also includes alloy models for these rules.

### Future Work

Some rules produce feature models with _cross-tree constraint relationships_ and _propositional formulae constraints_.
The resulting feature may be simplified with the use of _abstract features_ or _features group cardinalities_.
For instance, the rules for _strict union_ semantics labeled as 3(iv), 5(i), and 5(x) can be defined without including cross-tree constraints but including abstract features.
We are exploring the impact of introducing abstract features during the merge to simplify the resulting feature models.

### References

1. Pierre-Yves Schobbens, Patrick Heymans, Jean-Christophe Trigaux and
 Yves Bontemps,
  [Generic semantics of feature diagrams][1] In Computer Networks,
  51(2),
 456--479,
 2007
2. Sergio Segura,  David Benavides, Antonio Ruiz Cortés and
 Pablo Trinidad. [Automated Merging of Feature Models Using Graph Transformations][2]
  In Generative and Transformational Techniques in Software Engineering II, International Summer School, (GTTSE 2007),
 489--505,
 2007.
3. Mike Mannion, Juha Savolainen and
 Timo Asikainen,
 [Viewpoint-Oriented Variability Modeling][3] In 33rd Annual IEEE International Computer Software and Applications Conference, (COMPSAC 2009),
 67--72,
 2009.
4. Elcin Atilgan Aydin, Halit Oguztüzün, Ali H. Dogru and
 Ahmet Serkan Karatas. [Merging Multi-view Feature Models by Local Rules][4] In 9th International Conference on Software Engineering Research, Management and Applications, (SERA 2011),
 140--147,
 2011.
5. Elcin Atilgan Aydin,
 [Merging Multi-view Feature Models][5], Master Thesis, Middle East Technical University, Turkey, 2011.

[1]: http://dx.doi.org/10.1016/j.comnet.2006.08.008
[2]: http://www.isa.us.es/sites/default/files/publication_26.pdf
[3]: http://dx.doi.org/10.1109/COMPSAC.2009.19
[4]: http://dx.doi.org/10.1109/SERA.2011.34
[5]: https://etd.lib.metu.edu.tr/upload/12613965/index.pdf
