# movement demo

Toto je jednoduché demíčko konceptu enginu pro point-and-click adventury,
napsaného pomocí
[CHICKEN schemu](https://call-cc.org/)
a
[raylibu](https://www.raylib.com/).
Program je výjimečně v češtině, neb jsem se cítil trochu nostalgicky.
Pokud česky neumíte, o nic tak úžasného nepřicházíte.

## kompilace

Standardní build utils, chicken scheme a raylib musí být nainstalované.

```
cd src/
chicken-install csm foreigners matchable srfi-1
make         # pro dynamickou binárku (doporučeno)
make static  # pro statickou binárku
make package # pro statickou binárku, které se rovnou zabalí to .tar.gz
```

## použité assety

### fonty:
* [FiraCode](https://github.com/tonsky/FiraCode)

### zdroje obrázků:
* [gif cities](https://gifcities.org/)
* [4chan.org](https://4chan.org)
* kolektivní moudrost internetu
