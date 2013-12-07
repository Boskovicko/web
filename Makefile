all: upload

site:
	jekyll build
upload: site
	rsync -pvtrlL --exclude Makefile --cvs-exclude --delete _site/ cirdan:websites/boskovicko.cz
clean:
	rm -rf _site
