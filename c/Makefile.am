bin_PROGRAMS = eclipse
eclipse_SOURCES = eclipse.c
eclipse_LDADD = libeclipse.a libeclipsed.a

sources = interface.c common.c parameters.c mop-init.c kernel.c		\
types-run.c control-run.c symbol.c classes.c clos-run.c clos-define.c	\
list.c clos-seq.c mop.c class-meth.c methods.c gfunc.c method-init.c	\
predicates.c arithmetic.c conv.c hash.c type-ops.c type-seq.c		\
method-comb.c type-mops.c sequence.c seq-mod.c search.c sort.c		\
control.c numbers.c trig.c num-conv.c array.c string.c struct-run.c	\
character.c tree.c resource.c condition.c set.c alist.c bit-array.c	\
bignum.c bits.c equalp.c package.c stream.c file-stream.c		\
comp-stream.c circle.c init.c reader.c dispatch.c printer.c pretty.c	\
format.c print-object.c doc.c describer.c miscel.c random.c pathname.c	\
file.c enclose.c pkg.c \
c-pkg.c env.c

dsources = dev-meth.c env-comp.c common-comp.c prog-comp.c		\
cont-comp.c cont-comp2.c macro.c macro-comp.c opts.c number-comp.c	\
list-comp.c clos-comp.c pretty-comp.c struct-comp.c cond-comp.c		\
more-compile.c loop.c directives.c describe.c debug.c default-pp.c	\
walk-util.c walk-top.c walk-special.c literal.c evaluation.c c.c	\
file-walk.c c-walk.c prim-decs.c

staticsources = static-class.c statics-ext.c statics-int.c statics-add.c

noinst_LIBRARIES = libeclipse.a libeclipsed.a
libeclipse_a_SOURCES = $(staticsources) $(sources)
libeclipsed_a_SOURCES = $(dsources) initd.c
