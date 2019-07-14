package fg

func fields(ds []Decl, t_S Type) []FieldDecl {
	for _, v := range ds {
		s, ok := v.(TStruct)
		if ok && s.t == t_S {
			return s.fds
		}
	}
	panic("Unknown type: " + t_S.String())
}

// Go has no overloading, meth names are a unique key
func methods(ds []Decl, t Type) map[Name]Sig {
	res := make(map[Name]Sig)
	if isStructType(ds, t) {
		for _, v := range ds {
			m, ok := v.(MDecl)
			if ok && m.t == t {
				res[m.m] = m.ToSig()
			}
		}
	} else if isInterfaceType(ds, t) {
		td := getTDecl(ds, t).(ITypeLit)
		for _, s := range td.ss {
			for _, v := range s.GetSigs() {
				res[v.m] = v
			}
		}
	} else { // Perhaps redundant if all TDecl OK checked first
		panic("Unknown type: " + t.String())
	}
	return res
}

/*func methDecl(ds []Decl, t Type, m Name) TDecl {
	for _, v := range ds {
		m, ok := v.(MDecl)
		if ok && m.t == t {
			return m
		}
	}
	panic("Method not found: " + t)
}*/

func getTDecl(ds []Decl, t Type) TDecl {
	for _, v := range ds {
		td, ok := v.(TDecl)
		if ok && td.GetType() == t {
			return td
		}
	}
	panic("Type not found: " + t)
}

func body(ds []Decl, t_S Type, m Name) (Name, []Name, Expr) {
	for _, v := range ds {
		md, ok := v.(MDecl)
		if ok && md.t == t_S && md.m == m {
			xs := make([]Name, len(md.ps))
			for i := 0; i < len(md.ps); i++ {
				xs[i] = md.ps[i].x
			}
			return md.m, xs, md.e
		}
	}
	panic("Method not found: " + t_S.String() + "." + m)
}
