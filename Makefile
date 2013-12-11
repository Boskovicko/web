all: upload

site:
	jekyll build
upload: site
	rsync -pvtrlL --exclude Makefile --cvs-exclude --delete _site/ boskovicko@cirdan.zmotula.cz:web/boskovicko.cz
clean:
	rm -rf _site
