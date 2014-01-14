all: site

site:
	jekyll build
upload: site
	rsync -pvtrlL --exclude Makefile --cvs-exclude --delete _site/ boskovicko@cirdan.zmotula.cz:web/boskovicko.cz

check:
	@_bin/validate-articles.pl
shell:
	re.pl --rcfile _bin/repl.rc

clean:
	rm -rf _site
