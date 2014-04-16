# Obsah repository

Tento projekt obsahuje zdrojový kód webu novin včetně databáze článků. Web je staticky generovaný, což znamená, že ho tvoří hromada souborů, ze kterých se pomocí speciálního programu ([Jekyll]) vygeneruje výsledná podoba. Obrázky jsou uložené jinde: zčásti na serveru [imgur], zčásti na vlastním obrázkovém serveru novin.

[Jekyll]: http://jekyllrb.com
[imgur]: http://boskovicko.imgur.com/all/

# Databáze článků

Databázi článků tvoří hromada souborů uložených v adresáři `_posts`. Články jsou psané ve formátu [Markdown], plus mají jednoduché záhlaví, které obsahuje metadata jako například titulek článku, autora a podobně.

[Markdown]: http://www.abclinuxu.cz/clanky/markdown-dokumenty-v-prostem-textu-s-minimem-namahy

# Aktualizace obsahu

Jednoduché opravy se dají dělat přímo na GitHubu, stačí v adresáři `_posts` otevřít příslušný soubor a stisknout tlačítko Edit. (Podobně můžete přidat i nový článek, stačí otevřít příslušný adresář a stisknout tlačítko `+` v jeho záhlaví.)

Výrazně pohodlnější a pro větší úpravy prakticky nezbytné je stáhnout si celý zdrojový kód na počítač, tam ve vhodném editoru (pro Windows například [MarkdownPad]) vytvořit nebo upravit články a změny zase nahrát zpět na GitHub, odkud se za pár minut samy přeloží na živý web novin.

[MarkdownPad]: http://markdownpad.com

Pro stažení zdrojového kódu z GitHubu je praktický jejich vlastní grafický klient [GitHub pro Windows][github]. A samozřejmě je třeba mít účet na GitHubu, který je součástí [organizace Boskovicko][organizace] a má přístup k projektu web.

[github]: https://windows.github.com
[organizace]: https://github.com/orgs/Boskovicko/members

Podrobnější návod na aktualizaci webu [bude postupně přibývat tady](_doc/vkladani.md).