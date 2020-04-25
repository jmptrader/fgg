# Temporary makefile for testing, e.g., -monom
# TODO: ^should be integrated with `go test` instead
# TODO: but if this makefile is to be retained, needs refactoring


#.PHONY: build
#build:
#	go build github.com/rhu1/fgg
#
#
#.PHONY: install
#install:
#	go install github.com/rhu1/fgg

.PHONY: test
test: test-all

.PHONY: test-all
test-all: test-fg test-fgg test-fg2fgg test-monom test-oblit


.PHONY: clean
clean: clean-test-all

#rm -f ../../../../bin/fgg.exe
#make test-clean


.PHONY: test-fg
test-fg: test-fg-unit test-fg-examples


.PHONY: test-fg-unit
test-fg-unit:
	go test github.com/rhu1/fgg/fg


.PHONY: test-fg-examples
test-fg-examples:
	go run github.com/rhu1/fgg -eval=10 fg/examples/hello/hello.go
	go run github.com/rhu1/fgg -eval=10 fg/examples/hello/fmtprintf.go
	go run github.com/rhu1/fgg -eval=-1 fg/examples/popl20/booleans/booleans.go
	go run github.com/rhu1/fgg -eval=-1 fg/examples/popl20/compose/compose.go
	go run github.com/rhu1/fgg -eval=-1 fg/examples/popl20/equal/equal.go
	go run github.com/rhu1/fgg -eval=-1 fg/examples/popl20/incr/incr.go
	go run github.com/rhu1/fgg -eval=-1 fg/examples/popl20/map/map.go
	go run github.com/rhu1/fgg -eval=-1 fg/examples/popl20/not/not.go

# TODO: currently examples testing limited to "good" examples
# TODO: check actual output, e.g.:
#     [cmd] > output.txt
#     diff output.txt correct.txt


.PHONY: test-fgg
test-fgg: test-fgg-unit test-fgg-examples
# add monom + oblit?


.PHONY: test-fgg-unit
test-fgg-unit:
	go test github.com/rhu1/fgg/fgg


.PHONY: test-fgg-examples
test-fgg-examples:
	go run github.com/rhu1/fgg -fgg -eval=10 fgg/examples/hello/hello.fgg
	go run github.com/rhu1/fgg -fgg -eval=10 fgg/examples/hello/fmtprintf.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 fgg/examples/popl20/booleans/booleans.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 fgg/examples/popl20/compose/compose.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 fgg/examples/popl20/graph/graph.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 fgg/examples/popl20/irregular/irregular.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 fgg/examples/popl20/map/map.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 fgg/examples/popl20/monomorph/monomorph.fgg
	go run github.com/rhu1/fgg -fgg -eval=10 fgg/examples/monom/box/box.fgg
	go run github.com/rhu1/fgg -fgg -eval=10 fgg/examples/monom/box/box2.fgg


.PHONY: test-monom
test-monom:
	mkdir -p tmp/test/fg/booleans
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/booleans/booleans.go fgg/examples/popl20/booleans/booleans.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/booleans/booleans.go

	mkdir -p tmp/test/fg/compose
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/compose/compose.go fgg/examples/popl20/compose/compose.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/compose/compose.go

	mkdir -p tmp/test/fg/graph
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/graph/graph.go fgg/examples/popl20/graph/graph.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/graph/graph.go

	mkdir -p tmp/test/fg/irregular
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/irregular/irregular.go fgg/examples/popl20/irregular/irregular.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/irregular/irregular.go

	mkdir -p tmp/test/fg/map
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/map/map.go fgg/examples/popl20/map/map.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/map/map.go

	mkdir -p tmp/test/fg/monomorph
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/monomorph/monomorph.go fgg/examples/popl20/monomorph/monomorph.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monomorph/monomorph.go

	mkdir -p tmp/test/fg/monom/box
	go run github.com/rhu1/fgg -fgg -eval=10 -monomc=tmp/test/fg/monom/box/box2.go fgg/examples/monom/box/box2.fgg
	go run github.com/rhu1/fgg -eval=10 tmp/test/fg/monom/box/box2.go

	mkdir -p tmp/test/fg/monom/julien
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/monom/julien/ifacebox.go fgg/examples/monom/julien/ifacebox.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/ifacebox.go
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/monom/julien/ifacebox-nomethparam.go fgg/examples/monom/julien/ifacebox-nomethparam.fgg
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/ifacebox-nomethparam.go
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/monom/julien/iface-embedding-simple.go fgg/examples/monom/julien/iface-embedding-simple.go
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/iface-embedding-simple.go
	go run github.com/rhu1/fgg -fgg -eval=-1 -monomc=tmp/test/fg/monom/julien/iface-embedding.go fgg/examples/monom/julien/iface-embedding.go
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/iface-embedding.go
	go run github.com/rhu1/fgg -fgg -monomc=tmp/test/fg/monom/julien/rcver-iface.go fgg/examples/monom/julien/rcver-iface.go
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/rcver-iface.go
	go run github.com/rhu1/fgg -fgg -monomc=tmp/test/fg/monom/julien/one-pass-prob.go fgg/examples/monom/julien/one-pass-prob.go
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/one-pass-prob.go
	go run github.com/rhu1/fgg -fgg -monomc=tmp/test/fg/monom/julien/contamination.go fgg/examples/monom/julien/contamination.go
	go run github.com/rhu1/fgg -eval=-1 tmp/test/fg/monom/julien/contamination.go


# check simulation of -monomc output (same result and number of eval steps) -- or commutative diagram
.PHONY: simulate-monom
simulate-monom:
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/popl20/booleans/booleans.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/popl20/compose/compose.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/popl20/graph/graph.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/popl20/irregular/irregular.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/popl20/map/map.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/popl20/monomorph/monomorph.fgg
	go run github.com/rhu1/fgg -test-monom -eval=10 fgg/examples/monom/box/box2.fgg

	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/ifacebox.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/ifacebox-nomethparam.fgg
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/iface-embedding-simple.go
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/iface-embedding.go
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/rcver-iface.go
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/one-pass-prob.go
	go run github.com/rhu1/fgg -test-monom -eval=-1 fgg/examples/monom/julien/contamination.go


.PHONY: simulate-oblit
simulate-oblit:
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/popl20/booleans/booleans.fgg
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/popl20/compose/compose.fgg
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/popl20/graph/graph.fgg
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/popl20/irregular/irregular.fgg
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/popl20/map/map.fgg
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/popl20/monomorph/monomorph.fgg

	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/ifacebox.fgg
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/ifacebox-nomethparam.fgg

	# TODO?
	#go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/iface-embedding-simple.go
	#go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/iface-embedding.go

	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/rcver-iface.go
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/one-pass-prob.go
	go run github.com/rhu1/fgg -test-oblit -eval=-1 fgg/examples/monom/julien/contamination.go


.PHONY: clean-test-monom
clean-test-monom:
	rm -f tmp/test/fg/booleans/booleans.go
	rm -fd tmp/test/fg/booleans
# TODO: use test-monom dir instead of test

	rm -f tmp/test/fg/compose/compose.go
	rm -fd tmp/test/fg/compose

	rm -f tmp/test/fg/graph/graph.go
	rm -fd tmp/test/fg/graph

	rm -f tmp/test/fg/irregular/irregular.go
	rm -fd tmp/test/fg/irregular

	rm -f tmp/test/fg/map/map.go
	rm -fd tmp/test/fg/map

	rm -f tmp/test/fg/monomorph/monomorph.go
	rm -fd tmp/test/fg/monomorph

	rm -f tmp/test/fg/monom/box/box2.go
	rm -fd tmp/test/fg/monom/box

	rm -f tmp/test/fg/monom/julien/ifacebox.go
	rm -f tmp/test/fg/monom/julien/ifacebox-nomethparam.go
	rm -f tmp/test/fg/monom/julien/iface-embedding-simple.go
	rm -f tmp/test/fg/monom/julien/iface-embedding.go
	rm -f tmp/test/fg/monom/julien/rcver-iface.go
	rm -f tmp/test/fg/monom/julien/one-pass-prob.go
	rm -f tmp/test/fg/monom/julien/contamination.go
	rm -fd tmp/test/fg/monom/julien


.PHONY: test-fg2fgg
test-fg2fgg:
	mkdir -p tmp/test/fgg/booleans
	go run github.com/rhu1/fgg/cmd/fg2fgg fg/examples/popl20/booleans/booleans.go > tmp/test/fgg/booleans/booleans.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 tmp/test/fgg/booleans/booleans.fgg

	mkdir -p tmp/test/fgg/compose
	go run github.com/rhu1/fgg/cmd/fg2fgg fg/examples/popl20/compose/compose.go > tmp/test/fgg/compose/compose.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 tmp/test/fgg/compose/compose.fgg

	mkdir -p tmp/test/fgg/equal
	go run github.com/rhu1/fgg/cmd/fg2fgg fg/examples/popl20/equal/equal.go > tmp/test/fgg/equal/equal.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 tmp/test/fgg/equal/equal.fgg

	mkdir -p tmp/test/fgg/incr
	go run github.com/rhu1/fgg/cmd/fg2fgg fg/examples/popl20/incr/incr.go > tmp/test/fgg/incr/incr.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 tmp/test/fgg/incr/incr.fgg

	mkdir -p tmp/test/fgg/map
	go run github.com/rhu1/fgg/cmd/fg2fgg fg/examples/popl20/map/map.go > tmp/test/fgg/map/map.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 tmp/test/fgg/map/map.fgg

	mkdir -p tmp/test/fgg/not
	go run github.com/rhu1/fgg/cmd/fg2fgg fg/examples/popl20/not/not.go > tmp/test/fgg/not/not.fgg
	go run github.com/rhu1/fgg -fgg -eval=-1 tmp/test/fgg/not/not.fgg

# TODO: run fg_test.go unit tests through fg2fgg


.PHONY: clean-test-fg2fgg
clean-test-fg2fgg:
	rm -f tmp/test/fgg/booleans/booleans.fgg
	rm -fd tmp/test/fgg/booleans

	rm -f tmp/test/fgg/compose/compose.fgg
	rm -fd tmp/test/fgg/compose

	rm -f tmp/test/fgg/equal/equal.fgg
	rm -fd tmp/test/fgg/equal

	rm -f tmp/test/fgg/incr/incr.fgg
	rm -fd tmp/test/fgg/incr

	rm -f tmp/test/fgg/map/map.fgg
	rm -fd tmp/test/fgg/map

	rm -f tmp/test/fgg/not/not.fgg
	rm -fd tmp/test/fgg/not


.PHONY: test-oblit
test-oblit:
	mkdir -p tmp/test-oblit/fgr/booleans
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/booleans/booleans.fgr -oblit-eval=-1 fgg/examples/popl20/booleans/booleans.fgg
# TODO: standalone FGR execution (.fgr output currently unused)
# 
	mkdir -p tmp/test-oblit/fgr/compose
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/compose/compose.fgr -oblit-eval=-1 fgg/examples/popl20/compose/compose.fgg

	mkdir -p tmp/test-oblit/fgr/graph
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/graph/graph.fgr -oblit-eval=-1 fgg/examples/popl20/graph/graph.fgg

	mkdir -p tmp/test-oblit/fgr/irregular
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/irregular/irregular.fgr -oblit-eval=-1 fgg/examples/popl20/irregular/irregular.fgg

	mkdir -p tmp/test-oblit/fgr/map
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/map/map.fgr -oblit-eval=-1 fgg/examples/popl20/map/map.fgg

	mkdir -p tmp/test-oblit/fgr/monomorph
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/monomorph/monomorph.fgr -oblit-eval=-1 fgg/examples/popl20/monomorph/monomorph.fgg

	mkdir -p tmp/test-oblit/fgr/box
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/box/box.fgr -oblit-eval=10 fgg/examples/monom/box/box.fgg
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/box/box2.fgr -oblit-eval=10 fgg/examples/monom/box/box2.fgg

	mkdir -p tmp/test-oblit/fgr/julien
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/ifacebox.fgr -oblit-eval=-1 fgg/examples/monom/julien/ifacebox.fgg
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/ifacebox-nomethparam.fgr -oblit-eval=-1 fgg/examples/monom/julien/ifacebox-nomethparam.fgg
	#go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/iface-embedding-simple.fgr -oblit-eval=-1 fgg/examples/monom/julien/iface-embedding-simple.go
	#go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/iface-embedding.fgr -oblit-eval=-1 fgg/examples/monom/julien/iface-embedding.go
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/rcver-iface.fgr -oblit-eval=-1 fgg/examples/monom/julien/rcver-iface.go
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/one-pass-prob.fgr -oblit-eval=-1 fgg/examples/monom/julien/one-pass-prob.go
	go run github.com/rhu1/fgg -fgg -oblitc=tmp/test-oblit/fgr/julien/contamination.fgr -oblit-eval=-1 fgg/examples/monom/julien/contamination.go


.PHONY: clean-test-oblit
clean-test-oblit:
	rm -f tmp/test-oblit/fgr/booleans/booleans.fgr
	rm -fd tmp/test-oblit/fgr/booleans

	rm -f tmp/test-oblit/fgr/compose/compose.fgr
	rm -fd tmp/test-oblit/fgr/compose

	rm -f tmp/test-oblit/fgr/graph/graph.fgr
	rm -fd tmp/test-oblit/fgr/graph

	rm -f tmp/test-oblit/fgr/irregular/irregular.fgr
	rm -fd tmp/test-oblit/fgr/irregular

	rm -f tmp/test-oblit/fgr/map/map.fgr
	rm -fd tmp/test-oblit/fgr/map

	rm -f tmp/test-oblit/fgr/monomorph/monomorph.fgr
	rm -fd tmp/test-oblit/fgr/monomorph

	rm -f tmp/test-oblit/fgr/box/box.fgr
	rm -f tmp/test-oblit/fgr/box/box2.fgr
	rm -fd tmp/test-oblit/fgr/box

	rm -f tmp/test-oblit/fgr/julien/ifacebox.fgr
	rm -f tmp/test-oblit/fgr/julien/ifacebox-nomethparam.fgr
	rm -f tmp/test-oblit/fgr/julien/rcver-iface.fgr
	rm -f tmp/test-oblit/fgr/julien/one-pass-prob.fgr
	rm -f tmp/test-oblit/fgr/julien/contamination.fgr
	rm -fd tmp/test-oblit/fgr/julien


.PHONY: test-monom-commut
test-monom-commut:
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/popl20/booleans/booleans.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/popl20/compose/compose.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/popl20/graph/graph.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/popl20/irregular/irregular.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/popl20/map/map.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/popl20/monomorph/monomorph.fgg
	go run github.com/rhu1/fgg -eval=10 -test-monom fgg/examples/monom/box/box2.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/ifacebox.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/ifacebox-nomethparam.fgg
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/iface-embedding-simple.go
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/iface-embedding.go
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/rcver-iface.go
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/one-pass-prob.go
	go run github.com/rhu1/fgg -eval=-1 -test-monom fgg/examples/monom/julien/contamination.go


.PHONY: clean-test-all
clean-test-all: clean-test-fg2fgg clean-test-monom clean-test-oblit

