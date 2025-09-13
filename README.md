# movement demo

Toto je jednoduché demíčko konceptu enginu pro point-and-click adventury,
napsaného pomocí
[CHICKEN schemu](https://call-cc.org/)
a
[raylibu](https://www.raylib.com/).
Program je výjimečně v češtině, neb jsem se cítil trochu nostalgicky.
Pokud česky neumíte, o nic tak úžasného nepřicházíte.

## compiling

Standardní build utils, chicken scheme a raylib musí být nainstalované.

```
cd src/
chicken-install csm foreigners matchable srfi-1
make         # to build dyamic executable (reccommended)
make static  # to build static executable
make package # to build a static executable and package it 
```

## assets used

### fonts:
* [FiraCode](https://github.com/tonsky/FiraCode)

### image-sources:
* [gif cities](https://gifcities.org/)
* [4chan.org](https://4chan.org)
* the collective wisdom of the internet
