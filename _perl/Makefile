JEKYLL_DB='../_posts'

all: validator

tests:
	prove --lib lib t/*t
validator:
	./validator.pl $(JEKYLL_DB)
shell:
	re.pl --rcfile ./etc/repl.rc
