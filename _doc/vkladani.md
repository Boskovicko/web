# Vkládání článků

Co je potřeba udělat pro vložení jednoho čísla:

1. Převést články do formátu Markdown
2. Vybrat, oříznout a zmenšit fotografie
3. Naplánovat, kdy který článek vyjde

Případně ještě:

- Aktualizovat fotosloupek na titulce
- Aktualizovat seznam nejčtenějších článků

## Metadata článku

Metadata (neboli „data o datech“) jsou uložena v záhlaví článku, v pevném strukturovaném formátu, aby se dala snadno zpracovat automaticky. Vypadají například takhle:

    ---
    title: Kuželkářům ani výhra nestačila
    authors: Lubomír Slezák
    category: sport
    tags:
    - okres Blansko
    - kuželky
    - 14-2014
    ---

Základní formát tedy je vždy název informace následovaný dvojtečkou a hodnotou (například `title: Titulek článku`). Následuje podrobný popis metadat, se kterými pracujeme.

### Titulek článku

Označuje se klíčem `title`. Pokud hodnota obsahuje dvojtečku (`:`), musí být uzavřena do rovných uvozovek:

    title: "Sonda teen: Vánoce"

### Titulní fotka

Označuje se klíčem `cover-photo`. Hodnotou je URL k širokoúhlému obrázku, viz podrobnější návod níže v tomto dokumentu.

### Autoři

Označují se klíčem `authors`. Pokud je autorů více, uvádí se takto:

    authors:
        - Tomáš Trumpeš
        - Andrea Šrámková

Jméno autora je potřeba uvádět vždy stejně, protože ho automaticky skládáme s informacemi uvedenými v souboru `_data/autori.yml`.

### Rubrika

Klíčové slovo `category`. Povolené hodnoty jsou *zpravodajství*, *publicistika*, *kultura*, *sport* a *napsali nám*.

### Témata

Asi nejzajímavější část metadat, označuje se klíčovým slovem `tags`. Jednotlivá témata se uvádí za sebe, oddělují se mezerou:

    tags: Boskovice školky 13-2014

Pokud některé z témat obsahuje mezeru, musí se témata zadat takto:

    tags:
        - Boskovice
        - sportovní hala
        - 13-2014

Za zmínku stojí speciální téma typu `x-2014`, které označuje, ve kterém tiskovém čísle článek vyšel. Výběr témat pro daný článek je celkově zajímavé téma, na které ještě vznikne podrobnější návod. Prozatím je dobré řídit se existujícími články.

## Pojmenování článků

Soubor s článkem se jmenuje nějak takhle:

    2014-4-9-ani-vyhra-kuzelkarum-nestacila.md

První část názvu je datum, kdy má článek vyjít, a to v pořadí rok–měsíc–den. Pokud jde o datum v budoucnosti, článek vyjde až tento den (aktuálně kolem šesté ráno).

Druhou část názvu tvoří takzvaný slimák (z anglického *slug*, netuším, proč se tomu tak říká). Tato část názvu souboru se po publikování článku stane součástí URL článku, jeho adresy:

    http://boskovicko.cz/clanky/2014/04/09/ani-vyhra-kuzelkarum-nestacila.html

Na URL článků nám hodně záleží. Jednak s nimi přichází do styku naši čtenáři, například když někomu posílají odkaz na článek mailem, a jednak, což je možná ještě důležitější, se podle URL orientují webové vyhledávače (Google, Seznam a podobně), které tvoří desítky procent naší návštěvnosti. Lepší URL = vyšší návštěvnost.

Slimák by měl být krátký a výstižný. Smí obsahovat jen písmena bez diakritiky, pomlčky a číslice.

## Fotografie

* Titulní fotografie článků se ořezávají na širokoúhlý formát 2:1, měly by mít zhruba 1024 pixelů na šířku (= 512 pixelů na výšku).
* Jsou fotky, které by širokoúhlým ořezem vysloveně utrpěly. Klasickým příkladem budiž například fotografie vítěze s diplomem, ze které byste museli oříznout tvář vítěze, nebo diplom. Takovou fotku raději nepoužijeme. (Což je hloupé; časem přijdeme na lepší řešení.)
* Fotografie do fotosloupku se ořezávají na 4:3. Maximální šířka není zásadní, řekněme 2000 pixelů.