// load fm signatures

open fm

one sig FM1, FM2, FMUnion, FMIntersection extends FM{}
one sig Fp, Fi, Fj, Fk extends Name{}

// == FM1

fact FM1Features {
	FM1.features = Fp + Fi
}

pred FM1Semantics[config:set Name] {
	--fixed
	config in FM1.features
	root[Fp,config]

	--relations
	mandatory[Fp, Fi,config]

	--formulas
}

// == FM2

fact FM2Features {
	FM2.features = Fp + Fi + Fj + Fk
}

pred FM2Semantics[config:set Name] {
	--fixed
	config in FM2.features
	root[Fp,config]

	--relations
	optional[Fp, Fi, config]
	optional[Fp, Fj, config]
	optional[Fp, Fk, config]

	--formulas
}
 
// == FMIntersection

fact FMIntersection{
	FMIntersection.features = Fp + Fi + Fj + Fk
}

pred FMIntersectionSemantics[config:set Name] {
	--fixed
	config in FMIntersection.features
	root[Fp, config]

	--relations
	mandatory[Fp, Fi, config]
	optional[Fp, Fj, config]
	optional[Fp, Fk, config]

	--formulas
}


// == Hints to generate configurations

fact configurationHints {
	some  c: set Name | Fp + Fi  in c
	some  c: set Name | Fp + Fj in c
	some  c: set Name | Fp + Fk in c
	some  c: set Name | Fp + Fi + Fj in c
	some  c: set Name | Fp + Fi + Fk in c
	some  c: set Name | Fp + Fj + Fk in c
	some  c: set Name | Fp + Fi + Fj + Fk in c
	some  c: set Name | Fp in c
	some  c: set Name | Fp not in c
	some  c: set Name | Fi in c
	some  c: set Name | Fi not in c
	some  c: set Name | Fj in c
	some  c: set Name | Fj not in c
	some  c: set Name | Fk in c
	some  c: set Name | Fk not in c
}


// == verifications

assert isIntersection1{
    all c:set Name | FMIntersectionSemantics[c] => 
		(FM1Semantics[c] and FM2Semantics[c]) 
}

assert isIntersection2{
    no c:set Name | (FM1Semantics[c] and FM2Semantics[c])  
		and not FMIntersectionSemantics[c]
}

check isIntersection1 	for 15 FM, 4 Name
check isIntersection2		for 15 FM, 4 Name

