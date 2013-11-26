all: upload

shell:
	cd _bin && re.pl --rcfile ./repl.rc
tests:
	cd _bin && prove tests.t
check:
	@./_bin/validate-articles.pl

site:
	jekyll build
upload: site
	rsync -pvtrlL --exclude Makefile --cvs-exclude --delete _site/ cirdan:websites/boskovicko.cz
clean:
	rm -rf _site
