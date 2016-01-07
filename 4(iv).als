// load fm signatures

open fm

one sig FM1, FM2, FMUnion, FMIntersection extends FM{}
one sig Fp, Fi, Fj extends Name{}

// == FM1

fact FM1Features {
	FM1.features = Fp + Fi + Fj
}

pred FM1Semantics[config:set Name] {
	--fixed
	config in FM1.features
	root[Fp, config]

	--relations
	alternative[Fp, Fi + Fj, config]

	--formulas
}

// == FM2

fact FM2Features {
	FM2.features = Fp + Fi + Fj
}

pred FM2Semantics[config:set Name] {
	--fixed
	config in FM2.features
	root[Fp, config]

	--relations
	orGroup[Fp, Fi + Fj, config]

	--formulas
}
 
// == FMUnion

fact FMUnion{
	FMUnion.features = Fp + Fi + Fj
}

pred FMUnionSemantics[config:set Name] {
	--fixed
	config in FMUnion.features
	root[Fp, config]

	--relations
	orGroup[Fp, Fi + Fj, config]

	--formulas
}

// == FMIntersection

fact FMIntersection{
  FMIntersection.features = Fp + Fi + Fj
}

pred FMIntersectionSemantics[config:set Name] {
 	--fixed
	config in FMIntersection.features
 	root[Fp, config]

	--relations
	alternative[Fp, Fi + Fj, config]

	--formulas
}


// == Hints to generate configurations

fact configurationHints {
	some  c: set Name | Fp + Fi  in c
	some  c: set Name | Fp + Fj in c
	some  c: set Name | Fp + Fi + Fj in c
	some  c: set Name | Fp in c
	some  c: set Name | Fp not in c
	some  c: set Name | Fi in c
	some  c: set Name | Fi not in c
	some  c: set Name | Fj in c
	some  c: set Name | Fj not in c
}

// == verifications

assert isUnion1{
    all c:set Name | FMUnionSemantics[c] => 
		(FM1Semantics[c] or FM2Semantics[c]) 
}

assert isUnion2 {
    no c:set Name | FM1Semantics[c] and not FMUnionSemantics[c]
}

assert isUnion3 {
     no c:set Name | FM2Semantics[c] and not FMUnionSemantics[c]
}

assert isIntersection1{
    all c:set Name | FMIntersectionSemantics[c] => 
		(FM1Semantics[c] and FM2Semantics[c]) 
}

assert isIntersection2{
    no c:set Name | (FM1Semantics[c] and FM2Semantics[c])  
		and not FMIntersectionSemantics[c]
}


check isUnion1 				for 9 FM, 3 Name
check isUnion2 				for 9 FM, 3 Name
check isUnion3 				for 9 FM, 3 Name

check isIntersection1 	for 9 FM, 3 Name
check isIntersection2		for 9 FM, 3 Name

