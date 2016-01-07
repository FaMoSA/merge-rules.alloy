// Alloy encoding for Feature Models

abstract sig FM {
 features: set Name
}

sig Name{}

pred root[feature:Name, config:set Name] {
    feature in config
}

pred optional[parent,child:Name, config:set Name] {
    child in config => parent in config
}

pred mandatory[parent,child:Name, config:set Name] {
    child in config <=> parent in config
}

pred nonselectable[parent,child:Name, config: set Name] {
    parent in config => not child in config
}

pred orGroup[parent:Name,children:set Name,config:set Name] {
     #children>1
     parent in config => some children & config
     all c:children | c in config => parent in config
}

pred alternative[parent:Name,children:set Name,config:set Name] {
     #children>1
     parent in config => #children & config = 1
     all c:children | c in config => parent in config
}

pred requires[f1, f2: Name, config: set Name] {
	f1 in config => f2 in config
}

pred excludes[f1, f2: Name, config: set Name] {
	f1 in config => not f2 in config
}

